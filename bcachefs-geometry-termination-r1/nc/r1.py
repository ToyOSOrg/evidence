#!/usr/bin/env python3
"""R1 controls: the fix reverted in derive and write_members (and, for r1a, the encoder's
empty-bset assertion too); build, run the reproduction, restore."""
import subprocess, pathlib, sys
root=pathlib.Path('$WORKTREE'); nc=pathlib.Path('$EVIDENCE/nc')
pub=root/'lib/bcachefs/src/engine/mount/publish.rs'; node=root/'lib/bcachefs/src/engine/node.rs'
P0,N0=pub.read_text(),node.read_text()
assertion='''    // The reader refuses one (`decode`).\n    assert!(!keys.is_empty(), "a later bset with no keys");\n'''
for name, drop_assert in [('r1a-unfixed-no-assert', True), ('r1b-unfixed', False)]:
    try:
        p=P0
        for part in ['derive','write']:
            old=(nc/f'r1-{part}.old').read_text(); new=(nc/f'r1-{part}.new').read_text(); assert p.count(old)==1; p=p.replace(old,new)
        pub.write_text(p)
        if drop_assert: assert N0.count(assertion)==1; node.write_text(N0.replace(assertion,''))
        (nc/f'{name}.patch').write_text(subprocess.run(['git','diff','--','lib/bcachefs/src/engine/mount/publish.rs','lib/bcachefs/src/engine/node.rs'],cwd=root,capture_output=True,text=True).stdout)
        r=subprocess.run(['cargo','test','-p','bcachefs','--lib','--','a_member_left_with_nothing'],cwd=root,capture_output=True,text=True)
        (nc/f'{name}.log').write_text(r.stdout+r.stderr); print(name,'exit',r.returncode)
    finally:
        pub.write_text(P0); node.write_text(N0)
assert pub.read_text()==P0 and node.read_text()==N0; print('restored')
