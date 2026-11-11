#!/bin/bash
# Judge #1241's T14 readbacks at 552415919 from a clean detached checkout.
S=<path>
cd $S/wt-judge || exit 1
L=$S/logs/r6; mkdir -p "$L"
rev=$(git rev-parse HEAD)
dirty=$(git status --porcelain --ignore-submodules=none | wc -l | tr -d ' ')
{ echo "rev $rev (dirty files before: $dirty)"; echo "cmd: cargo test --test toyos-build -- --metal --metal-readback $S/metal machine_reboot boot:benchcase"; date; } > "$L/judge.log"
cargo test --test toyos-build -- --metal --metal-readback "$S/metal" machine_reboot boot:benchcase < /dev/null >> "$L/judge.log" 2>&1
echo "exit=$?" >> "$L/judge.log"
git diff -- tests/metal > "$L/judge.record-rows.patch"
git status --porcelain --ignore-submodules=none > "$L/status-after.txt"
git checkout -q -- tests/metal
echo done > "$L/done"
