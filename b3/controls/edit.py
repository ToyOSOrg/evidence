# usage: edit.py <file> <old> <new> [<old> <new> ...]; each anchor must occur once.
import sys
p, pairs = sys.argv[1], sys.argv[2:]
s = open(p).read()
for o, n in zip(pairs[::2], pairs[1::2]):
    assert s.count(o) == 1, f"anchor {o!r}"
    s = s.replace(o, n)
open(p, "w").write(s)
