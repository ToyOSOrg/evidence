#!/bin/sh
# usage: run.sh <name> <file> <old> <new> <test filter>; applies, builds, tests, restores.
set -u
W=<worktree>; L=<scratch>/agents/storage/b2/mutations2/$1.log
cd $W && cp "$2" "$2.orig" && python3 -c "import sys;p,o,n=sys.argv[1:4];s=open(p).read();assert s.count(o)==1,'anchor';open(p,'w').write(s.replace(o,n))" "$2" "$3" "$4" || exit 2
git diff -- "$2" > "<scratch>/agents/storage/b2/mutations2/$1.diff"
cargo test -p bcachefs --lib "$5" > "$L" 2>&1; e=$?
mv "$2.orig" "$2"; touch "$2"; git diff --quiet -- "$2" && echo "restored"
echo "$1: exit $e"; grep -E 'test result|FAILED|panicked' "$L" | head -5
