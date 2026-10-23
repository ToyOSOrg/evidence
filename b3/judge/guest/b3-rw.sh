# tree-1g after upstream's read-write mount, without the FUSE `rm` that
# leaves an orphan in a clean volume (BB-A8-2).
set -u
cd ~bb/b3; R=$PWD/logs/rw; rm -rf "$R"; mkdir -p "$R"; . ~bb/b3/lib.sh
exec < /dev/null
cd img
gone() { for i in $(seq 1 120); do pgrep -x bcachefs > /dev/null || { echo daemon-exited-after-${i}s; return 0; }; sleep 1; done; echo daemon-still-running; pkill -TERM -x bcachefs; sleep 3; }
r "cp tree-1g.img t1g.r.img && bcachefs fusemount t1g.r.img /mnt/t && mkdir /mnt/t/new && seq 1 40000 > /mnt/t/new/seq.txt && ln /mnt/t/new/seq.txt /mnt/t/seq-link && sync; fusermount3 -u /mnt/t"
r "$(declare -f gone); gone"
r "bcachefs show-super t1g.r.img | grep -E 'Clean'"
judge t1g.r.img
r "bcachefs fusemount t1g.r.img /mnt/t && cmp <(seq 1 40000) /mnt/t/seq-link && stat -c %h /mnt/t/new/seq.txt && echo contents-ok; fusermount3 -u /mnt/t"
r "$(declare -f gone); gone"
judge t1g.r.img
