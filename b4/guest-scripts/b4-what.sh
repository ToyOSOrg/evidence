# The AArch64 tree laid out greedily (each level filled to two thirds, the
# remainder in the last node): with no free bucket fsck -n stalls; with 32
# free it finishes, and a writing fsck of a copy shows what it committed.
set -u
cd ~bb/b4; R=$PWD/logs/what; rm -rf "$R"; mkdir -p "$R"; . ~bb/b4/lib.sh
exec < /dev/null
cd img/greedy-var
r "timeout 120 bcachefs fsck -n -K v0.img < /dev/null; echo status \$?"
r "timeout 120 bcachefs fsck -n -K v32.img < /dev/null; echo status \$?"
cp v32.img w.img
B="extents inodes dirents alloc lru freespace backpointers bucket_gens accounting"
for b in $B; do bcachefs list -b $b w.img 2>/dev/null > /tmp/before.$b; done
r "timeout 120 bcachefs fsck -y -K w.img < /dev/null; echo status \$?"
r "for b in $B; do bcachefs list -b \$b w.img 2>/dev/null > /tmp/after.\$b; echo == \$b; diff /tmp/before.\$b /tmp/after.\$b; done"
