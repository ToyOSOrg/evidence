#!/bin/zsh
cd ~/Dev/<user>/toyos-fd
S=~/.claude/jobs/2280e09e/tmp/scratchpad/agents/pkg/fd1r2
echo "head $(git rev-parse HEAD) status '$(git status --porcelain --ignore-submodules=none)'"
cargo test -p fileserver --lib > $S/mutations/base.log 2>&1; echo "host base exit $?"
for n in dup-opens-a-new-description export-count-unbounded export-never-refused exported-hello-counted-again; do
  p=$S/mutations/$n.patch; git apply $p || { echo "$n no apply"; continue; }
  cargo test -p fileserver --lib > $S/mutations/$n.log 2>&1; echo "$n exit $?"
  git apply -R $p; echo "$n restored $?"
done
cargo run -- --ci host > $S/ci-host.log 2>&1; echo "ci host exit $?"
cargo run -- --build-only > $S/build-x86.log 2>&1; echo "x86 build exit $?"
cargo run -- --build-only --arch aarch64 > $S/build-aarch64.log 2>&1; echo "aarch64 build exit $?"
cargo test --test toyos-build -- console_image_boots nvme_disk_boots desktop_without_x2apic libc_children a_launch_gives_each_unsent_stdio_slot_a_null machine_shutdown_wire_held a_drives_row_holds_one_process_per_function > $S/guest.log 2>&1; echo "guest exit $?"
rm -rf $S/readback; mkdir -p $S/readback
cargo test --test toyos-build -- --metal --metal-readback $S/readback an_export_shares_its_descriptions file_mtime app_view std_fs std_fs_write fs_truncate_persist > $S/stage.log 2>&1; echo "fix stage exit $?"
p=$S/mutations/settled-drains-nothing.patch; git apply $p && {
  rm -rf $S/control-readback; mkdir -p $S/control-readback
  cargo test --test toyos-build -- --metal --metal-readback $S/control-readback an_export_shares_its_descriptions > $S/control-stage.log 2>&1; echo "control stage exit $?"
  git apply -R $p; echo "control restored $?"; }
echo "final status '$(git status --porcelain --ignore-submodules=none)'"
