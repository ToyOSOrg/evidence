# Scratch: the two cells the raw A/B rule failed, beside ring's own head/base ratio in the same boots
# (ring's code is identical in both images, so its ratio is the boot's own drift).
import re, sys
M = sys.argv[1]
def rows(path):
    out = {}
    for line in open(path, errors="replace"):
        m = re.search(r"parity: (\S+) row (\S+) ours=([\d.]+) a=([\d.]+) b=([\d.]+)", line)
        if m:
            out[(m.group(1), m.group(2))] = tuple(map(float, m.group(3, 4, 5)))
    return out
for bench, build, row in [("t14", "unasserted", "ecdsa-p-256-sha-256/verify/64"), ("t14", "unasserted", "p-256/ecdh"),
                          ("amd", "asserted", "chacha20-poly1305/key"), ("t14", "asserted", "chacha20-poly1305/key")]:
    for k in (1, 2):
        b = rows(f"{M}/{bench}-base-{k}/cryptocase/kernel.log")[(build, row)]
        h = rows(f"{M}/{bench}-head-{k}/cryptocase/kernel.log")[(build, row)]
        ours, ring = h[0] / b[0], (h[1] + h[2]) / (b[1] + b[2])
        print(f"{bench} {build:10} {row:32} pair {k}: ours {b[0]:.1f}->{h[0]:.1f} = {ours:.3f}; ring {ring:.3f}; ours/ring {ours / ring:.3f}")
