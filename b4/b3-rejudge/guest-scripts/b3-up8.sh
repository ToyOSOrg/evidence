# The upstream-formatted half of b3-rw-hang.sh alone, at upstream's 8 MiB
# with 16 KiB nodes, as ToyOS's mkfs lays an 8 MiB device out.
set -u
cd ~bb/b3r; R=$PWD/logs/up8; rm -rf "$R"; mkdir -p "$R"; . ~bb/b3r/lib.sh
exec < /dev/null
cd img
gone() { for i in $(seq 1 120); do pgrep -x bcachefs > /dev/null || { echo daemon-exited-after-${i}s; return 0; }; sleep 1; done; echo daemon-still-running; pkill -TERM -x bcachefs; sleep 3; }
step() {
  r "bcachefs fusemount $1 /mnt/t && mkdir /mnt/t/new && seq 1 40000 > /mnt/t/new/seq.txt; ln /mnt/t/new/seq.txt /mnt/t/seq-link; sync; fusermount3 -u /mnt/t"
  r "$(declare -f gone); gone"
  judge $1
}
r "du -sh /tmp/src; find /tmp/src | wc -l"
r "rm -f up8.img; truncate -s 8M up8.img && bcachefs format --block_size=4096 --btree_node_size=16k --fs_label=up up8.img && bcachefs fusemount up8.img /mnt/t && cp -a /tmp/src/. /mnt/t/ && sync; fusermount3 -u /mnt/t"
r "$(declare -f gone); gone"
judge up8.img
r "cp up8.img up8.w.img"
step up8.w.img
r "cp tree-8m.img t8.w2.img"
step t8.w2.img
