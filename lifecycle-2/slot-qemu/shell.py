# Read a q35 pcie-root-port's hot-plug registers from the UEFI shell OVMF falls into.
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
            if "event" in m: print("EVENT", m["event"], m.get("data"), flush=True); continue
            return m
    def cmd(c, **a):
        qf.write(json.dumps({"execute": c, "arguments": a}) + "\n"); qf.flush(); return rx()
    rx(); cmd("qmp_capabilities")
    # Wait for the shell prompt.
    for _ in range(120):
        pump(1)
        if b"Shell>" in buf: break
    print("shell reached:", b"Shell>" in buf, flush=True)
    def sh(line, wait=3):
        global buf
        buf = b""
        for ch in line + "\r":
            ser.send(ch.encode()); time.sleep(0.01)
        pump(wait)
        return re.sub(r"\x1b\[[0-9;]*[A-Za-z]", "", buf.decode(errors="replace"))
    def regs(tag):
        print(f"--- {tag}", flush=True)
        out = sh("pci 00 03 00 -i", 6)
        print(out[-6000:], flush=True)
    out = sh("pci", 4); print(out, flush=True)
    regs("boot")
    print(cmd("device_add", driver="edu", bus="hp", id="e1"), flush=True)
    pump(2); rx_events = None
    regs("added")
    print(sh("pci", 4), flush=True)
    print(cmd("device_del", id="e1"), flush=True)
    pump(4)
    regs("deleted")
    print(sh("pci", 4), flush=True)
    print(cmd("query-pci"), flush=True)
finally:
    p.kill()
