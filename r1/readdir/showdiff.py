# showdiff.py <base-elf> <head-elf> <symbol>: the differing masked lines.
import sys, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
sys.argv, args = sys.argv[:1], sys.argv[1:]
from cmpfn_lib import syms, dis
b, h, f = args
nb, _ = dis(b, *syms(b)[f]); nh, _ = dis(h, *syms(h)[f])
for i, (x, y) in enumerate(zip(nb, nh)):
    if x != y: print(f'{i:4} base: {x}\n     head: {y}')
