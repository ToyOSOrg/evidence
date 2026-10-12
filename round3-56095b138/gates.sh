#!/bin/sh
# PR #884 round 3, at the committed head: the new judge re-reads the AMD and
# T14 head readbacks (staging words, no machine touched), the guest test green
# and with the switch-off reverted as a checked patch restored in this script,
# the two image builds and the host suite. The tree is left as it was found.
W=<worktree>
S=<scratchpad>/amdvi-r2
L=$S/logs
P=$S/mutations/switch-off-reverted.patch
R=<scratchpad>/amdvi-build/metal
AMD='<user>@<amd-bench>'
cd "$W" || exit 99
echo "head $(git rev-parse HEAD)"
echo "status before:"; git status --porcelain --ignore-submodules=none; echo "(end)"
uptime
cargo test --test toyos-build -- --metal --metal-readback "$R/head-amd" --metal-host "$AMD" iommu_firmware_left > "$L/rejudge-head-amd.log" 2>&1
echo "re-judge head-amd EXIT=$?"
cargo test --test toyos-build -- --metal --metal-readback "$R/head-t14" iommu_firmware_left > "$L/rejudge-head-t14.log" 2>&1
echo "re-judge head-t14 EXIT=$?"
uptime
cargo test --test toyos-build -- amdvi_firmware_left > "$L/amdvi_firmware_left-green.log" 2>&1
echo "guest green EXIT=$?"
uptime
git apply --check "$P" || { echo "patch does not apply"; exit 98; }
git apply "$P"
git diff --stat
cargo test --test toyos-build -- amdvi_firmware_left > "$L/amdvi_firmware_left-switch-off-reverted.log" 2>&1
echo "guest switch-off reverted EXIT=$?"
git apply -R "$P"
echo "status after the mutation:"; git status --porcelain --ignore-submodules=none; echo "(end)"
uptime
cargo run -- --build-only --arch x86_64 > "$L/build-only-x86_64.log" 2>&1
echo "build-only x86_64 EXIT=$?"
cargo run -- --build-only --arch aarch64 > "$L/build-only-aarch64.log" 2>&1
echo "build-only aarch64 EXIT=$?"
uptime
cargo run -- --ci host > "$L/ci-host.log" 2>&1
echo "ci host EXIT=$?"
uptime; df -h "$W"
echo "status after:"; git status --porcelain --ignore-submodules=none; echo "(end)"
