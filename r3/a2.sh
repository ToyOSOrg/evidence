#!/bin/bash
# A2's log checks over every A/B boot: one line a boot, the count of each refusal shape the storage path prints.
R=<scratch>/metal/runs-ab
pat_fail='block service ended|the disk is gone|block request was refused|did not read whole|formatting the explicitly designated DATA|does not mount|DATA is absent|will not survive a reboot|write-back sync failed|dropping client|NOT SERVING|went unanswered|resetting the controller|handed work on disk|names no command|Lost|reissu|asked again|stopped mount|panicked|PANIC'
for b in t14 amd; do
  for d in $R/$b/*/; do
    n=$(basename $d); f=$d/kernel.log
    data_errs=$(grep 'fileserver: DATA ' $f | grep -v 'DATA mkdir: Exists' | grep -c .)
    fails=$(grep -E -c "$pat_fail" $f)
    mounts=$(grep -c 'fileserver: mounted the DATA volume' $f)
    formats=$(grep -c 'formatting the explicitly designated DATA' $f)
    exists=$(grep -c 'DATA mkdir: Exists' $f)
    ends=$(grep -c '===TEST_END' $f); bad_ends=$(grep '===TEST_END' $f | grep -vc 'exit=0===')
    echo "$b $n verdict=$(cat $d/verdict.txt) mounts=$mounts formats=$formats mkdir_exists=$exists data_errors=$data_errs refusal_lines=$fails tests_ended=$ends nonzero_exits=$bad_ends"
  done
done
