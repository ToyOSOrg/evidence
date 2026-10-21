#!/bin/zsh
cd ~/Dev/<user>/toyos-fd
S=~/.claude/jobs/2280e09e/tmp/scratchpad/agents/pkg/fd5
echo "head $(git rev-parse HEAD) on $(git rev-parse origin/main) status '$(git status --porcelain --ignore-submodules=none)'"
cargo run -- --ci host > $S/ci-host.log 2>&1; echo "ci host exit $?"
cargo run -- --build-only > $S/build-x86.log 2>&1; echo "x86 build exit $?"
cargo run -- --build-only --arch aarch64 > $S/build-aarch64.log 2>&1; echo "aarch64 build exit $?"
cargo test --test toyos-build -- console_image_boots nvme_disk_boots desktop_without_x2apic the_compositor_drives_the_virtio_gpu libc_children a_launch_gives_each_unsent_stdio_slot_a_null bar_map_again machine_shutdown_wire_held machine_shutdown_wire_kept a_drives_row_holds_one_process_per_function hda_plays_to_the_controller_that_reaches_an_output the_opening_exchange_with_qemus_agent_completes > $S/guest.log 2>&1; echo "guest exit $?"
echo "final status '$(git status --porcelain --ignore-submodules=none)'"
