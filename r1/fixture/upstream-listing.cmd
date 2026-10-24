# The commands behind upstream-listing.log, each run from the host as
#   $B2/vm/ssh.sh '<command>' 2>&1 | tee [-a] upstream-listing.log
# into the judge guest (bcachefs-tools v1.39.4). Two earlier attempts printed
# nothing and were overwritten; the log holds the two below.

# First (tee, overwriting). Output: the fixture directory's listing; fusemount's
# two startup lines; mountpoint as the unprivileged user ("Permission denied");
# the count of f* names (140); the highest number (140); no gap line, so f1..f140
# with none missing; f140's contents, empty.
cd ~bb/b6/A2-1-64 && ls; sudo cp dirty-crash.img list.img; sudo bcachefs fusemount list.img /mnt/t; sleep 2; mountpoint /mnt/t; sudo sh -c "ls /mnt/t | grep -c ^f; ls /mnt/t | grep ^f | sed s/f// | sort -n | tail -1; ls /mnt/t | grep ^f | sed s/f// | sort -n | awk \"NR!=\\\$1{print \\\"gap at \\\" NR; exit}\"; cat /mnt/t/f140"; sudo fusermount3 -u /mnt/t

# Second (tee -a). Output: each f1..f140 whose contents differ from its number
# (only f140, empty), then "checked".
cd ~bb/b6/A2-1-64 && sudo cp dirty-crash.img list.img && sudo bcachefs fusemount list.img /mnt/t >/dev/null 2>&1; sleep 2; sudo sh -c "for i in \$(seq 1 140); do c=\$(cat /mnt/t/f\$i); [ \"\$c\" = \"\$i\" ] || echo \"f\$i=[\$c]\"; done; echo checked"; sudo fusermount3 -u /mnt/t
