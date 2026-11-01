# A server's parked wakes come from LLC 0 or 1 independently, each with probability 1/2.
# Rule: count consecutive wakes from one LLC; the wake that makes the run k, from an LLC
# other than the server's, moves the server there. Moves per wake, against 1/(2^(k+1)-2).
import random
random.seed(1)
N=2_000_000
for k in (1,2,3,4,6,8):
    home=0; llc=None; run=0; moves=0
    for _ in range(N):
        w=random.getrandbits(1)
        run = run+1 if w==llc else 1
        llc=w
        if run>=k and w!=home:
            home=w; moves+=1
    print(f"k={k} moves/wake={moves/N:.5f} 1/(2^(k+1)-2)={1/(2**(k+1)-2):.5f}")
