#!/bin/bash
S=$SCRATCH/s0a2
R=$HOME/.claude/jobs/2280e09e/tmp/scratchpad/orch/qemu-remote.sh
echo "== machine tests 4856a502c"
QEMU_REMOTE_LOGS=$S/remote-logs $R 4856a502c --test toyos-build -- a_user_copy_faults_in_mid_copy_or_ends_as_bad_address the_uart_carries_the_log_again_once_the_console_carrier_goes a_spawn_from_an_image_frees_it_when_the_child_ends stream_holders a_link_ends_under_a_held_stream_and_comes_back a_client_killed_mid_connect_gives_its_place_back session_lifecycle a_launch_gives_each_unsent_stdio_slot_a_null std_threads_count_the_cpus_and_give_back_ended_threads > $S/remote-6.log 2>&1
echo "rc=$?"
for i in 1 2; do
  for br in s0a-probe-base-kvm s0a-probe4-kvm; do
    echo "== $i $br"
    QEMU_REMOTE_LOGS=$S/remote-logs $R $br --test toyos-build -- osbench_capability_groups_exit_0 --nocapture > $S/kvm10-$i-$br.log 2>&1
    echo "rc=$?"
  done
done
echo done
