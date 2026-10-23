# Upstream's read-write mount of each regenerated tree without the FUSE
# `rm` (which leaves a clean volume holding an orphan, BB-A8-2), and the
# same steps on an upstream-formatted 8 MiB volume holding tree-8m's tree.
# A daemon still running 120 s after its unmount is stopped with TERM.
set -u
cd ~bb/b3r; R=$PWD/logs/rwhang; rm -rf "$R"; mkdir -p "$R"; . ~bb/b3r/lib.sh
exec < /dev/null
cd img
gone() { for i in $(seq 1 120); do pgrep -x bcachefs > /dev/null || { echo daemon-exited-after-${i}s; return 0; }; sleep 1; done; echo daemon-still-running; pkill -TERM -x bcachefs; sleep 3; }
step() {
  r "bcachefs fusemount $1 /mnt/t && mkdir /mnt/t/new && seq 1 40000 > /mnt/t/new/seq.txt; ln /mnt/t/new/seq.txt /mnt/t/seq-link; sync; fusermount3 -u /mnt/t"
  r "$(declare -f gone); gone"
  judge $1
}
for img in tree-8m tree-32m tree-1g; do
  r "cp $img.img $img.w.img"
  step $img.w.img
done
r "rm -rf /tmp/src; mkdir /tmp/src; cp tree-8m.img x.img && bcachefs fusemount x.img /mnt/t && cp -a /mnt/t/. /tmp/src/ && fusermount3 -u /mnt/t"
r "$(declare -f gone); gone"
r "rm -f up8.img; truncate -s 8M up8.img && bcachefs format --block_size=4096 --btree_node_size=16k --fs_label=up up8.img && bcachefs fusemount up8.img /mnt/t && cp -a /tmp/src/. /mnt/t/ && sync; fusermount3 -u /mnt/t"
r "$(declare -f gone); gone"
judge up8.img
r "cp up8.img up8.w.img"
step up8.w.img
