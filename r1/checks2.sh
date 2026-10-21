#!/bin/zsh
cd ~/Dev/<user>/toyos-fd
S=~/.claude/jobs/2280e09e/tmp/scratchpad/agents/pkg/fd2
echo "head $(git rev-parse HEAD) status '$(git status --porcelain --ignore-submodules=none)'"
cargo test -p toyos --lib fd:: > $S/mutations/base.log 2>&1; echo "host base exit $?"
for p in $S/mutations/*.patch; do n=${p:t:r}; git apply $p || { echo "$n no apply"; continue; }
  cargo test -p toyos --lib fd:: > $S/mutations/$n.log 2>&1; echo "$n exit $?"; git apply -R $p; echo "$n restored $?"; done
cargo run -- --ci host > $S/ci-host3.log 2>&1; echo "ci host exit $?"
cargo run -- --build-only > $S/build-x86.log 2>&1; echo "x86 build exit $?"
cargo run -- --build-only --arch aarch64 > $S/build-aarch64-2.log 2>&1; echo "aarch64 build exit $?"
cargo test --test toyos-build -- console_image_boots nvme_disk_boots desktop_without_x2apic the_compositor_drives_the_virtio_gpu libc_children a_launch_gives_each_unsent_stdio_slot_a_null bar_map_again machine_shutdown_wire_held machine_shutdown_wire_kept a_drives_row_holds_one_process_per_function hda_plays_to_the_controller_that_reaches_an_output the_opening_exchange_with_qemus_agent_completes > $S/guest3.log 2>&1; echo "guest exit $?"
rm -rf $S/readback; mkdir -p $S/readback
cargo test --test toyos-build -- --metal --metal-readback $S/readback abuse_elf_loader abuse_elf_segments abuse_handle_table abuse_page_straddle abuse_pipe_owner abuse_spawn_argv counters_read endowment_denied futex_wake_counts process_tree spawn_child_ends_first spawn_image_object spawn_lands_claimed std_fs stream_handles an_export_shares_its_descriptions > $S/stage.log 2>&1; echo "stage exit $?"
echo "final status '$(git status --porcelain --ignore-submodules=none)'"
