# Scratch: a newc cpio with one static binary as /init, /dev/console, and each
# further argument's file tree at its own absolute path.
import sys, os, stat
out, init, trees = sys.argv[1], sys.argv[2], sys.argv[3:]
ino = [1]
def entry(name, mode, data=b'', rdev=(0, 0)):
    ino[0] += 1
    hdr = '070701' + ''.join('%08x' % v for v in (
        ino[0], mode, 0, 0, 1, 0, len(data), 0, 0, rdev[0], rdev[1], len(name) + 1, 0))
    b = hdr.encode() + name.encode() + b'\0'
    b += b'\0' * (-len(b) % 4)
    return b + data + b'\0' * (-len(data) % 4)
blob = entry('dev', stat.S_IFDIR | 0o755)
blob += entry('dev/console', stat.S_IFCHR | 0o600, rdev=(5, 1))
blob += entry('tmp', stat.S_IFDIR | 0o777)
blob += entry('init', stat.S_IFREG | 0o755, open(init, 'rb').read())
dirs = set()
for tree in trees:
    for root, _, files in os.walk(tree):
        parts = root.strip('/').split('/')
        for i in range(1, len(parts) + 1):
            d = '/'.join(parts[:i])
            if d not in dirs:
                dirs.add(d)
                blob += entry(d, stat.S_IFDIR | 0o755)
        for f in files:
            p = os.path.join(root, f)
            blob += entry(p.strip('/'), stat.S_IFREG | 0o644, open(p, 'rb').read())
blob += entry('TRAILER!!!', 0)
open(out, 'wb').write(blob + b'\0' * (-len(blob) % 512))
