import re,sys,pathlib
root=pathlib.Path(sys.argv[1]); rows=sys.argv[2:]
sets=[("ab","base","main"),("ab","head","7b"),("ab3a","base","7b"),("ab3a","head","3a")]
for r in rows:
    print("##",r)
    for bench in ("amd","t14"):
        out=[bench]
        for ab,kind,img in sets:
            vals=[]
            for d in sorted((root/ab/"runs"/bench).glob(f"*-{kind}")):
                m=re.search(rf"bench={re.escape(r)} unit=\S+ .*?p50=([0-9.]+)",(d/"kernel.log").read_text(errors="replace"))
                vals.append(m.group(1) if m else "?")
            out.append(f"{ab}/{kind}[{img}] {' '.join(vals)}")
        print("  "+" | ".join(out))
