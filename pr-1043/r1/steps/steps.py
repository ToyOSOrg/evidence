# Exploratory: divsteps (Bernstein-Yang, delta from 1) until g = 0, on exact integers.
import random, sys
P = {
 "p256-field": 2**256 - 2**224 + 2**192 + 2**96 - 1,
 "p256-order": 0xffffffff00000000ffffffffffffffffbce6faada7179e84f3b9cac2fc632551,
 "p384-field": 2**384 - 2**128 - 2**96 + 2**32 - 1,
 "p384-order": 0xffffffffffffffffffffffffffffffffffffffffffffffffc7634d81f4372ddf581a0db248b0a77aecec196accc52973,
}
def steps(f, g):
    d, n = 1, 0
    while g:
        if d > 0 and g & 1:
            d, f, g = 1 - d, g, (g - f) >> 1
        else:
            d, g = 1 + d, (g + (g & 1) * f) >> 1
        n += 1
    return n
random.seed(int(sys.argv[1]) if len(sys.argv) > 1 else 1)
count = int(sys.argv[2]) if len(sys.argv) > 2 else 20000
for name, p in P.items():
    bits = p.bit_length()
    bound = (49 * bits + 57) // 17
    sched = -(-bound // 62) * 62
    special = [1, 2, 3, p - 1, p - 2, p >> 1, (p >> 1) + 1] + [2**k for k in range(bits)] + [2**k - 1 for k in range(1, bits)] + [p - 2**k for k in range(bits - 1)]
    worst = 0
    for x in special:
        worst = max(worst, steps(p, x % p))
    sw = worst
    rs = [steps(p, random.randrange(1, p)) for _ in range(count)]
    print(f"{name}: bits={bits} bound={bound} schedule={sched} special-max={sw} random n={count} mean={sum(rs)/len(rs):.1f} max={max(rs)}")
