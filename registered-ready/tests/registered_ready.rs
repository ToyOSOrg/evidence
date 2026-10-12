//! Measurement only, never lands: PR #863's amendment D, a mio source
//! registered while its direction is already ready, modelled with stage 2's
//! (#878) `toyos_transport::stream` ends unchanged, as `main` holds them.
//!
//! One direction of one stream and two threads: netstack's, which serves its
//! doorbell and, rung by the client, rings each set client want whose
//! direction is ready (amendment B), until the client hangs up; and the
//! client's, which registers the source with mio and waits for its first
//! event, as tokio's `connect_mio` waits for `WRITABLE` and its first read for
//! `READABLE` before any I/O. The direction is made ready either before the
//! registration, by netstack before either thread runs (`*_before`), or by
//! netstack's thread while the client registers (`*_racing`): bytes in the
//! receive ring, the receive ring's `end`, room in the send ring, or, with the
//! send ring full, a fatal `end`: a reset, which makes the send direction ready
//! to every look, as Linux's `tcp_poll` answers a reset socket `EPOLLOUT`
//! (`*_reset_*`). Under the `head-only` control a look that arms the send
//! direction, and netstack's ring back, read only its head, as #863 recorded
//! them at 148d26583; the operation an event leads to reads the `end` either
//! way, as amendment A's woken writer "reads why".
//!
//! A doorbell is a kernel pipe as the client waits on it: a ring writes a byte
//! and posts its watch; a watch is answered at once if the pipe holds a byte
//! when it is registered, and otherwise by whether the pipe holds a byte when
//! its submitter looks after a post, armed again if it does not
//! (`kernel/src/inbox/polls.rs`, `deliver`). An event leads to the source's
//! operation, which under the end either finds the direction ready, and the
//! model ends, or answers `WouldBlock` the way the design's empty `read` and
//! full `write` do: drain, arm, look, and wait for the next event. loom fails a
//! run that ends with a thread waiting.
//!
//! Shared by `Rc`, as #878's model is: loom's threads run on the one thread
//! that runs the model, and loom's `Arc` panics again in its drop while a
//! failed model unwinds.

use core::sync::atomic::Ordering;
use std::rc::Rc;

use loom::sync::atomic::{AtomicBool, AtomicU32};
use loom::sync::{Condvar, Mutex};
use toyos_transport::{stream, Word};

struct Shared(AtomicU32);

impl Word for Shared {
    fn load(&self, order: Ordering) -> u32 {
        self.0.load(order)
    }
    fn store(&self, value: u32, order: Ordering) {
        self.0.store(value, order)
    }
    fn swap(&self, value: u32, order: Ordering) -> u32 {
        self.0.swap(value, order)
    }
}

const RING: u32 = 2;
const WORDS: usize = 8;
type Page = [Shared; WORDS];
// head, tail, data want, room want, base
const RX: stream::Place<RING, WORDS> = stream::Place::new::<0, 1, 2, 3, 0>();
const TX: stream::Place<RING, WORDS> = stream::Place::new::<4, 5, 6, 7, 2>();
/// The client's want for each direction: the receive ring's data want, the
/// send ring's room want.
const RX_WANT: usize = 2;
const TX_WANT: usize = 7;

/// How a waker clears a want, as stage 2's ends do.
const WAKE: Ordering = if cfg!(feature = "want-relaxed") { Ordering::Relaxed } else { Ordering::Release };

/// The control: a fatal `end` is no readiness to the send direction's arming
/// look nor to netstack's ring back.
const HEAD_ONLY: bool = cfg!(feature = "head-only");

/// A one-byte doorbell pipe: one side holds its write end, the other its read
/// end.
struct Pipe {
    level: Mutex<Level>,
    posted: Condvar,
}

struct Level {
    bytes: u32,
    posts: u32,
}

impl Pipe {
    fn new() -> Self {
        Self { level: Mutex::new(Level { bytes: 0, posts: 0 }), posted: Condvar::new() }
    }

    /// `SYS_WRITE` of one byte: the watch's post wakes every waiter.
    fn ring(&self) {
        let mut level = self.level.lock().unwrap();
        level.bytes += 1;
        level.posts += 1;
        self.posted.notify_all();
    }

    /// A nonblocking `SYS_READ` of every byte there.
    fn drain(&self) {
        self.level.lock().unwrap().bytes = 0;
    }

    /// A blocking `SYS_READ` and the drain after it: every byte there is taken.
    fn wait(&self) {
        let mut level = self.level.lock().unwrap();
        while level.bytes == 0 {
            level = self.posted.wait(level).unwrap();
        }
        level.bytes = 0;
    }

    /// mio's `select` arming `OP_WATCH` for reading and waiting for it: a
    /// byte there at registration answers it at once; otherwise a post fires
    /// it, and its submitter looks when it runs; a look that finds no byte
    /// arms it again.
    fn watch(&self) {
        let mut seen = {
            let level = self.level.lock().unwrap();
            if level.bytes != 0 {
                return;
            }
            level.posts
        };
        loop {
            {
                let mut level = self.level.lock().unwrap();
                while level.posts == seen {
                    level = self.posted.wait(level).unwrap();
                }
            }
            let level = self.level.lock().unwrap();
            if level.bytes != 0 {
                return;
            }
            seen = level.posts;
        }
    }
}

/// The client's end of the direction.
enum End {
    Read(stream::Consumer<RING, WORDS>),
    Write(stream::Producer<RING, WORDS>),
}

/// netstack's end of the direction.
enum NetEnd {
    Read(stream::Producer<RING, WORDS>),
    Write(stream::Consumer<RING, WORDS>),
}

struct Session {
    what: What,
    page: Page,
    /// The receive ring's `end`, written by netstack once.
    ended: AtomicU32,
    /// The direction's doorbell, netstack to client: the connection for
    /// `READABLE`, the stream's bell for `WRITABLE` (amendment A).
    bell: Pipe,
    /// netstack's doorbell, client to netstack.
    net_bell: Pipe,
    /// The client hung up: netstack's loop ends at its next ring.
    quit: AtomicBool,
    /// The direction's end, behind its mutex (amendment B).
    end: Mutex<End>,
}

impl Session {
    /// The receive ring's `end`, read with `Acquire`; only the cases that
    /// write it read it.
    fn ended(&self) -> bool {
        matches!(self.what, What::End | What::Reset) && self.ended.load(Ordering::Acquire) != 0
    }

    /// What the source's operation waits for is there: bytes or the `end` to
    /// read, room or a fatal `end` to write.
    fn ready(&self, end: &mut End) -> bool {
        match end {
            End::Read(rx) => rx.ready(&self.page).unwrap() > 0 || self.ended(),
            End::Write(tx) => tx.room(&self.page).unwrap() > 0 || self.ended(),
        }
    }

    /// Arm the client's want, then look again.
    fn arm(&self, end: &mut End) -> bool {
        match end {
            End::Read(rx) => rx.arm(&self.page).unwrap() > 0 || self.ended(),
            End::Write(tx) => tx.arm(&self.page).unwrap() > 0 || (!HEAD_ONLY && self.ended()),
        }
    }
}

/// What makes the direction ready.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
enum What {
    /// netstack publishes a byte into the receive ring.
    Bytes,
    /// netstack writes the receive ring's `end`: a FIN.
    End,
    /// The send ring has room: empty at the connect's answer before the
    /// registration, released by netstack from full while it races it.
    Room,
    /// netstack writes the receive ring's `end` as a reset while the send ring
    /// is full: the send direction is ready with no room released.
    Reset,
}

impl What {
    fn want(self) -> usize {
        match self {
            What::Bytes | What::End => RX_WANT,
            What::Room | What::Reset => TX_WANT,
        }
    }
}

#[derive(Clone, Copy, PartialEq, Eq, Debug)]
enum Rule {
    /// As #863 records it at d0181491b: registration watches the doorbell and
    /// does nothing else; a source is read to `WouldBlock`, which arms.
    AsWritten,
    /// Amendment D: registration takes the direction's end, arms its want by
    /// exchange, looks, lets the end go, and rings netstack if the look found
    /// the direction ready.
    Armed,
    /// Amendment D less the arm: it looks, and rings netstack if ready.
    NoArm,
    /// Amendment D less the ring: it arms and looks, and rings nobody.
    NoRing,
}

/// netstack makes the direction ready; `true` if the client's want was set,
/// and so a ring is owed.
fn make_ready(s: &Session, end: &mut NetEnd) -> bool {
    match (end, s.what) {
        (NetEnd::Read(rx), What::Bytes) => {
            assert_eq!(rx.room(&s.page), Ok(RING));
            assert!(rx.advance(1));
            rx.publish(&s.page)
        }
        (NetEnd::Read(_), What::End) => {
            s.ended.store(1, Ordering::Release);
            s.page[RX_WANT].swap(0, WAKE) != 0
        }
        (NetEnd::Write(_), What::Reset) => {
            s.ended.store(1, Ordering::Release);
            // It exchanges both client wants; the receive direction's is no
            // part of this model.
            s.page[TX_WANT].swap(0, WAKE) != 0
        }
        (NetEnd::Write(tx), What::Room) => {
            assert_eq!(tx.ready(&s.page), Ok(RING));
            assert!(tx.advance(RING));
            tx.release(&s.page)
        }
        _ => unreachable!(),
    }
}

fn netstack(s: &Session, racing: bool, mut end: NetEnd) {
    if racing && make_ready(s, &mut end) {
        s.bell.ring();
    }
    loop {
        s.net_bell.wait();
        // Amendment B: rung by a client, netstack rings each set client want
        // whose direction is ready.
        let ready = match &mut end {
            NetEnd::Read(rx) => rx.room(&s.page).unwrap() < RING || s.what == What::End,
            NetEnd::Write(tx) => tx.ready(&s.page).unwrap() < RING || (s.what == What::Reset && !HEAD_ONLY),
        };
        if ready && s.page[s.what.want()].swap(0, WAKE) != 0 {
            s.bell.ring();
        }
        if s.quit.load(Ordering::Acquire) {
            return;
        }
    }
}

/// `Registry::register`: the source's part, before mio's `select` watches the
/// doorbell.
fn register(s: &Session, rule: Rule) {
    let ready = {
        let mut end = s.end.lock().unwrap();
        match rule {
            Rule::AsWritten => return,
            Rule::Armed | Rule::NoRing => s.arm(&mut end),
            Rule::NoArm => s.ready(&mut end),
        }
    };
    if ready && rule != Rule::NoRing {
        s.net_bell.ring();
    }
}

/// The first event and the operation it leads to; returns once the operation
/// finds the direction ready.
fn first_io(s: &Session) {
    loop {
        s.bell.watch();
        let mut end = s.end.lock().unwrap();
        if s.ready(&mut end) {
            return;
        }
        // `WouldBlock`, as the design's empty `read` and full `write` answer it.
        s.bell.drain();
        if s.arm(&mut end) {
            return;
        }
    }
}

fn session(what: What, racing: bool, rule: Rule) {
    loom::model(move || {
        let page: Page = core::array::from_fn(|_| Shared(AtomicU32::new(0)));
        let (end, mut net_end) = match what {
            What::Bytes | What::End => {
                (End::Read(stream::Consumer::new(&page, RX)), NetEnd::Read(stream::Producer::new(&page, RX)))
            }
            What::Room | What::Reset => {
                let mut tx = stream::Producer::new(&page, TX);
                let net_tx = stream::Consumer::new(&page, TX);
                if racing || what == What::Reset {
                    // The send ring starts full: netstack has taken none of it.
                    assert_eq!(tx.room(&page), Ok(RING));
                    assert!(tx.advance(RING));
                    assert!(!tx.publish(&page), "nobody armed yet");
                }
                (End::Write(tx), NetEnd::Write(net_tx))
            }
        };
        let s = Rc::new(Session {
            what,
            page,
            ended: AtomicU32::new(0),
            bell: Pipe::new(),
            net_bell: Pipe::new(),
            quit: AtomicBool::new(false),
            end: Mutex::new(end),
        });
        if !racing && what != What::Room {
            assert!(!make_ready(&s, &mut net_end), "nobody armed yet");
        }

        let net = {
            let s = Rc::clone(&s);
            loom::thread::spawn(move || netstack(&s, racing, net_end))
        };

        register(&s, rule);
        first_io(&s);

        s.quit.store(true, Ordering::Release);
        s.net_bell.ring();
        net.join().unwrap();
    });
}

macro_rules! cases {
    ($($name:ident: $what:expr, $racing:expr, $rule:expr;)*) => {
        $(
            #[test]
            fn $name() {
                session($what, $racing, $rule);
            }
        )*
    };
}

cases! {
    as_written_bytes_before: What::Bytes, false, Rule::AsWritten;
    as_written_end_before: What::End, false, Rule::AsWritten;
    as_written_room_before: What::Room, false, Rule::AsWritten;
    as_written_bytes_racing: What::Bytes, true, Rule::AsWritten;
    as_written_end_racing: What::End, true, Rule::AsWritten;
    as_written_room_racing: What::Room, true, Rule::AsWritten;
    armed_bytes_before: What::Bytes, false, Rule::Armed;
    armed_end_before: What::End, false, Rule::Armed;
    armed_room_before: What::Room, false, Rule::Armed;
    armed_bytes_racing: What::Bytes, true, Rule::Armed;
    armed_end_racing: What::End, true, Rule::Armed;
    armed_room_racing: What::Room, true, Rule::Armed;
    no_arm_bytes_before: What::Bytes, false, Rule::NoArm;
    no_arm_end_before: What::End, false, Rule::NoArm;
    no_arm_room_before: What::Room, false, Rule::NoArm;
    no_arm_bytes_racing: What::Bytes, true, Rule::NoArm;
    no_arm_end_racing: What::End, true, Rule::NoArm;
    no_arm_room_racing: What::Room, true, Rule::NoArm;
    no_ring_bytes_before: What::Bytes, false, Rule::NoRing;
    no_ring_end_before: What::End, false, Rule::NoRing;
    no_ring_room_before: What::Room, false, Rule::NoRing;
    no_ring_bytes_racing: What::Bytes, true, Rule::NoRing;
    no_ring_end_racing: What::End, true, Rule::NoRing;
    no_ring_room_racing: What::Room, true, Rule::NoRing;
    as_written_reset_before: What::Reset, false, Rule::AsWritten;
    as_written_reset_racing: What::Reset, true, Rule::AsWritten;
    armed_reset_before: What::Reset, false, Rule::Armed;
    armed_reset_racing: What::Reset, true, Rule::Armed;
    no_arm_reset_before: What::Reset, false, Rule::NoArm;
    no_arm_reset_racing: What::Reset, true, Rule::NoArm;
    no_ring_reset_before: What::Reset, false, Rule::NoRing;
    no_ring_reset_racing: What::Reset, true, Rule::NoRing;
}
