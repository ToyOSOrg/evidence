# scratch: a VNC client that advertises the cursor pseudo-encodings and logs every
# cursor/pointer-related rectangle the server sends. usage: vncwatch.py <sock> <seconds>
import socket, struct, sys, time
s = socket.socket(socket.AF_UNIX); s.connect(sys.argv[1]); s.settimeout(0.5)
def rx(n):
    b = b''
    while len(b) < n:
        try: c = s.recv(n - len(b))
        except socket.timeout: continue
        if not c: raise SystemExit('closed')
        b += c
    return b
rx(12); s.sendall(b'RFB 003.008\n'); n = rx(1)[0]; rx(n); s.sendall(b'\x01'); rx(4)
s.sendall(b'\x01'); init = rx(24); w, h = struct.unpack('>HH', init[:4]); rx(struct.unpack('>I', init[20:24])[0])
print('server', w, h, flush=True)
# 32bpp pixel format default; encodings: raw, cursor(-239), alpha-cursor(-314), pointer-pos(-232)
encs = [0, -239, -314, -232, -308]
s.sendall(struct.pack('>BBH', 2, 0, len(encs)) + b''.join(struct.pack('>i', e) for e in encs))
end = time.time() + float(sys.argv[2]); bpp = 4
def req(inc): s.sendall(struct.pack('>BBHHHH', 3, inc, 0, 0, w, h))
req(0)
if len(sys.argv) > 4:
    W, H = int(sys.argv[3]), int(sys.argv[4])
    s.sendall(struct.pack('>BBHHBB', 251, 0, W, H, 1, 0) + struct.pack('>IHHHHI', 0, 0, 0, W, H, 0))
while time.time() < end:
    try: t = s.recv(1)
    except socket.timeout: req(1); continue
    if not t: break
    t = t[0]
    if t == 0:
        rx(1); (n,) = struct.unpack('>H', rx(2))
        for _ in range(n):
            x, y, rw, rh, e = struct.unpack('>HHHHi', rx(12))
            if e == 0: rx(rw * rh * bpp)
            elif e == -239:
                px = rx(rw * rh * bpp); mask = rx(((rw + 7) // 8) * rh)
                print(time.time(), 'CURSOR hot', x, y, 'size', rw, rh, 'opaque-bits', sum(bin(m).count('1') for m in mask), flush=True)
            elif e == -314:
                (ie,) = struct.unpack('>i', rx(4)); px = rx(rw * rh * 4)
                nz = sum(1 for i in range(3, len(px), 4) if px[i])
                print(time.time(), 'ALPHACURSOR hot', x, y, 'size', rw, rh, 'enc', ie, 'alpha>0', nz, flush=True)
            elif e == -232: print(time.time(), 'POINTERPOS', x, y, flush=True)
            elif e == -308:
                ns = rx(4)[0]; rx(16 * ns); print(time.time(), 'DESKTOPSIZE', rw, rh, flush=True); w, h = rw, rh
            elif e == -223: print(time.time(), 'DESKTOPSIZE(old)', rw, rh, flush=True); w, h = rw, rh
            else: print('unknown enc', e, flush=True); raise SystemExit
        req(1)
    elif t == 2: pass
    elif t == 3: rx(3); rx(struct.unpack('>I', rx(4))[0])
    else: print('msg', t, flush=True); raise SystemExit
