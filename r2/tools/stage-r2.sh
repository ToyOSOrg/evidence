#!/bin/bash
# Round 2 metal staging (touches no machine), from one clean worktree:
# head: boot:testcases boot:shared-debug boot:benchcase; two FPU mutants with only vector_state; base's boot:benchcase.
SW=<path>
WT=$SW/wt; S=$SW/stage-r2; L=$SW/logs/stage-r2
BRANCH=switch-drops-unneeded-work
mkdir -p "$S" "$L"
cd "$WT" || exit 9
: > "$L/summary.txt"
note() { echo "$*" | tee -a "$L/summary.txt"; }
clean() { [ -z "$(git status --porcelain --ignore-submodules=none)" ]; }
clean || { note "dirty tree at start"; exit 8; }
BASE=$(git merge-base HEAD origin/main)
note "head=$(git rev-parse HEAD) base=$BASE"
cargo test --test toyos-build -- --metal --metal-readback "$S/head" boot:testcases boot:shared-debug boot:benchcase > "$L/head.log" 2>&1
note "head rc=$?"
for m in left holder; do
  git apply ../patches/fpu-skip-ignores-$m.patch || { note "mutant $m patch failed"; exit 7; }
  note "mutant $m applied: $(git diff --stat | tail -1)"
  cargo test --test toyos-build -- --metal --metal-readback "$S/mutant-$m" vector_state > "$L/mutant-$m.log" 2>&1
  note "mutant $m rc=$?"
  git apply -R ../patches/fpu-skip-ignores-$m.patch || { note "mutant $m revert failed"; exit 6; }
  clean || { note "dirty after mutant $m revert"; exit 5; }
  note "mutant $m reverted, tree clean"
done
git checkout -q --detach "$BASE" || { note "checkout base failed"; exit 4; }
note "base checked out $(git rev-parse HEAD)"
cargo test --test toyos-build -- --metal --metal-readback "$S/base" boot:benchcase > "$L/base.log" 2>&1
note "base rc=$?"
git checkout -q "$BRANCH" || { note "return to branch failed"; exit 3; }
note "back at $(git rev-parse HEAD) clean=$(clean && echo yes || echo no)"
(cd "$S" && find . -name image.img -exec shasum -a 256 {} \;) > "$L/sha256.txt"
python3 -I "$SW/tools/elfdiff.py" "$S"/head/testcases/image.img "$S"/mutant-left/testcases/image.img "$S"/head/testcases/image.img "$S"/mutant-holder/testcases/image.img "$S"/head/benchcase/image.img "$S"/base/benchcase/image.img > "$L/elfs.txt" 2>&1
note done
