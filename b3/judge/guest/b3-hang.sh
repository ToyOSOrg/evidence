# Does upstream's FUSE hang at unmount after the same read-write steps on an
# upstream-formatted volume holding the same tree? And again on ToyOS's?
set -u
cd ~bb/b3; R=$PWD/logs/hang; rm -rf "$R"; mkdir -p "$R"; . ~bb/b3/lib.sh
exec < /dev/null
cd img
gone() { for i in $(seq 1 120); do pgrep -x bcachefs > /dev/null || { echo daemon-exited-after-${i}s; return 0; }; sleep 1; done; echo daemon-still-running; pkill -TERM -x bcachefs; sleep 3; }
step() {
  r "bcachefs fusemount $1 /mnt/t && mkdir /mnt/t/new && seq 1 40000 > /mnt/t/new/seq.txt && ln /mnt/t/new/seq.txt /mnt/t/seq-link && sync; fusermount3 -u /mnt/t"
  r "$(declare -f gone); gone"
  r "bcachefs show-super $1 | grep -E 'Clean'"
  judge $1
}
# The tree, copied out of ToyOS's volume through upstream's FUSE.
r "rm -rf /tmp/src; mkdir /tmp/src; cp tree-32m.img x.img && bcachefs fusemount x.img /mnt/t && cp -a /mnt/t/. /tmp/src/ && fusermount3 -u /mnt/t"
r "$(declare -f gone); gone"
r "du -sh /tmp/src; find /tmp/src | wc -l"
r "rm -f up.img; truncate -s 32M up.img && bcachefs format --block_size=4096 --fs_label=up up.img && bcachefs fusemount up.img /mnt/t && cp -a /tmp/src/. /mnt/t/ && sync; fusermount3 -u /mnt/t"
r "$(declare -f gone); gone"
judge up.img
r "cp up.img up.r.img"
step up.r.img
r "cp tree-32m.img t.r.img"
step t.r.img
r "cp tree-32m.img t2.r.img"
step t2.r.img
