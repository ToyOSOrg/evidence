# Dump the DSDT QEMU builds for a q35 with a pcie-root-port, from the UEFI shell's table list and QMP pmemsave.
import json, socket, subprocess, sys, time, os, shutil, re
d, acpihp, out = sys.argv[1], sys.argv[2], os.path.abspath(sys.argv[3])
qs, ss = os.path.join(d, "qmp.sock"), os.path.join(d, "ser.sock")
for x in (qs, ss):
    if os.path.exists(x): os.remove(x)
vars_ = os.path.join(d, "vars.fd"); shutil.copy("/opt/homebrew/share/qemu/edk2-i386-vars.fd", vars_)
args = ["qemu-system-x86_64", "-machine", "q35", "-m", "512", "-display", "none", "-vga", "none",
  "-drive", "if=pflash,format=raw,unit=0,file=/opt/homebrew/share/qemu/edk2-x86_64-code.fd,readonly=on",
  "-drive", f"if=pflash,format=raw,unit=1,file={vars_}",
  "-global", f"ICH9-LPC.acpi-pci-hotplug-with-bridge-support={acpihp}",
  "-device", "pcie-root-port,id=hpslot,chassis=3,slot=3", "-qmp", f"unix:{qs},server,nowait",
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
    def cmd(c, **a):
        qf.write(json.dumps({"execute": c, "arguments": a}) + "\n"); qf.flush()
        while True:
            m = json.loads(qf.readline())
            if "event" not in m: return m
    json.loads(qf.readline()); cmd("qmp_capabilities")
    for _ in range(120):
        pump(1)
        if b"Shell>" in buf: break
    buf = b""
    for ch in "dmem\r":
        ser.send(ch.encode()); time.sleep(0.005)
    pump(15)
    text = re.sub(r"\x1b\[[0-9;]*[A-Za-z]", "", buf.decode(errors="replace"))
    print(text)
    m = re.search(r"ACPI 2\.0 Table\s+([0-9A-Fa-f]+)", text)
    def mem(addr, n):
        cmd("human-monitor-command", **{"command-line": f'pmemsave {addr:#x} {n} "{out}.tmp"'})
        return open(out + ".tmp", "rb").read()
    rsdp = int(m.group(1), 16)
    r = mem(rsdp, 36); assert r[:8] == b"RSD PTR ", r[:8]
    xsdt = int.from_bytes(r[24:32], "little")
    x = mem(xsdt, 36); xl = int.from_bytes(x[4:8], "little"); x = mem(xsdt, xl)
    for i in range(36, xl, 8):
        t = int.from_bytes(x[i:i+8], "little")
        h = mem(t, 36)
        if h[:4] == b"FACP":
            f = mem(t, int.from_bytes(h[4:8], "little"))
            dsdt = int.from_bytes(f[140:148], "little") or int.from_bytes(f[40:44], "little")
            dl = int.from_bytes(mem(dsdt, 8)[4:8], "little")
            open(out, "wb").write(mem(dsdt, dl))
            print("DSDT at", hex(dsdt), "wrote", dl, "bytes", flush=True)
finally:
    p.kill()
