#!/bin/zsh
cd ~/Dev/<user>/toyos-handle-wake
S=~/.claude/jobs/2280e09e/tmp/scratchpad/agents/pkg
M=$S/r2-mutations
echo "rev $(git rev-parse HEAD) status '$(git status --porcelain --ignore-submodules=none)'"
cargo test -p kernel --lib --features sched-check message:: > $M/base.log 2>&1; echo "host base exit $?"
for n in window-ignores-pins admit-takes-handles-without-bytes; do
  p=$M/$n.patch; git apply --check $p && git apply $p || { echo "$n does not apply"; continue; }
  cargo build -p kernel --lib --tests --features sched-check > $M/$n.build.log 2>&1; echo "$n build exit $?"
  cargo test -p kernel --lib --features sched-check message:: > $M/$n.log 2>&1; echo "$n test exit $?"
  git apply -R $p; echo "$n restored exit $?"
done
cargo test --test toyos-build -- console_image_boots nvme_disk_boots desktop_without_x2apic the_compositor_drives_the_virtio_gpu a_window_is_drawn_at_the_scale_and_relaid_at_the_next hda_plays_to_the_controller_that_reaches_an_output libc_children a_launch_gives_each_unsent_stdio_slot_a_null machine_shutdown_wire_held machine_shutdown_wire_kept a_drives_row_holds_one_process_per_function the_opening_exchange_with_qemus_agent_completes > $S/r2-guest.log 2>&1; echo "guest exit $?"
rm -rf $S/r2-readback; mkdir -p $S/r2-readback
cargo test --test toyos-build -- --metal --metal-readback $S/r2-readback message_carries_its_handles ends_sent_over_each_other_both_end process_tree spawn_lands_claimed cpal_drop_unreleased abuse_shared_grant mutual_kill shm_release_reclaims pipe_other_end_gone stream_handles netstack_gone_mid_bind > $S/r2-readback.log 2>&1; echo "fix stage exit $?"
p=$M/read-ignores-pins.patch; git apply --check $p && git apply $p || { echo "kernel control does not apply"; exit 1; }
rm -rf $M/read-ignores-pins-readback; mkdir -p $M/read-ignores-pins-readback
cargo test --test toyos-build -- --metal --metal-readback $M/read-ignores-pins-readback message_carries_its_handles ends_sent_over_each_other_both_end > $M/read-ignores-pins.log 2>&1; echo "kernel control stage exit $?"
git apply -R $p; echo "kernel control restored exit $?"
echo "final status '$(git status --porcelain --ignore-submodules=none)'"
