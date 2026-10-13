//! Black-box probe of QEMU's `qemu-vdagent` chardev behind a `virtio-serial-pci-non-transitional`
//! function. QEMU runs with `-accel qtest`: this program is the guest's driver, writing guest RAM
//! and device registers through the qtest socket, and a VNC client (RFB 3.8, RFC 6143) is the
//! host's clipboard peer. Nothing here reads QEMU's source; every line logged is an observation.

use std::collections::{HashMap, VecDeque};
use std::io::{BufRead, BufReader, Read, Write};
use std::os::unix::net::{UnixListener, UnixStream};
use std::process::{Child, Command, Stdio};
use std::sync::mpsc::{channel, Receiver};
use std::sync::OnceLock;
use std::time::{Duration, Instant};

static T0: OnceLock<Instant> = OnceLock::new();
fn now_ms() -> f64 {
    T0.get_or_init(Instant::now).elapsed().as_secs_f64() * 1000.0
}
macro_rules! log {
    ($($a:tt)*) => {{ println!("[{:9.1} ms] {}", now_ms(), format!($($a)*)); }};
}

/// Every wait is on an event, bounded by this ceiling; an absence is reported with the bound.
const CEILING: Duration = Duration::from_secs(3);

// ---------------------------------------------------------------- qtest

struct Qtest {
    r: BufReader<UnixStream>,
    w: UnixStream,
}

impl Qtest {
    fn cmd(&mut self, c: &str) -> String {
        self.w.write_all(c.as_bytes()).unwrap();
        self.w.write_all(b"\n").unwrap();
        loop {
            let mut line = String::new();
            let n = self.r.read_line(&mut line).unwrap();
            assert!(n > 0, "qtest closed on {c:.60}");
            let line = line.trim_end().to_string();
            if line.starts_with("IRQ") {
                continue;
            }
            assert!(line.starts_with("OK"), "qtest {c:.60} -> {line:.200}");
            return line[2..].trim().to_string();
        }
    }
    fn num(s: &str) -> u64 {
        u64::from_str_radix(s.trim_start_matches("0x"), 16).unwrap()
    }
    fn outl(&mut self, p: u16, v: u32) {
        self.cmd(&format!("outl 0x{p:x} 0x{v:x}"));
    }
    fn inl(&mut self, p: u16) -> u32 {
        let s = self.cmd(&format!("inl 0x{p:x}"));
        Self::num(&s) as u32
    }
    fn rd(&mut self, w: char, a: u64) -> u64 {
        let s = self.cmd(&format!("read{w} 0x{a:x}"));
        Self::num(&s)
    }
    fn wr(&mut self, w: char, a: u64, v: u64) {
        self.cmd(&format!("write{w} 0x{a:x} 0x{v:x}"));
    }
    fn read(&mut self, a: u64, len: usize) -> Vec<u8> {
        if len == 0 {
            return vec![];
        }
        let s = self.cmd(&format!("read 0x{a:x} 0x{len:x}"));
        let h = s.trim_start_matches("0x").as_bytes();
        (0..len)
            .map(|i| u8::from_str_radix(std::str::from_utf8(&h[2 * i..2 * i + 2]).unwrap(), 16).unwrap())
            .collect()
    }
    fn write(&mut self, a: u64, d: &[u8]) {
        if d.is_empty() {
            return;
        }
        const HEX: &[u8; 16] = b"0123456789abcdef";
        let mut s = format!("write 0x{a:x} 0x{:x} 0x", d.len()).into_bytes();
        s.reserve(d.len() * 2);
        for b in d {
            s.push(HEX[(b >> 4) as usize]);
            s.push(HEX[(b & 15) as usize]);
        }
        self.cmd(std::str::from_utf8(&s).unwrap());
    }
}

// ---------------------------------------------------------------- PCI + virtio transport

const DEV: u32 = 5; // -device ...,addr=0x5 on bus 0
const BAR_BASE: u64 = 0xC000_0000;

fn cfg_addr(reg: u32) -> u32 {
    0x8000_0000 | (DEV << 11) | (reg & 0xfc)
}
fn cfg32(q: &mut Qtest, reg: u32) -> u32 {
    q.outl(0xcf8, cfg_addr(reg));
    q.inl(0xcfc)
}
fn cfg8(q: &mut Qtest, reg: u32) -> u8 {
    (cfg32(q, reg) >> ((reg & 3) * 8)) as u8
}
fn cfgw32(q: &mut Qtest, reg: u32, v: u32) {
    q.outl(0xcf8, cfg_addr(reg));
    q.outl(0xcfc, v);
}

struct Vq {
    idx: u16,
    size: u16,
    desc: u64,
    avail: u64,
    used: u64,
    notify: u64,
    avail_idx: u16,
    last_used: u16,
    free: Vec<u16>,
    bufs: HashMap<u16, (u64, u32)>,
}

impl Vq {
    fn add(&mut self, q: &mut Qtest, addr: u64, len: u32, device_writes: bool) {
        let id = self.free.pop().expect("ring full");
        let d = self.desc + id as u64 * 16;
        q.wr('q', d, addr);
        q.wr('l', d + 8, len as u64);
        q.wr('w', d + 12, if device_writes { 2 } else { 0 });
        q.wr('w', d + 14, 0);
        q.wr('w', self.avail + 4 + (self.avail_idx % self.size) as u64 * 2, id as u64);
        self.avail_idx = self.avail_idx.wrapping_add(1);
        q.wr('w', self.avail + 2, self.avail_idx as u64);
        self.bufs.insert(id, (addr, len));
    }
    fn kick(&self, q: &mut Qtest) {
        q.wr('w', self.notify, self.idx as u64);
    }
    fn pop(&mut self, q: &mut Qtest) -> Option<(u64, u32)> {
        let ui = q.rd('w', self.used + 2) as u16;
        if ui == self.last_used {
            return None;
        }
        let e = self.used + 4 + (self.last_used % self.size) as u64 * 8;
        let id = q.rd('l', e) as u16;
        let len = q.rd('l', e + 4) as u32;
        self.last_used = self.last_used.wrapping_add(1);
        let (addr, _) = self.bufs.remove(&id).expect("unknown id");
        self.free.push(id);
        Some((addr, len))
    }
}

// ---------------------------------------------------------------- vdagent framing (vd_agent.h)

const CLIPBOARD: u32 = 4;
const CAPS: u32 = 6;
const GRAB: u32 = 7;
const REQUEST: u32 = 8;
const RELEASE: u32 = 9;
const CAP_BY_DEMAND: u32 = 1 << 5;
const CAP_SELECTION: u32 = 1 << 6;
const CAP_GRAB_SERIAL: u32 = 1 << 17;
const UTF8: u32 = 1;

fn type_name(t: u32) -> &'static str {
    match t {
        1 => "MOUSE_STATE",
        2 => "MONITORS_CONFIG",
        3 => "REPLY",
        4 => "CLIPBOARD",
        5 => "DISPLAY_CONFIG",
        6 => "ANNOUNCE_CAPABILITIES",
        7 => "CLIPBOARD_GRAB",
        8 => "CLIPBOARD_REQUEST",
        9 => "CLIPBOARD_RELEASE",
        _ => "?",
    }
}

fn cap_names(c: u32) -> String {
    const N: [&str; 19] = [
        "MOUSE_STATE", "MONITORS_CONFIG", "REPLY", "CLIPBOARD", "DISPLAY_CONFIG",
        "CLIPBOARD_BY_DEMAND", "CLIPBOARD_SELECTION", "SPARSE_MONITORS_CONFIG",
        "GUEST_LINEEND_LF", "GUEST_LINEEND_CRLF", "MAX_CLIPBOARD", "AUDIO_VOLUME_SYNC",
        "MONITORS_CONFIG_POSITION", "FILE_XFER_DISABLED", "FILE_XFER_DETAILED_ERRORS",
        "GRAPHICS_DEVICE_INFO", "CLIPBOARD_NO_RELEASE_ON_REGRAB", "CLIPBOARD_GRAB_SERIAL",
        "MONITORS_PHYSICAL_SIZE",
    ];
    (0..32).filter(|b| c >> b & 1 == 1).map(|b| N.get(b).copied().unwrap_or("bit?").to_string()).collect::<Vec<_>>().join("|")
}

fn le32(b: &[u8], o: usize) -> u32 {
    u32::from_le_bytes(b[o..o + 4].try_into().unwrap())
}

fn message(ty: u32, data: &[u8]) -> Vec<u8> {
    let mut m = Vec::new();
    m.extend_from_slice(&1u32.to_le_bytes());
    m.extend_from_slice(&ty.to_le_bytes());
    m.extend_from_slice(&0u64.to_le_bytes());
    m.extend_from_slice(&(data.len() as u32).to_le_bytes());
    m.extend_from_slice(data);
    m
}

fn chunked(msg: &[u8], max: usize) -> Vec<u8> {
    let mut out = Vec::new();
    for c in msg.chunks(max) {
        out.extend_from_slice(&1u32.to_le_bytes());
        out.extend_from_slice(&(c.len() as u32).to_le_bytes());
        out.extend_from_slice(c);
    }
    out
}

fn words(ws: &[u32]) -> Vec<u8> {
    ws.iter().flat_map(|w| w.to_le_bytes()).collect()
}

fn preview(d: &[u8]) -> String {
    let n = d.len().min(24);
    format!("{} bytes {:02x?}{}", d.len(), &d[..n], if d.len() > n { "…" } else { "" })
}

#[derive(Debug, Clone)]
struct Msg {
    protocol: u32,
    ty: u32,
    data: Vec<u8>,
    chunks: Vec<u32>,
}

impl std::fmt::Display for Msg {
    fn fmt(&self, f: &mut std::fmt::Formatter) -> std::fmt::Result {
        write!(f, "{} (protocol {}, {} data bytes", type_name(self.ty), self.protocol, self.data.len())?;
        let mut sizes: Vec<(u32, usize)> = vec![];
        for &c in &self.chunks {
            match sizes.last_mut() {
                Some((s, n)) if *s == c => *n += 1,
                _ => sizes.push((c, 1)),
            }
        }
        let cs: Vec<String> = sizes.iter().map(|(s, n)| if *n > 1 { format!("{n}x{s}") } else { s.to_string() }).collect();
        write!(f, ", chunks [{}])", cs.join(", "))?;
        match self.ty {
            CAPS if self.data.len() >= 8 => write!(f, " request {} caps 0x{:08x} [{}]", le32(&self.data, 0), le32(&self.data, 4), cap_names(le32(&self.data, 4))),
            _ => write!(f, " {}", preview(&self.data)),
        }
    }
}

// ---------------------------------------------------------------- the guest

const CTRL_EVENTS: [&str; 8] =
    ["DEVICE_READY", "DEVICE_ADD", "DEVICE_REMOVE", "PORT_READY", "CONSOLE_PORT", "RESIZE", "PORT_OPEN", "PORT_NAME"];
const DEVICE_READY: u16 = 0;
const DEVICE_ADD: u16 = 1;
const PORT_READY: u16 = 3;
const PORT_OPEN: u16 = 6;
const PORT_NAME: u16 = 7;

#[derive(Debug, Clone)]
struct Ctrl {
    id: u32,
    event: u16,
    value: u16,
    extra: Vec<u8>,
}

impl std::fmt::Display for Ctrl {
    fn fmt(&self, f: &mut std::fmt::Formatter) -> std::fmt::Result {
        let n = CTRL_EVENTS.get(self.event as usize).copied().unwrap_or("?");
        write!(f, "{n}(id {}, value {})", self.id, self.value)?;
        if !self.extra.is_empty() {
            write!(f, " name {:?}", String::from_utf8_lossy(&self.extra))?;
        }
        Ok(())
    }
}

const RXBUF: u32 = 4096;
const Q_CTRL_RX: usize = 2;
const Q_CTRL_TX: usize = 3;
const Q_P1_RX: usize = 4;
const Q_P1_TX: usize = 5;

#[derive(Debug)]
enum Ev {
    Ctrl(Ctrl),
    Msg(Msg),
}

struct Guest {
    q: Qtest,
    vqs: Vec<Vq>,
    common: u64,
    notify: u64,
    notify_mult: u32,
    devcfg: u64,
    mem: u64,
    events: VecDeque<Ev>,
    stream: Vec<u8>,
    asm: Option<(Vec<u8>, Vec<u32>)>,
    features: (u32, u32),
    num_queues: u16,
    tx_pending: usize,
    ctrl_tx_buf: u64,
    tx_buf: u64,
}

impl Guest {
    fn alloc(&mut self, n: u64) -> u64 {
        let a = self.mem;
        self.mem = (self.mem + n + 0xfff) & !0xfff;
        a
    }

    /// Program the BAR and run virtio 1.2 §3.1.1's first four steps: reset, ACKNOWLEDGE,
    /// DRIVER, read the device's features.
    fn attach(mut q: Qtest) -> Guest {
        let id = cfg32(&mut q, 0);
        log!("pci 00:{DEV:02x}.0 vendor:device {:04x}:{:04x}", id & 0xffff, id >> 16);
        assert_eq!(id, 0x1043_1af4);
        let mut caps = Vec::new();
        let mut p = cfg8(&mut q, 0x34) as u32;
        let mut notify_mult = 0;
        while p != 0 {
            let id = cfg8(&mut q, p);
            let next = cfg8(&mut q, p + 1) as u32;
            let name = match id {
                0x01 => "power management",
                0x05 => "MSI",
                0x09 => "vendor-specific",
                0x10 => "PCI Express",
                0x11 => "MSI-X",
                _ => "other",
            };
            if id == 0x10 {
                let devcap = cfg32(&mut q, p + 4);
                log!("capability 0x{id:02x} ({name}) at 0x{p:02x}: device capabilities 0x{devcap:08x}, function level reset {}", devcap >> 28 & 1);
            } else {
                log!("capability 0x{id:02x} ({name}) at 0x{p:02x}");
            }
            if id == 9 {
                let ty = cfg8(&mut q, p + 3);
                let bar = cfg8(&mut q, p + 4);
                let off = cfg32(&mut q, p + 8);
                if ty == 2 {
                    notify_mult = cfg32(&mut q, p + 16);
                }
                caps.push((ty, bar, off));
            }
            p = next;
        }
        let bar = caps.iter().find(|c| c.0 == 1).unwrap().1;
        let reg = 0x10 + bar as u32 * 4;
        cfgw32(&mut q, reg, BAR_BASE as u32);
        cfgw32(&mut q, reg + 4, 0);
        let cmd = cfg32(&mut q, 4);
        cfgw32(&mut q, 4, (cmd & 0xffff) | 0x6);
        let at = |t: u8| BAR_BASE + caps.iter().find(|c| c.0 == t && c.1 == bar).unwrap().2 as u64;
        let mut g = Guest {
            q,
            vqs: vec![],
            common: at(1),
            notify: at(2),
            notify_mult,
            devcfg: at(4),
            mem: 0x0200_0000,
            events: VecDeque::new(),
            stream: vec![],
            asm: None,
            features: (0, 0),
            num_queues: 0,
            tx_pending: 0,
            ctrl_tx_buf: 0,
            tx_buf: 0,
        };
        let c = g.common;
        g.q.wr('b', c + 0x14, 0);
        assert_eq!(g.q.rd('b', c + 0x14), 0);
        g.q.wr('b', c + 0x14, 1 | 2);
        g.q.wr('l', c, 0);
        let lo = g.q.rd('l', c + 4) as u32;
        g.q.wr('l', c, 1);
        let hi = g.q.rd('l', c + 4) as u32;
        g.features = (lo, hi);
        g.num_queues = g.q.rd('w', c + 0x12) as u16;
        log!(
            "device features: low word 0x{lo:08x}, high word 0x{hi:08x}; MULTIPORT (bit 1) {}, VERSION_1 (bit 32) {}, ACCESS_PLATFORM (bit 33) {}; num_queues {}",
            lo >> 1 & 1,
            hi & 1,
            hi >> 1 & 1,
            g.num_queues
        );
        g.ctrl_tx_buf = g.alloc(4096);
        g.tx_buf = g.alloc(4 << 20);
        g
    }

    /// Negotiate VERSION_1 | MULTIPORT, create every queue, post receive buffers, DRIVER_OK.
    fn start(&mut self, ctrl_rx_buffers: usize) {
        let c = self.common;
        self.q.wr('l', c + 8, 0);
        self.q.wr('l', c + 0xc, 1 << 1);
        self.q.wr('l', c + 8, 1);
        self.q.wr('l', c + 0xc, 1);
        self.q.wr('b', c + 0x14, 1 | 2 | 8);
        let st = self.q.rd('b', c + 0x14);
        assert_eq!(st & 8, 8, "FEATURES_OK refused");
        let max_nr_ports = self.q.rd('l', self.devcfg + 4);
        log!("negotiated VERSION_1 | MULTIPORT; device config max_nr_ports {max_nr_ports}");
        for i in 0..self.num_queues {
            self.q.wr('w', c + 0x16, i as u64);
            let max = self.q.rd('w', c + 0x18) as u16;
            let size = max.min(64);
            self.q.wr('w', c + 0x18, size as u64);
            let desc = self.alloc(16 * size as u64);
            let avail = self.alloc(6 + 2 * size as u64);
            let used = self.alloc(6 + 8 * size as u64);
            self.q.wr('q', c + 0x20, desc);
            self.q.wr('q', c + 0x28, avail);
            self.q.wr('q', c + 0x30, used);
            let off = self.q.rd('w', c + 0x1e);
            self.q.wr('w', c + 0x1c, 1);
            self.vqs.push(Vq {
                idx: i,
                size,
                desc,
                avail,
                used,
                notify: self.notify + off * self.notify_mult as u64,
                avail_idx: 0,
                last_used: 0,
                free: (0..size).rev().collect(),
                bufs: HashMap::new(),
            });
        }
        self.q.wr('b', c + 0x14, 1 | 2 | 8 | 4);
        log!("DRIVER_OK with {} queues", self.num_queues);
        self.post_ctrl(ctrl_rx_buffers);
        for _ in 0..32 {
            let a = self.alloc(RXBUF as u64);
            self.vqs[Q_P1_RX].add(&mut self.q, a, RXBUF, true);
        }
        self.vqs[Q_P1_RX].kick(&mut self.q);
    }

    fn post_ctrl(&mut self, n: usize) {
        for _ in 0..n {
            let a = self.alloc(RXBUF as u64);
            self.vqs[Q_CTRL_RX].add(&mut self.q, a, RXBUF, true);
        }
        if n > 0 {
            self.vqs[Q_CTRL_RX].kick(&mut self.q);
            log!("posted {n} control receive buffers");
        }
    }

    fn ctrl(&mut self, id: u32, event: u16, value: u16) {
        let mut b = id.to_le_bytes().to_vec();
        b.extend_from_slice(&event.to_le_bytes());
        b.extend_from_slice(&value.to_le_bytes());
        let a = self.ctrl_tx_buf;
        self.q.write(a, &b);
        self.vqs[Q_CTRL_TX].add(&mut self.q, a, 8, false);
        self.vqs[Q_CTRL_TX].kick(&mut self.q);
        log!("guest -> {}", Ctrl { id, event, value, extra: vec![] });
        let t = Instant::now();
        while self.vqs[Q_CTRL_TX].pop(&mut self.q).is_none() {
            assert!(t.elapsed() < CEILING, "control transmit not taken back");
        }
    }

    /// One element, one descriptor, carrying `bytes`; waits until the device takes it back.
    fn send(&mut self, what: &str, bytes: &[u8]) -> bool {
        let a = self.alloc(bytes.len() as u64);
        self.q.write(a, bytes);
        self.vqs[Q_P1_TX].add(&mut self.q, a, bytes.len() as u32, false);
        self.vqs[Q_P1_TX].kick(&mut self.q);
        log!("guest -> one element of {} bytes: {what}", bytes.len());
        self.tx_pending += 1;
        let t = Instant::now();
        let before = self.tx_pending;
        loop {
            self.pump();
            if self.tx_pending < before {
                return true;
            }
            if t.elapsed() > CEILING {
                log!("that element was NOT taken back within {} ms", CEILING.as_millis());
                return false;
            }
            std::thread::sleep(Duration::from_millis(1));
        }
    }

    fn pump(&mut self) {
        while let Some((_, _)) = self.vqs[Q_P1_TX].pop(&mut self.q) {
            self.tx_pending -= 1;
            log!("device took back a transmit element ({} still out)", self.tx_pending);
        }
        while let Some((a, len)) = self.vqs[Q_CTRL_RX].pop(&mut self.q) {
            let b = self.q.read(a, len as usize);
            let c = Ctrl {
                id: le32(&b, 0),
                event: u16::from_le_bytes([b[4], b[5]]),
                value: u16::from_le_bytes([b[6], b[7]]),
                extra: b[8..].to_vec(),
            };
            log!("host -> {c}");
            self.events.push_back(Ev::Ctrl(c));
            self.vqs[Q_CTRL_RX].add(&mut self.q, a, RXBUF, true);
            self.vqs[Q_CTRL_RX].kick(&mut self.q);
        }
        let mut got = false;
        while let Some((a, len)) = self.vqs[Q_P1_RX].pop(&mut self.q) {
            let b = self.q.read(a, len as usize);
            self.stream.extend_from_slice(&b);
            self.vqs[Q_P1_RX].add(&mut self.q, a, RXBUF, true);
            got = true;
        }
        if got {
            self.vqs[Q_P1_RX].kick(&mut self.q);
        }
        while self.stream.len() >= 8 {
            let port = le32(&self.stream, 0);
            let size = le32(&self.stream, 4) as usize;
            if self.stream.len() < 8 + size {
                break;
            }
            assert_eq!(port, 1, "chunk for port {port}");
            let data: Vec<u8> = self.stream.drain(..8 + size).skip(8).collect();
            let (buf, chunks) = self.asm.get_or_insert_with(|| (vec![], vec![]));
            buf.extend_from_slice(&data);
            chunks.push(size as u32);
            if buf.len() >= 20 {
                let total = 20 + le32(buf, 16) as usize;
                if buf.len() >= total {
                    assert_eq!(buf.len(), total, "a chunk spans two messages");
                    let (buf, chunks) = self.asm.take().unwrap();
                    let m = Msg { protocol: le32(&buf, 0), ty: le32(&buf, 4), data: buf[20..].to_vec(), chunks };
                    log!("host -> {m}");
                    self.events.push_back(Ev::Msg(m));
                }
            }
        }
    }

    /// The next event, waiting for it at most `CEILING`; `None` is an absence within that bound.
    fn next(&mut self) -> Option<Ev> {
        let t = Instant::now();
        loop {
            self.pump();
            if let Some(e) = self.events.pop_front() {
                return Some(e);
            }
            if t.elapsed() > CEILING {
                log!("nothing from the host within {} ms", CEILING.as_millis());
                return None;
            }
            std::thread::sleep(Duration::from_millis(1));
        }
    }

    fn expect_ctrl(&mut self, event: u16) -> Ctrl {
        match self.next() {
            Some(Ev::Ctrl(c)) if c.event == event => c,
            other => panic!("expected {}, got {other:?}", CTRL_EVENTS[event as usize]),
        }
    }

    fn expect_msg(&mut self, ty: u32) -> Msg {
        match self.next() {
            Some(Ev::Msg(m)) if m.ty == ty => m,
            other => panic!("expected {}, got {:?}", type_name(ty), other.map(|e| format!("{e:?}").chars().take(300).collect::<String>())),
        }
    }

    /// virtio 1.2 §5.3.6.2's handshake for the port QEMU adds, through its PORT_NAME and,
    /// when the host end is open, its PORT_OPEN.
    fn handshake(&mut self) {
        self.ctrl(0, DEVICE_READY, 1);
        let add = self.expect_ctrl(DEVICE_ADD);
        self.ctrl(add.id, PORT_READY, 1);
        self.expect_ctrl(PORT_NAME);
        self.expect_ctrl(PORT_OPEN);
    }

    fn open(&mut self) {
        self.ctrl(1, PORT_OPEN, 1);
    }

    fn caps(&mut self, request: u32, caps: u32) {
        let m = message(CAPS, &words(&[request, caps]));
        self.send(&format!("ANNOUNCE_CAPABILITIES request {request} caps 0x{caps:08x} [{}]", cap_names(caps)), &chunked(&m, 2048));
    }

    fn assert_quiet(&mut self) {
        assert!(self.next().is_none());
    }
}

// ---------------------------------------------------------------- VNC (RFC 6143; rfbproto's Extended Clipboard)

const EXT_TEXT: u32 = 1;
const EXT_CAPS: u32 = 1 << 24;
const EXT_REQUEST: u32 = 1 << 25;
const EXT_NOTIFY: u32 = 1 << 27;
const EXT_PROVIDE: u32 = 1 << 28;
const EXT_ENCODING: i32 = 0xC0A1_E5CEu32 as i32;

#[derive(Debug)]
enum VncEv {
    Plain(Vec<u8>),
    Caps(u32, Vec<u32>),
    Notify(u32),
    Request(u32),
    Provide(Vec<u8>),
}

impl std::fmt::Display for VncEv {
    fn fmt(&self, f: &mut std::fmt::Formatter) -> std::fmt::Result {
        match self {
            VncEv::Plain(d) => write!(f, "ServerCutText {}", preview(d)),
            VncEv::Caps(fl, s) => write!(f, "extended caps flags 0x{fl:08x} sizes {s:?}"),
            VncEv::Notify(fm) => write!(f, "extended notify, formats 0x{fm:x}"),
            VncEv::Request(fm) => write!(f, "extended request, formats 0x{fm:x}"),
            VncEv::Provide(d) => write!(f, "extended provide, text stream {}", preview(d)),
        }
    }
}

struct Vnc {
    w: UnixStream,
    rx: Receiver<VncEv>,
}

impl Vnc {
    fn connect(path: &str, extended: bool) -> Vnc {
        let t = Instant::now();
        let mut s = loop {
            match UnixStream::connect(path) {
                Ok(s) => break s,
                Err(e) => {
                    assert!(t.elapsed() < CEILING, "vnc connect: {e}");
                    std::thread::sleep(Duration::from_millis(5));
                }
            }
        };
        let mut v = [0u8; 12];
        s.read_exact(&mut v).unwrap();
        s.write_all(b"RFB 003.008\n").unwrap();
        let mut n = [0u8; 1];
        s.read_exact(&mut n).unwrap();
        let mut types = vec![0u8; n[0] as usize];
        s.read_exact(&mut types).unwrap();
        assert!(types.contains(&1), "no None security: {types:?}");
        s.write_all(&[1]).unwrap();
        let mut r = [0u8; 4];
        s.read_exact(&mut r).unwrap();
        assert_eq!(r, [0; 4]);
        s.write_all(&[1]).unwrap();
        let mut si = [0u8; 24];
        s.read_exact(&mut si).unwrap();
        let mut name = vec![0u8; u32::from_be_bytes(si[20..24].try_into().unwrap()) as usize];
        s.read_exact(&mut name).unwrap();
        let encs: Vec<i32> = if extended { vec![0, EXT_ENCODING] } else { vec![0] };
        let mut m = vec![2, 0];
        m.extend_from_slice(&(encs.len() as u16).to_be_bytes());
        for e in &encs {
            m.extend_from_slice(&e.to_be_bytes());
        }
        s.write_all(&m).unwrap();
        let (tx, rx) = channel();
        let mut rd = s.try_clone().unwrap();
        std::thread::spawn(move || loop {
            let mut ty = [0u8; 1];
            if rd.read_exact(&mut ty).is_err() {
                return;
            }
            let ev = match ty[0] {
                2 => continue,
                3 => {
                    let mut h = [0u8; 7];
                    rd.read_exact(&mut h).unwrap();
                    let len = i32::from_be_bytes(h[3..7].try_into().unwrap());
                    let mut d = vec![0u8; len.unsigned_abs() as usize];
                    rd.read_exact(&mut d).unwrap();
                    if len >= 0 {
                        VncEv::Plain(d)
                    } else {
                        let fl = u32::from_be_bytes(d[0..4].try_into().unwrap());
                        let rest = &d[4..];
                        if fl & EXT_CAPS != 0 {
                            VncEv::Caps(fl, rest.chunks(4).map(|c| u32::from_be_bytes(c.try_into().unwrap())).collect())
                        } else if fl & EXT_NOTIFY != 0 {
                            VncEv::Notify(fl & 0xffff)
                        } else if fl & EXT_REQUEST != 0 {
                            VncEv::Request(fl & 0xffff)
                        } else if fl & EXT_PROVIDE != 0 {
                            let mut out = vec![];
                            flate2::read::ZlibDecoder::new(rest).read_to_end(&mut out).unwrap();
                            let size = u32::from_be_bytes(out[0..4].try_into().unwrap()) as usize;
                            VncEv::Provide(out[4..4 + size].to_vec())
                        } else {
                            panic!("extended clipboard flags 0x{fl:08x}")
                        }
                    }
                }
                t => panic!("unexpected vnc server message {t}"),
            };
            if tx.send(ev).is_err() {
                return;
            }
        });
        let mut v = Vnc { w: s, rx };
        log!("vnc client connected to server {:?}, extended clipboard {}", String::from_utf8_lossy(&name), extended);
        if extended {
            match v.rx.recv_timeout(CEILING) {
                Ok(e @ VncEv::Caps(..)) => log!("vnc client <- {e}"),
                other => panic!("expected extended caps, got {other:?}"),
            }
            // Every size 0, so every change arrives as a notify (rfbproto's recommendation).
            v.ext(EXT_CAPS | EXT_REQUEST | EXT_NOTIFY | EXT_PROVIDE | EXT_TEXT, &0u32.to_be_bytes());
        }
        v
    }

    fn ext(&mut self, flags: u32, payload: &[u8]) {
        let mut m = vec![6, 0, 0, 0];
        m.extend_from_slice(&(-((4 + payload.len()) as i32)).to_be_bytes());
        m.extend_from_slice(&flags.to_be_bytes());
        m.extend_from_slice(payload);
        self.w.write_all(&m).unwrap();
        log!("vnc client -> extended flags 0x{flags:08x}");
    }

    fn request(&mut self) {
        self.ext(EXT_REQUEST | EXT_TEXT, &[]);
    }

    fn copy(&mut self, text: &[u8]) {
        let mut m = vec![6, 0, 0, 0];
        m.extend_from_slice(&(text.len() as u32).to_be_bytes());
        m.extend_from_slice(text);
        self.w.write_all(&m).unwrap();
        log!("vnc client -> ClientCutText {}", preview(text));
    }

    /// The next server event within the ceiling, pumping the guest meanwhile.
    fn next(&mut self, g: &mut Guest) -> Option<VncEv> {
        let t = Instant::now();
        loop {
            if let Ok(e) = self.rx.try_recv() {
                log!("vnc client <- {e}");
                return Some(e);
            }
            g.pump();
            if t.elapsed() > CEILING {
                log!("vnc client: nothing from the server within {} ms", CEILING.as_millis());
                return None;
            }
            std::thread::sleep(Duration::from_millis(1));
        }
    }

    fn quiet(&mut self, g: &mut Guest) -> bool {
        self.next(g).is_none()
    }

    /// Request the text and return what is provided.
    fn paste(&mut self, g: &mut Guest) -> Option<Vec<u8>> {
        self.request();
        match self.next(g) {
            Some(VncEv::Provide(d)) => Some(d),
            other => {
                log!("no provide; got {other:?}");
                None
            }
        }
    }
}

// ---------------------------------------------------------------- QEMU

struct Qemu {
    child: Child,
    dir: String,
    stderr: String,
}

impl Qemu {
    fn launch(tag: &str, max_ports: u32, display: &str) -> (Qemu, Guest) {
        Self::launch_port(tag, max_ports, display, Some(1))
    }

    fn launch_port(tag: &str, max_ports: u32, display: &str, port: Option<u32>) -> (Qemu, Guest) {
        let dir = format!("run-{tag}");
        let _ = std::fs::remove_dir_all(&dir);
        std::fs::create_dir_all(&dir).unwrap();
        let qsock = format!("{dir}/qtest.sock");
        let lst = UnixListener::bind(&qsock).unwrap();
        let mut args: Vec<String> = vec![
            "-machine", "q35", "-accel", "qtest", "-nodefaults", "-m", "128M", "-display", "none", "-monitor", "none",
            "-serial", "none",
        ]
        .into_iter()
        .map(String::from)
        .collect();
        args.push("-qtest-log".into());
        args.push("/dev/null".into());
        args.push("-qtest".into());
        args.push(format!("unix:{qsock}"));
        if display == "vnc" {
            args.push("-vnc".into());
            args.push(format!("unix:{dir}/vnc.sock"));
        }
        args.extend([
            "-chardev".to_string(),
            "qemu-vdagent,id=vdagent0,clipboard=on,mouse=off".into(),
            "-device".into(),
            format!("virtio-serial-pci-non-transitional,id=vdagent-serial,max_ports={max_ports},addr=0x5"),
        ]);
        if let Some(nr) = port {
            args.push("-device".into());
            args.push(format!("virtserialport,bus=vdagent-serial.0,nr={nr},chardev=vdagent0,name=com.redhat.spice.0"));
        }
        let stderr = format!("{dir}/stderr.txt");
        log!("==== launch {tag}: qemu-system-x86_64 {}", args.join(" ").replace(&dir, "$RUN"));
        let child = Command::new("qemu-system-x86_64")
            .args(&args)
            .stdin(Stdio::null())
            .stdout(Stdio::null())
            .stderr(std::fs::File::create(&stderr).unwrap())
            .spawn()
            .unwrap();
        let (s, _) = lst.accept().unwrap();
        let q = Qtest { r: BufReader::new(s.try_clone().unwrap()), w: s };
        let g = Guest::attach(q);
        (Qemu { child, dir, stderr }, g)
    }

    fn vnc(&self) -> Vnc {
        Vnc::connect(&format!("{}/vnc.sock", self.dir), true)
    }

    fn vnc_plain(&self) -> Vnc {
        Vnc::connect(&format!("{}/vnc.sock", self.dir), false)
    }
}

impl Drop for Qemu {
    fn drop(&mut self) {
        let _ = self.child.kill();
        let st = self.child.wait().unwrap();
        let e = std::fs::read_to_string(&self.stderr).unwrap_or_default();
        log!("qemu ended ({st}); its stderr: {:?}", e);
        let _ = std::fs::remove_dir_all(&self.dir);
    }
}

// ---------------------------------------------------------------- scenarios

fn session(tag: &str, display: &str) -> (Qemu, Guest) {
    let (qemu, mut g) = Qemu::launch(tag, 2, display);
    g.start(8);
    g.handshake();
    (qemu, g)
}

/// A session past the opening exchange: the host's capabilities, answered once with ours.
fn opened(tag: &str) -> (Qemu, Guest) {
    let (qemu, mut g) = session(tag, "vnc");
    g.open();
    g.expect_msg(CAPS);
    g.caps(0, OURS);
    (qemu, g)
}

const OURS: u32 = CAP_BY_DEMAND | CAP_GRAB_SERIAL;

fn grab(serial: Option<u32>, types: &[u32]) -> Vec<u8> {
    let mut d = vec![];
    if let Some(s) = serial {
        d.extend_from_slice(&s.to_le_bytes());
    }
    d.extend_from_slice(&words(types));
    message(GRAB, &d)
}

fn clip(text: &[u8]) -> Vec<u8> {
    let mut d = UTF8.to_le_bytes().to_vec();
    d.extend_from_slice(text);
    message(CLIPBOARD, &d)
}

fn request() -> Vec<u8> {
    message(REQUEST, &words(&[UTF8]))
}

/// GRAB [serial][UTF8_TEXT] and CLIPBOARD(text) in one element.
fn push(g: &mut Guest, serial: u32, text: &[u8]) -> bool {
    let mut b = chunked(&grab(Some(serial), &[UTF8]), 2048);
    b.extend(chunked(&clip(text), 2048));
    g.send(&format!("GRAB [{serial}][UTF8_TEXT] + CLIPBOARD {} in one element", preview(text)), &b)
}

/// A host grab of `text`, read through to the guest's GRAB; returns its serial.
fn host_copy(v: &mut Vnc, g: &mut Guest, text: &[u8]) -> u32 {
    v.copy(text);
    let m = g.expect_msg(GRAB);
    le32(&m.data, 0)
}

fn drain(g: &mut Guest, what: &str) {
    log!("guest events after {what}:");
    while let Some(e) = g.next() {
        log!("  {e:?}");
    }
}

fn s_features() {
    for mp in [1, 2] {
        let (_qemu, mut g) = Qemu::launch_port(&format!("features-max_ports-{mp}"), mp, "none", None);
        log!("max_ports={mp}: MULTIPORT offered: {}", g.features.0 >> 1 & 1 == 1);
        let st = cfg32(&mut g.q, 4) >> 16;
        log!("max_ports={mp}: PCI status 0x{st:04x}, capabilities list {}", st >> 4 & 1);
    }
}

fn s_handshake() {
    let (_qemu, mut g) = Qemu::launch("handshake", 2, "none");
    g.start(8);
    g.ctrl(0, DEVICE_READY, 1);
    let add = g.expect_ctrl(DEVICE_ADD);
    log!("observed: one DEVICE_ADD, for id {}", add.id);
    g.ctrl(add.id, PORT_READY, 1);
    g.expect_ctrl(PORT_NAME);
    g.expect_ctrl(PORT_OPEN);
    log!("observed: nothing more is sent before the guest opens its end:");
    g.assert_quiet();
    g.open();
    log!("what the host sends once the guest opens its end:");
    let first = g.next();
    log!("first: {first:?}");
    g.assert_quiet();
}

fn s_ctrl_drop() {
    let (_qemu, mut g) = Qemu::launch("ctrl-drop", 2, "none");
    g.start(0);
    g.ctrl(0, DEVICE_READY, 1);
    log!("DEVICE_READY taken back with no control receive buffer posted; now posting four");
    g.post_ctrl(4);
    g.assert_quiet();
    log!("DEVICE_READY again, buffers posted:");
    g.ctrl(0, DEVICE_READY, 1);
    let e = g.next();
    log!("after the second DEVICE_READY: {e:?}");
}

fn s_opening(display: &str) {
    let (_qemu, mut g) = session(&format!("opening-{display}"), display);
    g.open();
    let host_caps = g.expect_msg(CAPS);
    log!("host's first message is its capabilities, request {}", le32(&host_caps.data, 0));
    g.caps(0, OURS);
    g.assert_quiet();
    g.send("REQUEST UTF8_TEXT, nothing grabbed by anyone", &chunked(&request(), 2048));
    let r = g.next();
    log!("answer to a REQUEST nobody owns: {r:?}");
    g.assert_quiet();
}

fn s_caps_request(req_first: u32, second: Option<u32>) {
    let tag = format!("caps-request-{req_first}-{}", second.map(|s| s.to_string()).unwrap_or("none".into()));
    let (_qemu, mut g) = session(&tag, "none");
    g.open();
    g.expect_msg(CAPS);
    g.caps(req_first, OURS);
    drain(&mut g, &format!("the guest's capabilities with request {req_first}"));
    if let Some(r) = second {
        g.caps(r, OURS);
        drain(&mut g, &format!("a second guest capabilities with request {r} in the same session"));
    }
}

/// Wire layout of a host GRAB as a function of what the guest announced.
fn s_layout(guest_caps: u32) {
    let (qemu, mut g) = session(&format!("layout-0x{guest_caps:x}"), "vnc");
    g.open();
    g.expect_msg(CAPS);
    g.caps(0, guest_caps);
    let mut v = qemu.vnc_plain();
    v.copy(b"layout");
    let m = g.expect_msg(GRAB);
    log!("guest announced [{}]: host GRAB data {:02x?}", cap_names(guest_caps), m.data);
    let rq = if guest_caps & CAP_SELECTION != 0 { message(REQUEST, &words(&[0, UTF8])) } else { request() };
    g.send("REQUEST UTF8_TEXT", &chunked(&rq, 2048));
    let c = g.expect_msg(CLIPBOARD);
    log!("guest announced [{}]: host CLIPBOARD data {:02x?}", cap_names(guest_caps), c.data);
}

fn s_host_grabs() {
    let (qemu, mut g) = opened("host-grabs");
    let mut v = qemu.vnc_plain();
    let mut serials = vec![];
    for i in 0..3 {
        serials.push(host_copy(&mut v, &mut g, format!("host-{i}").as_bytes()));
    }
    log!("serials of three host grabs in one session: {serials:?}");
    g.send("REQUEST UTF8_TEXT", &chunked(&request(), 2048));
    let c = g.expect_msg(CLIPBOARD);
    log!("answer: {:?}", String::from_utf8_lossy(&c.data[4..]));
    let big: Vec<u8> = (0..10_000u32).map(|i| b'a' + (i % 26) as u8).collect();
    host_copy(&mut v, &mut g, &big);
    g.send("REQUEST UTF8_TEXT", &chunked(&request(), 2048));
    let c = g.expect_msg(CLIPBOARD);
    assert_eq!(&c.data[4..], &big[..]);
    log!("a 10,000-byte host text arrives intact in chunks {:?}", c.chunks);
}

fn s_host_size(len: usize) {
    let (qemu, mut g) = opened(&format!("host-size-{len}"));
    let mut v = qemu.vnc_plain();
    let big: Vec<u8> = (0..len).map(|i| b'a' + (i % 26) as u8).collect();
    host_copy(&mut v, &mut g, &big);
    g.send("REQUEST UTF8_TEXT", &chunked(&request(), 2048));
    match g.next() {
        Some(Ev::Msg(m)) if m.ty == CLIPBOARD => {
            log!("{len}-byte host text: arrived, {} bytes of text, equal {}", m.data.len() - 4, m.data[4..] == big[..])
        }
        other => log!("{len}-byte host text: no CLIPBOARD; next event {other:?}"),
    }
    log!("marker host copy, to show the session still runs:");
    let s = host_copy(&mut v, &mut g, b"marker");
    log!("marker GRAB serial {s}");
}

/// A grab and its text in one element: the host is notified, and its later paste is provided
/// with no REQUEST reaching the guest.
fn s_push_one_element() {
    let (qemu, mut g) = opened("push-one-element");
    let mut v = qemu.vnc();
    push(&mut g, 0, b"guest-text");
    v.next(&mut g);
    drain(&mut g, "the push");
    let p = v.paste(&mut g);
    log!("host paste after the push provides {:?}", p.map(|d| String::from_utf8_lossy(&d).to_string()));
    drain(&mut g, "the host's paste");
}

/// A grab alone: the host's paste reaches the guest as a REQUEST and waits for its answer.
fn s_grab_alone() {
    let (qemu, mut g) = opened("grab-alone");
    let mut v = qemu.vnc();
    g.send("GRAB [0][UTF8_TEXT] alone", &chunked(&grab(Some(0), &[UTF8]), 2048));
    v.next(&mut g);
    drain(&mut g, "the grab");
    v.request();
    let r = g.next();
    log!("the guest after the host's paste request: {r:?}");
    log!("the host's paste while the guest has not answered:");
    let q = v.quiet(&mut g);
    log!("host paste still unanswered after {} ms: {q}", CEILING.as_millis());
    g.send("CLIPBOARD \"guest-text\" in answer", &chunked(&clip(b"guest-text"), 2048));
    let p = v.next(&mut g);
    log!("the host's paste after the answer: {p:?}");
}

/// After three host grabs (serials 0, 1, 2), a guest grab with serial `s` and its text.
fn s_serial(s: u32) {
    let (qemu, mut g) = opened(&format!("serial-{s}"));
    let mut v = qemu.vnc();
    let serials: Vec<u32> = (0..3).map(|i| host_copy(&mut v, &mut g, format!("host-{i}").as_bytes())).collect();
    // The host's own copies come back as notifies to this client; read them off.
    while let Ok(e) = v.rx.try_recv() {
        log!("vnc client <- {e} (read off)");
    }
    log!("host grab serials {serials:?}");
    let t = format!("guest-serial-{s}");
    push(&mut g, s, t.as_bytes());
    let notified = !v.quiet(&mut g);
    let p = v.paste(&mut g).map(|d| String::from_utf8_lossy(&d).to_string());
    log!("guest serial {s} after host serials {serials:?}: host notified {notified}, host paste {p:?} => {}",
        if p.as_deref().map(|x| x.trim_end_matches('\0')) == Some(t.as_str()) { "KEPT" } else { "DISCARDED" });
    drain(&mut g, "the paste");
    let n = host_copy(&mut v, &mut g, b"host-after");
    log!("the next host grab carries serial {n}");
}

fn s_close_cycle() {
    let (qemu, mut g) = opened("close-cycle");
    let mut v = qemu.vnc();
    let s: Vec<u32> = (0..3).map(|i| host_copy(&mut v, &mut g, format!("host-{i}").as_bytes())).collect();
    while let Ok(e) = v.rx.try_recv() {
        log!("vnc client <- {e} (read off)");
    }
    log!("first session's host grab serials {s:?}");
    g.caps(0, OURS);
    drain(&mut g, "a second guest capabilities");
    push(&mut g, 100, b"while-host-closed");
    drain(&mut g, "a push while the host end is closed");
    v.quiet(&mut g);
    g.ctrl(1, PORT_OPEN, 0);
    drain(&mut g, "the guest's PORT_OPEN(0)");
    g.ctrl(1, PORT_OPEN, 1);
    drain(&mut g, "the guest's PORT_OPEN(1)");
    g.caps(0, OURS);
    drain(&mut g, "the guest's capabilities in the reopened session");
    v.quiet(&mut g);
    let n = host_copy(&mut v, &mut g, b"host-new-session");
    while let Ok(e) = v.rx.try_recv() {
        log!("vnc client <- {e} (read off)");
    }
    log!("first host grab of the reopened session carries serial {n}");
    push(&mut g, n + 1, b"after-reopen");
    let notified = !v.quiet(&mut g);
    let p = v.paste(&mut g).map(|d| String::from_utf8_lossy(&d).to_string());
    log!("after the reopen: host notified {notified}, host paste {p:?}");
}

/// The same cycle with nothing but the reopen: no host grab, no stuck element.
fn s_reopen_clean() {
    let (qemu, mut g) = opened("reopen-clean");
    let mut v = qemu.vnc();
    g.ctrl(1, PORT_OPEN, 0);
    drain(&mut g, "the guest's PORT_OPEN(0) with the host end open");
    g.ctrl(1, PORT_OPEN, 1);
    drain(&mut g, "the guest's PORT_OPEN(1)");
    g.caps(0, OURS);
    push(&mut g, 0, b"after-guest-reopen");
    let notified = !v.quiet(&mut g);
    let p = v.paste(&mut g).map(|d| String::from_utf8_lossy(&d).to_string());
    log!("after a guest-initiated reopen: host notified {notified}, host paste {p:?}");
}

fn s_closed_transmit() {
    let (qemu, mut g) = session("closed-transmit", "vnc");
    let mut v = qemu.vnc();
    log!("the guest has not opened its end; it transmits a grab and its text");
    push(&mut g, 0, b"while-closed");
    let notified = !v.quiet(&mut g);
    log!("host notified of the push made before the guest opened: {notified}");
    g.open();
    g.expect_msg(CAPS);
    g.caps(0, OURS);
    v.quiet(&mut g);
    push(&mut g, 0, b"after-open");
    let notified = !v.quiet(&mut g);
    let p = v.paste(&mut g).map(|d| String::from_utf8_lossy(&d).to_string());
    log!("after opening: host notified {notified}, host paste {p:?}");
}

fn s_release() {
    let (qemu, mut g) = opened("release");
    let mut v = qemu.vnc();
    host_copy(&mut v, &mut g, b"host-owned");
    while let Ok(e) = v.rx.try_recv() {
        log!("vnc client <- {e} (read off)");
    }
    g.send("RELEASE while the host owns", &chunked(&message(RELEASE, &[]), 2048));
    drain(&mut g, "a guest RELEASE while the host owns");
    v.quiet(&mut g);
    g.send("REQUEST UTF8_TEXT", &chunked(&request(), 2048));
    let c = g.next();
    log!("after a guest RELEASE while the host owns, REQUEST gives {c:?}");
    push(&mut g, 1, b"");
    let notified = !v.quiet(&mut g);
    let p = v.paste(&mut g);
    log!("an empty guest copy pushed: host notified {notified}, host paste {p:?}");
    drain(&mut g, "the empty push");
    push(&mut g, 2, b"guest-owned");
    v.next(&mut g);
    g.send("RELEASE while the guest owns", &chunked(&message(RELEASE, &[]), 2048));
    drain(&mut g, "a guest RELEASE while the guest owns");
    let e = v.next(&mut g);
    log!("host after a guest RELEASE while the guest owns: {e:?}");
    let p = v.paste(&mut g);
    log!("host paste after it: {p:?}");
    drain(&mut g, "that paste");
}

fn s_guest_max(len: usize) {
    let (qemu, mut g) = opened(&format!("guest-max-{len}"));
    let mut v = qemu.vnc();
    let text: Vec<u8> = (0..len).map(|i| b'a' + (i % 26) as u8).collect();
    push(&mut g, 0, &text);
    v.next(&mut g);
    drain(&mut g, "the push");
    match v.paste(&mut g) {
        Some(d) => log!("host paste provides {} bytes, equal to the pushed text: {}", d.len(), d == text),
        None => log!("host paste provides nothing"),
    }
}

/// The function's bus mastering cleared after a push, as a torn-down claim leaves it.
fn s_teardown() {
    let (qemu, mut g) = opened("teardown");
    let mut v = qemu.vnc();
    push(&mut g, 0, b"pushed-then-gone");
    v.next(&mut g);
    let cmd = cfg32(&mut g.q, 4);
    cfgw32(&mut g.q, 4, (cmd & 0xffff) & !0x4);
    log!("bus mastering cleared");
    let e = v.next(&mut g);
    log!("host after the clear: {e:?}");
    let p = v.paste(&mut g).map(|d| String::from_utf8_lossy(&d).to_string());
    log!("host paste after the clear: {p:?}");
    v.copy(b"host-after-teardown");
    v.next(&mut g);
    let p = v.paste(&mut g).map(|d| String::from_utf8_lossy(&d).to_string());
    log!("host paste after a host copy: {p:?}");
}

/// An empty guest copy sent as GRAB [serial][UTF8_TEXT] + RELEASE in one element, over a host copy.
fn s_empty_copy(serial: u32) {
    let (qemu, mut g) = opened(&format!("empty-copy-{serial}"));
    let mut v = qemu.vnc();
    let c = host_copy(&mut v, &mut g, b"host-owned");
    while let Ok(e) = v.rx.try_recv() {
        log!("vnc client <- {e} (read off)");
    }
    log!("host grab serial {c}");
    let mut b = chunked(&grab(Some(serial), &[UTF8]), 2048);
    b.extend(chunked(&message(RELEASE, &[]), 2048));
    g.send(&format!("GRAB [{serial}][UTF8_TEXT] + RELEASE in one element"), &b);
    drain(&mut g, "the grab and release");
    log!("host events after it:");
    while let Some(e) = v.next(&mut g) {
        log!("  {e:?}");
    }
    let p = v.paste(&mut g);
    log!("host paste after it: {p:?}");
    g.send("REQUEST UTF8_TEXT", &chunked(&request(), 2048));
    let r = g.next();
    log!("the guest's REQUEST after it gives {r:?}");
}

/// A grab alone whose host paste is answered with no data.
fn s_grab_alone_empty_answer() {
    let (qemu, mut g) = opened("grab-alone-empty-answer");
    let mut v = qemu.vnc();
    g.send("GRAB [0][UTF8_TEXT] alone", &chunked(&grab(Some(0), &[UTF8]), 2048));
    v.next(&mut g);
    v.request();
    let r = g.next();
    log!("the guest after the host's paste request: {r:?}");
    g.send("CLIPBOARD [UTF8_TEXT] with no data, in answer", &chunked(&clip(b""), 2048));
    let p = v.next(&mut g);
    log!("the host's paste after an answer with no data: {p:?}");
    drain(&mut g, "that answer");
}

/// The serial counter across a new session: after host grabs 0, 1, 2, the guest starts a new
/// session (by closing and reopening its end, or by resetting the device and driving it again)
/// and grabs with serial 0.
fn s_serial_new_session(reset: bool) {
    let tag = if reset { "serial-after-device-reset" } else { "serial-after-guest-reopen" };
    let (qemu, mut g) = opened(tag);
    let mut v = qemu.vnc();
    let s: Vec<u32> = (0..3).map(|i| host_copy(&mut v, &mut g, format!("host-{i}").as_bytes())).collect();
    while let Ok(e) = v.rx.try_recv() {
        log!("vnc client <- {e} (read off)");
    }
    log!("first session's host grab serials {s:?}");
    if reset {
        let q = std::mem::replace(&mut g.q, Qtest { r: BufReader::new(UnixStream::pair().unwrap().0), w: UnixStream::pair().unwrap().0 });
        log!("device reset (status 0) and driven again from the start, as a reboot of the guest does");
        g = Guest::attach(q);
        g.mem = 0x0600_0000; // rings in memory the first driver never used
        g.start(8);
        g.handshake();
    } else {
        g.ctrl(1, PORT_OPEN, 0);
        drain(&mut g, "the guest's PORT_OPEN(0)");
    }
    g.open();
    g.expect_msg(CAPS);
    g.caps(0, OURS);
    drain(&mut g, "the new session's capabilities");
    push(&mut g, 0, b"new-session-serial-0");
    let notified = !v.quiet(&mut g);
    let p = v.paste(&mut g).map(|d| String::from_utf8_lossy(&d).to_string());
    log!("{tag}: guest grab with serial 0: host notified {notified}, host paste {p:?}");
    let n = host_copy(&mut v, &mut g, b"host-after");
    log!("{tag}: the next host grab carries serial {n}");
}

/// Every event each VNC client receives until all are quiet for the ceiling, pumping the guest.
fn host_events(vs: &mut [&mut Vnc], g: &mut Guest, what: &str) -> Vec<(usize, VncEv)> {
    log!("host events after {what}:");
    let mut out = vec![];
    let mut t = Instant::now();
    loop {
        let mut got = false;
        for (i, v) in vs.iter_mut().enumerate() {
            if let Ok(e) = v.rx.try_recv() {
                log!("  vnc client {i} <- {e}");
                out.push((i, e));
                got = true;
            }
        }
        g.pump();
        if got {
            t = Instant::now();
        } else if t.elapsed() > CEILING {
            log!("  every vnc client: nothing more within {} ms", CEILING.as_millis());
            return out;
        }
        std::thread::sleep(Duration::from_millis(1));
    }
}

fn provides(evs: &[(usize, VncEv)]) -> Vec<(usize, String)> {
    evs.iter()
        .filter_map(|(i, e)| match e {
            VncEv::Provide(d) => Some((*i, String::from_utf8_lossy(d).to_string())),
            _ => None,
        })
        .collect()
}

/// Every guest event until the ceiling passes with none; the count of REQUESTs among them.
fn guest_requests(g: &mut Guest, what: &str) -> usize {
    log!("guest events after {what}:");
    let mut n = 0;
    while let Some(e) = g.next() {
        if matches!(&e, Ev::Msg(m) if m.ty == REQUEST) {
            n += 1;
        }
        log!("  {e:?}");
    }
    n
}

/// Two host pastes against one kept guest grab (no text pushed), both before the guest answers.
/// `two_clients`: the second paste is a second VNC client's, else the first client pastes twice.
fn s_two_pastes(two_clients: bool) {
    let tag = if two_clients { "two-pastes-two-clients" } else { "two-pastes-one-client" };
    let (qemu, mut g) = opened(tag);
    let mut a = qemu.vnc();
    let mut b = if two_clients { Some(qemu.vnc()) } else { None };
    g.send("GRAB [0][UTF8_TEXT] alone", &chunked(&grab(Some(0), &[UTF8]), 2048));
    {
        let mut vs: Vec<&mut Vnc> = vec![&mut a];
        if let Some(b) = b.as_mut() { vs.push(b); }
        host_events(&mut vs, &mut g, "the guest's grab");
    }
    a.request();
    let r1 = guest_requests(&mut g, "the first host paste");
    match b.as_mut() { Some(b) => b.request(), None => a.request() }
    let r2 = guest_requests(&mut g, "the second host paste, the first still unanswered");
    log!("{tag}: REQUESTs reaching the guest: {r1} for the first paste, {r2} for the second");
    g.send("one CLIPBOARD \"first-answer\"", &chunked(&clip(b"first-answer"), 2048));
    let p1 = {
        let mut vs: Vec<&mut Vnc> = vec![&mut a];
        if let Some(b) = b.as_mut() { vs.push(b); }
        provides(&host_events(&mut vs, &mut g, "one CLIPBOARD"))
    };
    let after1 = guest_requests(&mut g, "one CLIPBOARD");
    log!("{tag}: after one CLIPBOARD, provides (client, text) {p1:?}; further REQUESTs to the guest {after1}");
    g.send("a second CLIPBOARD \"second-answer\"", &chunked(&clip(b"second-answer"), 2048));
    let p2 = {
        let mut vs: Vec<&mut Vnc> = vec![&mut a];
        if let Some(b) = b.as_mut() { vs.push(b); }
        provides(&host_events(&mut vs, &mut g, "a second CLIPBOARD"))
    };
    log!("{tag}: after a second CLIPBOARD, provides (client, text) {p2:?}");
    a.request();
    let r3 = guest_requests(&mut g, "a third host paste");
    log!("{tag}: a third paste reaches the guest as {r3} REQUEST(s)");
    g.send("CLIPBOARD \"third-answer\"", &chunked(&clip(b"third-answer"), 2048));
    let p3 = {
        let mut vs: Vec<&mut Vnc> = vec![&mut a];
        if let Some(b) = b.as_mut() { vs.push(b); }
        provides(&host_events(&mut vs, &mut g, "the third answer"))
    };
    log!("{tag}: after the third answer, provides (client, text) {p3:?}");
}

/// A kept guest grab (no text pushed); a host paste reaches the guest as REQUEST; then a host copy
/// reaches it as GRAB s; only then the guest answers the REQUEST with its own, older text.
/// `two_clients`: the copy is a second VNC client's, else the pasting client's.
fn s_paste_crossed_by_host_grab(two_clients: bool) {
    let tag = if two_clients { "paste-crossed-by-host-grab-two-clients" } else { "paste-crossed-by-host-grab-one-client" };
    let (qemu, mut g) = opened(tag);
    let mut a = qemu.vnc();
    let mut b = if two_clients { Some(qemu.vnc()) } else { None };
    g.send("GRAB [0][UTF8_TEXT] alone", &chunked(&grab(Some(0), &[UTF8]), 2048));
    {
        let mut vs: Vec<&mut Vnc> = vec![&mut a];
        if let Some(b) = b.as_mut() { vs.push(b); }
        host_events(&mut vs, &mut g, "the guest's grab");
    }
    a.request();
    let r = guest_requests(&mut g, "the host paste");
    log!("{tag}: the paste reaches the guest as {r} REQUEST(s)");
    match b.as_mut() { Some(b) => b.copy(b"host-newer"), None => a.copy(b"host-newer") }
    let m = g.expect_msg(GRAB);
    log!("{tag}: the host copy reaches the guest as GRAB serial {}", le32(&m.data, 0));
    let before = {
        let mut vs: Vec<&mut Vnc> = vec![&mut a];
        if let Some(b) = b.as_mut() { vs.push(b); }
        host_events(&mut vs, &mut g, "the host copy, the paste still unanswered")
    };
    log!("{tag}: provides before the guest answers (client, text) {:?}", provides(&before));
    drain(&mut g, "the host copy");
    g.send("CLIPBOARD \"guest-older\", answering the paste after the host's grab", &chunked(&clip(b"guest-older"), 2048));
    let after = {
        let mut vs: Vec<&mut Vnc> = vec![&mut a];
        if let Some(b) = b.as_mut() { vs.push(b); }
        host_events(&mut vs, &mut g, "the guest's late CLIPBOARD")
    };
    log!("{tag}: after the late CLIPBOARD, provides (client, text) {:?}; every host event {} ", provides(&after), after.len());
    drain(&mut g, "the late CLIPBOARD");
    let p = a.paste(&mut g).map(|d| String::from_utf8_lossy(&d).to_string());
    log!("{tag}: the host's next paste is provided {p:?}");
    drain(&mut g, "that paste");
    g.send("REQUEST UTF8_TEXT", &chunked(&request(), 2048));
    let c = g.next();
    let text = match &c { Some(Ev::Msg(m)) if m.ty == CLIPBOARD => Some(String::from_utf8_lossy(&m.data[4..]).to_string()), _ => None };
    log!("{tag}: the guest's REQUEST after it is answered with {text:?}");
}

fn main() {
    let which: Vec<String> = std::env::args().skip(1).collect();
    let all = which.is_empty();
    let on = |n: &str| all || which.iter().any(|w| w == n);
    log!("probe start; qemu-system-x86_64 --version: {:?}",
        String::from_utf8_lossy(&Command::new("qemu-system-x86_64").arg("--version").output().unwrap().stdout).lines().next().unwrap().to_string());
    if on("features") { s_features(); }
    if on("handshake") { s_handshake(); }
    if on("ctrl-drop") { s_ctrl_drop(); }
    if on("opening") { s_opening("none"); s_opening("vnc"); }
    if on("caps") {
        s_caps_request(0, None);
        s_caps_request(1, None);
        s_caps_request(0, Some(0));
        s_caps_request(0, Some(1));
    }
    if on("layout") {
        s_layout(CAP_BY_DEMAND);
        s_layout(CAP_BY_DEMAND | CAP_GRAB_SERIAL);
        s_layout(CAP_BY_DEMAND | CAP_SELECTION | CAP_GRAB_SERIAL);
    }
    if on("host-grabs") { s_host_grabs(); }
    if on("host-size") { for n in [1_000_000, 1_048_000, 1_048_576] { s_host_size(n); } }
    if on("push") { s_push_one_element(); s_grab_alone(); s_grab_alone_empty_answer(); }
    if on("serial") { for s in [0, 1, 2, 3, 4] { s_serial(s); } }
    if on("close-cycle") { s_close_cycle(); s_reopen_clean(); }
    if on("closed") { s_closed_transmit(); }
    if on("release") { s_release(); }
    if on("guest-max") { s_guest_max(2_097_152); }
    if on("teardown") { s_teardown(); }
    if on("new-session") { s_serial_new_session(false); s_serial_new_session(true); }
    if on("empty-copy") { s_empty_copy(1); s_empty_copy(0); }
    if on("two-pastes") { s_two_pastes(false); s_two_pastes(true); }
    if on("crossed-paste") { s_paste_crossed_by_host_grab(false); s_paste_crossed_by_host_grab(true); }
    log!("probe end");
}
