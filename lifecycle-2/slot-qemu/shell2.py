# Read and drive a q35 pcie-root-port's hot-plug registers from the UEFI shell OVMF falls into.
import json, socket, subprocess, sys, time, os, shutil, re
d = sys.argv[1]; acpihp = sys.argv[2]
qs, ss = os.path.join(d, "qmp.sock"), os.path.join(d, "ser.sock")
for x in (qs, ss):
    if os.path.exists(x): os.remove(x)
vars_ = os.path.join(d, "vars.fd"); shutil.copy("/opt/homebrew/share/qemu/edk2-i386-vars.fd", vars_)
args = ["qemu-system-x86_64", "-machine", "q35", "-m", "512", "-display", "none", "-vga", "none",
  "-drive", "if=pflash,format=raw,unit=0,file=/opt/homebrew/share/qemu/edk2-x86_64-code.fd,readonly=on",
  "-drive", f"if=pflash,format=raw,unit=1,file={vars_}",
  "-global", f"ICH9-LPC.acpi-pci-hotplug-with-bridge-support={acpihp}",
  "-device", "pcie-root-port,id=hp,chassis=3,slot=3", "-qmp", f"unix:{qs},server,nowait",
  "-serial", f"unix:{ss},server,nowait", "-net", "none"]
p = subprocess.Popen(args, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
T0 = time.time()
def say(*a): print(f"[{time.time()-T0:7.2f}]", *a, flush=True)
try:
    for _ in range(100):
        if os.path.exists(qs) and os.path.exists(ss): break
        time.sleep(0.1)
    q = socket.socket(socket.AF_UNIX); q.connect(qs); qf = q.makefile("rw")
    ser = socket.socket(socket.AF_UNIX); ser.connect(ss); ser.settimeout(0.2)
    buf = b""
    def pump(t):
        global buf
        end = time.time() + t
        while time.time() < end:
            try:
                c = ser.recv(65536)
                if c: buf += c
            except socket.timeout: pass
    def rx():
        while True:
            m = json.loads(qf.readline())
            if "event" in m:
                if m["event"] != "RTC_CHANGE": say("EVENT", m["event"], m.get("data"))
                continue
            return m
    def cmd(c, **a):
        qf.write(json.dumps({"execute": c, "arguments": a}) + "\n"); qf.flush(); return rx()
    rx(); cmd("qmp_capabilities")
    for _ in range(120):
        pump(1)
        if b"Shell>" in buf: break
    say("shell reached:", b"Shell>" in buf)
    def sh(line):
        global buf
        buf = b""
        for ch in line + "\r":
            ser.send(ch.encode()); time.sleep(0.005)
        for _ in range(60):
            pump(0.2)
            if buf.rstrip().endswith(b"Shell>") and len(buf) > len(line) + 8: break
        return re.sub(r"\x1b\[[0-9;]*[A-Za-z]", "", buf.decode(errors="replace"))
    BASE = 0xB0000000
    def addr(b, dv, f, off): return BASE + (b << 20) + (dv << 15) + (f << 12) + off
    def pa(b, dv, f, off): return (b << 28) | (dv << 20) | (f << 12) | off
    def rd(b, dv, f, off, w):
        out = sh(f"mm {pa(b,dv,f,off):#x} -w {w} -pcie -n")
        m = re.search(r":\s*0x([0-9A-Fa-f]+)", out)
        if not m: say("unparsed:", repr(out[-200:])); return None
        return int(m.group(1), 16)
    def wr(b, dv, f, off, w, v):
        sh(f"mm {pa(b,dv,f,off):#x} {v:#x} -w {w} -pcie -n")
    P = (0, 1, 0)
    def cap(cid):
        ptr = rd(*P, 0x34, 1)
        while ptr:
            if rd(*P, ptr, 1) == cid: return ptr
            ptr = rd(*P, ptr + 1, 1)
    say("port vendor/device", hex(rd(*P, 0, 4)))
    e = cap(0x10); msi = cap(0x05); msix = cap(0x11)
    say(f"express@{e:#x} msi@{msi} msix@{msix}")
    if msix: say(f"msix ctl={rd(*P, msix+2, 2):#06x} table={rd(*P, msix+4, 4):#x}")
    if msi: say(f"msi ctl={rd(*P, msi+2, 2):#06x}")
    def dump(tag):
        say(tag, f"caps={rd(*P,e+2,2):#06x} linkcap={rd(*P,e+0xc,4):#010x} linkctl={rd(*P,e+0x10,2):#06x} linksta={rd(*P,e+0x12,2):#06x} slotcap={rd(*P,e+0x14,4):#010x} slotctl={rd(*P,e+0x18,2):#06x} slotsta={rd(*P,e+0x1a,2):#06x} sec={rd(*P,0x19,1)} mem={rd(*P,0x20,4):#010x} pref={rd(*P,0x24,4):#010x} below={rd(1,0,0,0,4):#010x} bar0={rd(1,0,0,0x10,4):#010x}")
    def present(): return len(cmd("query-pci")["return"][0]["devices"][1].get("pci_bridge", {}).get("devices", []))
    dump("boot")
    say("A: guest passive")
    say(cmd("device_add", driver="edu", bus="hp", id="e1")); pump(1); dump("A added"); say("present", present())
    say(cmd("device_del", id="e1")); pump(2); dump("A deleted"); say("present", present())
    say("B: guest enables HPIE|ABPE|PDCE|DLLSCE|CCIE, PIC on, power on")
    wr(*P, e+0x1a, 2, 0x1ff)
    wr(*P, e+0x18, 2, (1<<0)|(1<<3)|(1<<4)|(1<<5)|(1<<12)|(0b01<<8)|(0b11<<6))
    pump(1); dump("B armed")
    wr(*P, e+0x1a, 2, 0x1ff); dump("B cleared")
    say(cmd("device_add", driver="edu", bus="hp", id="e2")); pump(1); dump("B added"); say("present", present())
    wr(*P, e+0x1a, 2, 0x1ff); dump("B added cleared")
    say(cmd("device_del", id="e2")); pump(1); dump("B del asked"); say("present", present())
    pump(6); dump("B del +6s"); say("present", present())
    wr(*P, e+0x1a, 2, 0x1ff)
    say("B: power off, PIC off")
    ctl = rd(*P, e+0x18, 2)
    wr(*P, e+0x18, 2, (ctl & ~(0b11<<8)) | (0b11<<8) | (1<<10))
    pump(2); dump("B powered off"); say("present", present())
    say("C: power on again, add e3")
    wr(*P, e+0x1a, 2, 0x1ff)
    ctl = rd(*P, e+0x18, 2)
    wr(*P, e+0x18, 2, (ctl & ~((0b11<<8)|(1<<10))) | (0b01<<8))
    pump(1); dump("C on")
    say(cmd("device_add", driver="edu", bus="hp", id="e3")); pump(1); dump("C added"); say("present", present())
    wr(*P, e+0x1a, 2, 0x1ff)
    say("D: surprise? device_del with PIC off but power on")
    ctl = rd(*P, e+0x18, 2)
    wr(*P, e+0x18, 2, (ctl & ~(0b11<<8)) | (0b11<<8))
    pump(1)
    say(cmd("device_del", id="e3")); pump(2); dump("D del"); say("present", present())
finally:
    p.kill()
