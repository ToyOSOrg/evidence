# scratch probe: attach to QEMU's p2p D-Bus display through QMP and log every
# CursorDefine and MouseSet the console layer emits (the calls a UI such as
# cocoa consumes). usage: dbuswatch.py <qmp.sock> <seconds>
import socket, struct, sys, os, time, array, json

def align(n, a): return (n + a - 1) // a * a

class Reader:
    def __init__(self, sock): self.s = sock; self.buf = b''; self.fds = []
    def fill(self, n):
        while len(self.buf) < n:
            fds = array.array('i')
            msg, anc, _, _ = self.s.recvmsg(1 << 20, socket.CMSG_SPACE(16 * fds.itemsize))
            for lvl, typ, data in anc:
                if lvl == socket.SOL_SOCKET and typ == socket.SCM_RIGHTS:
                    fds.frombytes(data[:len(data) - len(data) % fds.itemsize]); self.fds += list(fds)
            if not msg: raise SystemExit('closed')
            self.buf += msg
    def take(self, n): self.fill(n); b, self.buf = self.buf[:n], self.buf[n:]; return b
    def line(self):
        while b'\r\n' not in self.buf: self.fill(len(self.buf) + 1)
        i = self.buf.index(b'\r\n'); l, self.buf = self.buf[:i], self.buf[i + 2:]; return l.decode()

def sig_value(data, off, code):
    # minimal: parse the basic types and strings/object paths/signatures used in headers
    if code in 'so':
        off = align(off, 4); (n,) = struct.unpack_from('<I', data, off); return data[off + 4:off + 4 + n].decode(), off + 5 + n
    if code == 'g':
        n = data[off]; return data[off + 1:off + 1 + n].decode(), off + 2 + n
    if code == 'u':
        off = align(off, 4); return struct.unpack_from('<I', data, off)[0], off + 4
    raise ValueError(code)

def read_msg(r):
    hdr = r.take(16)
    endian, mtype, flags, ver, blen, serial, flen = struct.unpack('<cBBBIII', hdr)
    assert endian == b'l'
    fields_raw = r.take(align(16 + flen, 8) - 16)
    data = hdr + fields_raw
    fields = {}; off = 16
    while off < 16 + flen:
        off = align(off, 8); code = data[off]; sl = data[off + 1]; sig = data[off + 2:off + 2 + sl].decode(); off += 3 + sl
        v, off = sig_value(data, off, sig); fields[code] = v
    body = r.take(blen)
    return mtype, flags, serial, fields, body, len(data)

def header(mtype, flags, serial, blen, fields):
    out = b''
    for code, sig, val in fields:
        out += b'\0' * (align(16 + len(out), 8) - 16 - len(out))
        out += bytes([code, len(sig)]) + sig.encode() + b'\0'
        if sig in 'so':
            out += b'\0' * (align(16 + len(out), 4) - 16 - len(out)); e = val.encode(); out += struct.pack('<I', len(e)) + e + b'\0'
        elif sig == 'g': e = val.encode(); out += bytes([len(e)]) + e + b'\0'
        elif sig == 'u': out += b'\0' * (align(16 + len(out), 4) - 16 - len(out)); out += struct.pack('<I', val)
    h = struct.pack('<cBBBIII', b'l', mtype, flags, 1, blen, serial, len(out)) + out
    return h + b'\0' * (align(len(h), 8) - len(h))

qmp = socket.socket(socket.AF_UNIX); qmp.connect(sys.argv[1]); qf = qmp.makefile('rw')
def qcmd(obj, fds=None):
    data = (json.dumps(obj) + '\n').encode()
    if fds: qmp.sendmsg([data], [(socket.SOL_SOCKET, socket.SCM_RIGHTS, array.array('i', fds))])
    else: qmp.sendall(data)
    while True:
        l = json.loads(qf.readline())
        if 'return' in l or 'error' in l: return l
qf.readline(); qcmd({'execute': 'qmp_capabilities'})
mine, theirs = socket.socketpair()
print('getfd', qcmd({'execute': 'getfd', 'arguments': {'fdname': 'dbusprobe'}}, [theirs.fileno()]), flush=True)
print('add_client', qcmd({'execute': 'add_client', 'arguments': {'protocol': '@dbus-display', 'fdname': 'dbusprobe'}}), flush=True)
theirs.close()
uid = str(os.getuid()).encode().hex()
mine.sendall(b'\0AUTH EXTERNAL ' + uid.encode() + b'\r\n'); r = Reader(mine); print('auth', r.line(), flush=True)
mine.sendall(b'NEGOTIATE_UNIX_FD\r\n'); print('fd', r.line(), flush=True); mine.sendall(b'BEGIN\r\n')
lmine, ltheirs = socket.socketpair()
body = struct.pack('<I', 0)
h = header(1, 0, 1, len(body), [(1, 'o', '/org/qemu/Display1/Console_0'), (2, 's', 'org.qemu.Display1.Console'), (3, 's', 'RegisterListener'), (8, 'g', 'h'), (9, 'u', 1)])
mine.sendmsg([h + body], [(socket.SOL_SOCKET, socket.SCM_RIGHTS, array.array('i', [ltheirs.fileno()]))])
ltheirs.close()
lr = Reader(lmine)
lmine.sendall(b'\0AUTH EXTERNAL ' + uid.encode() + b'\r\n'); print('listener auth', lr.line(), flush=True)
lmine.sendall(b'NEGOTIATE_UNIX_FD\r\n'); print('listener fd', lr.line(), flush=True); lmine.sendall(b'BEGIN\r\n')
mt, fl, se, f, b, _ = read_msg(r); print('register answered type', mt, f.get(4), b[:80], flush=True)
end = time.time() + float(sys.argv[2]); serial = 100
lmine.settimeout(None)
while time.time() < end:
    mt, fl, se, f, b, _ = read_msg(lr)
    member, iface = f.get(3), f.get(2)
    t = '%.3f' % time.time()
    if member == 'MouseSet':
        x, y, on = struct.unpack('<iii', b[:12]); print(t, 'MouseSet', x, y, 'on' if on else 'OFF', flush=True)
    elif member == 'CursorDefine':
        w, h_, hx, hy = struct.unpack('<iiii', b[:16]); (n,) = struct.unpack('<I', b[16:20]); px = b[20:20 + n]
        print(t, 'CursorDefine', w, h_, 'hot', hx, hy, 'alpha>0', sum(1 for i in range(3, len(px), 4) if px[i]), flush=True)
    elif member in ('Update', 'UpdateMap'):
        pass
    else:
        print(t, 'call', iface, member, 'sig', f.get(8), flush=True)
    if mt == 1 and not (fl & 1):
        serial += 1
        if iface == 'org.freedesktop.DBus.Properties':
            ename = 'org.freedesktop.DBus.Error.UnknownProperty'; eb = b''
            e = ename
            msg = b'none'; bb = struct.pack('<I', len(msg)) + msg + b'\0'
            lmine.sendall(header(3, 0, serial, len(bb), [(4, 's', e), (5, 'u', se), (8, 'g', 's')]) + bb)
        else:
            lmine.sendall(header(2, 0, serial, 0, [(5, 'u', se)]))
