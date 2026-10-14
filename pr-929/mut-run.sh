#!/bin/bash
# Each control: checked apply, build, run, revert, in one run.
set -u
WT=/Users/<user>/Dev/<user>/toyos-records
S=/Users/<user>/<jobs>/tmp/scratchpad/agents/records
cd "$WT"
echo "at $(git rev-parse HEAD), status: $(git status --porcelain | wc -l) changed"
# 1. counters judge on the recorded T14 readback, new bound: expect PASS counters.
cargo test --test toyos-build -- --metal --metal-readback "$S/rejudge" counters > "$S/ctl-counters-head.log" 2>&1
echo "counters at head: exit $?; $(grep -E '^\S+ +(PASS|FAIL) counters' "$S/ctl-counters-head.log")"
# 2. mutation: bound raised to 1.6 (3870 MHz at 2419), above the recorded 3830 MHz: expect FAIL counters.
git apply --check "$S/mut-counters.patch" && git apply "$S/mut-counters.patch" || exit 9
cargo test --test toyos-build -- --metal --metal-readback "$S/rejudge" counters > "$S/ctl-counters-mut.log" 2>&1
echo "counters mutated: exit $?; $(grep -E '(PASS|FAIL) counters' "$S/ctl-counters-mut.log")"
git apply -R "$S/mut-counters.patch" || exit 9
# 3. FACS rule probe: types 10 and 0 pass the FACS step, 1, 4 and 7 are refused.
git apply --check "$S/probe-facs.patch" && git apply "$S/probe-facs.patch" || exit 9
cargo test --test toyos-checks -- probe_facs_rule --nocapture > "$S/ctl-facs-probe.log" 2>&1
echo "facs probe: exit $?"; grep PROBE "$S/ctl-facs-probe.log"
git apply -R "$S/probe-facs.patch" || exit 9
echo "restored, status: $(git status --porcelain | wc -l) changed"
