#!/bin/sh
# Measurement only: PR #863 round 7's and round 8's datagram-wait model, each case with its own exit code.
# The model's directory is masked as <dir> and the home directory as ~.
S=$1
cd "$S" || exit 1
echo "toyos-transport from ToyOSOrg/ToyOS $2, loom 0.7.2, $(rustc --version), the pending cases unbounded, the room cases at preemption bound $(sed -n "s/^const PREEMPTIONS: usize = \(.*\);/\1/p" tests/datagram_waits.rs)"
mask() { sed -e "s|$S|<dir>|g" -e "s|$HOME|~|g" "$1"; }
for t in receiver_answers_pending receiver_answers_pending_rung_whatever_the_want receiver_reads_pending_before_arm receiver_reads_pending_before_arm_rung_whatever_the_want receiver_woken_before_pending_is_stored sender_answers_pending sender_answers_pending_only_receive_want_rung sender_waits_on_its_own_bell sender_waits_on_the_connection netstack_waits_for_a_ring_after_the_leave netstack_refuses_at_the_full_queue; do
  echo "=== $t"
  CARGO_TARGET_DIR="$S/target" cargo test --offline --release --test datagram_waits -- --exact "$t" > "$S/case.out" 2>&1
  e=$?
  mask "$S/case.out"
  echo "=== $t EXIT=$e"
done
for t in receiver_answers_pending receiver_answers_pending_rung_whatever_the_want sender_answers_pending sender_waits_on_its_own_bell; do
  echo "=== want-relaxed $t"
  CARGO_TARGET_DIR="$S/target-relaxed" cargo test --offline --release --features want-relaxed --test datagram_waits -- --exact "$t" > "$S/case.out" 2>&1
  e=$?
  mask "$S/case.out"
  echo "=== want-relaxed $t EXIT=$e"
done
rm -f "$S/case.out"
