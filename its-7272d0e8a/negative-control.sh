set -u
cd <worktree>
P=<scratch>/negative-control.patch
git apply --check "$P" || exit 90
git apply "$P"
trap 'git apply -R "$P"; echo "RESTORED $?"; git diff --stat -- build/arch.rs tests/toyos.rs' EXIT
echo "HEAD $(git rev-parse HEAD) (index + this patch)"; uptime
cargo test --test toyos-build -- virt_claim_lpi
echo "EXIT $?"; uptime
