#!/bin/bash
# Stage metal images (touches no machine): head's whole testcases, shared-debug and benchcase boots;
# the FPU mutant's vector_state; base b56693152's benchcase. Exit codes and logs per step.
SW=<path>
WT=$SW/wt; S=$SW/stage; L=$SW/logs/stage
BASE=b56693152
mkdir -p "$S" "$L"
cd "$WT" || exit 9
HEAD_REV=$(git rev-parse HEAD)
: > "$L/summary.txt"
note() { echo "$*" | tee -a "$L/summary.txt"; }
[ -z "$(git status --porcelain --ignore-submodules=none)" ] || { note "dirty tree at start"; exit 8; }
note "head=$HEAD_REV"
cargo test --test toyos-build -- --metal --metal-readback "$S/head" boot:testcases boot:shared-debug boot:benchcase > "$L/head.log" 2>&1
note "head rc=$?"
git apply ../patches/fpu-skip-ignores-left.patch || { note "mutant patch failed"; exit 7; }
note "mutant applied: $(git diff --stat | tail -1)"
cargo test --test toyos-build -- --metal --metal-readback "$S/mutant" vector_state > "$L/mutant.log" 2>&1
note "mutant rc=$?"
git apply -R ../patches/fpu-skip-ignores-left.patch || { note "mutant revert failed"; exit 6; }
[ -z "$(git status --porcelain --ignore-submodules=none)" ] || { note "dirty after mutant revert"; exit 5; }
note "mutant reverted, tree clean"
git checkout -q --detach "$BASE" || { note "checkout base failed"; exit 4; }
note "base=$(git rev-parse HEAD)"
cargo test --test toyos-build -- --metal --metal-readback "$S/base" boot:benchcase > "$L/base.log" 2>&1
note "base rc=$?"
git checkout -q switch-drops-unneeded-work || { note "return to branch failed"; exit 3; }
note "back at $(git rev-parse HEAD) clean=$([ -z "$(git status --porcelain --ignore-submodules=none)" ] && echo yes || echo no)"
(cd "$S" && find . -name image.img -exec shasum -a 256 {} \;) > "$L/sha256.txt"
note done
