#!/usr/bin/env python3
"""mutate.py <tree> <name> apply|revert: one negative control's mutation. Never committed."""
import sys, pathlib
tree, name, mode = sys.argv[1:]
M = {
    # The old protocol: a copy asks to be woken on its first look only, never
    # on the re-check after a wake.
    "N4-first-look-only": ("kernel/pure/pipe.rs", [
        ("    waiting: [bool; 2],\n}\n",
         "    waiting: [bool; 2],\n    asked: [bool; 2],\n}\n"),
        ("reading: None, waiting: [false; 2] }",
         "reading: None, waiting: [false; 2], asked: [false; 2] }"),
        ("        if held {\n            self.waiting[end as usize] = true;\n        }",
         "        if held && !self.asked[end as usize] {\n            self.waiting[end as usize] = true;\n            self.asked[end as usize] = true;\n        }"),
    ]),
    # An abandoned write gives its room back silently.
    "N5-abandon-silent": ("kernel/pure/pipe.rs", [
        ("        self.ended(End::Write, n > 0)", "        self.ended(End::Write, n > 0 && false)"),
    ]),
}
path, edits = M[name]
p = pathlib.Path(tree, path)
s = p.read_text()
for old, new in edits:
    a, b = (old, new) if mode == "apply" else (new, old)
    assert s.count(a) == 1, (name, mode, a)
    s = s.replace(a, b)
p.write_text(s)
