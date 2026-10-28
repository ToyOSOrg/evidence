#!/bin/bash
# probe.sh: the clean-limit probe applied, run, and reverted, in one run.
cd <home>/Dev/jan/toyos-bench-fair
M=<scratch>/agents/bench-fair/mutations
git apply --check $M/probe-clean-limit.patch && git apply $M/probe-clean-limit.patch || exit 2
cargo test -q -p fileserver --lib probe_sequential_passes_against_the_clean_limit -- --nocapture > $M/probe.log 2>&1; echo "probe EXIT=$?"
grep -E "PROBE|test result" $M/probe.log
git apply -R $M/probe-clean-limit.patch && echo "probe reverted"
