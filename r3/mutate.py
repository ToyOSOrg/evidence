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
    # A put that would want frames places anyway.
    "N6-put-ignores-wants": ("kernel/pure/pipe.rs", [
        ("        if self.wants() > 0 {\n            self.writing = None;\n            return false;\n        }\n        self.place(0, n, copy);",
         "        self.place(0, n, copy);"),
    ]),
    # A refused put leaves its claim held.
    "N7-refused-put-keeps-claim": ("kernel/pure/pipe.rs", [
        ("        if self.wants() > 0 {\n            self.writing = None;\n            return false;",
         "        if self.wants() > 0 {\n            return false;"),
    ]),
    # A spinner takes the lock while it is still held.
    "N8-spin-takes-a-held-lock": ("sdk/toyos/src/sync.rs", [
        ("            0 if state.compare_exchange(0, 1, Ordering::Acquire, Ordering::Relaxed).is_ok() => return,",
         "            1 if state.compare_exchange(1, 1, Ordering::Acquire, Ordering::Relaxed).is_ok() => return,"),
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
