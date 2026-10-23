# The judge's negative control: BB-A9-1's corrupted upstream images, and the
# same kinds of damage done to B2's own volumes. Each must FAIL; the clean
# ones must PASS.
set -u
cd ~bb/b2; R=$PWD/logs/controls; rm -rf "$R"; mkdir -p "$R"; . ~bb/b2/lib.sh
exec < /dev/null
mkdir -p c && cd c
# BB-A9-1's set on a fresh upstream format.
r "truncate -s 64M clean.img && bcachefs format --block_size=4096 clean.img"
judge clean.img
r "bcachefs list -b dirents clean.img"
lf=$(awk '/lost\+found/ {print $5}' "$f.out")
r "cp clean.img bad1k.img; bcachefs kill_btree_node -n dirents:0:0 -e keys bad1k.img"
judge bad1k.img
r "cp clean.img bad1c.img; bcachefs kill_btree_node -n dirents:0:0 -e csum bad1c.img"
judge bad1c.img
r "cp clean.img bad2.img; bcachefs kvdb --rw -c 'set dirents $lf deleted' bad2.img"
judge bad2.img
r "bcachefs list -b alloc clean.img | grep -B1 'data_type btree' | head -1"
ab=$(awk '{print $5}' "$f.out")
r "cp clean.img bad5.img; bcachefs kvdb --rw -c 'update alloc $ab dirty_sectors=16' bad5.img"
judge bad5.img
r "cp clean.img bad6.img; bcachefs kvdb --rw -c 'set accounting POS_MIN deleted' bad6.img"
judge bad6.img
r "cp clean.img bad7.img; bcachefs kill_btree_node -n dirents:0:0 -e zero bad7.img"
judge bad7.img
r "truncate -s 64M zero.img"
judge zero.img
# B2's unencrypted volume, damaged the same ways, and by one flipped key byte.
r "cp ../root-32m.img t.img"
judge t.img
r "cp t.img t-keys.img; bcachefs kill_btree_node -n inodes:0:0 -e keys t-keys.img"
judge t-keys.img
r "cp t.img t-csum.img; bcachefs kill_btree_node -n inodes:0:0 -e csum t-csum.img"
judge t-csum.img
r "cp t.img t-flip.img; printf '\\377' | dd of=t-flip.img bs=1 seek=\$((146*32*512+200)) conv=notrunc status=none; cmp -l t.img t-flip.img"
judge t-flip.img
r "cp t.img t-alloc.img; bcachefs kvdb --rw -c 'update alloc 0:146:0 dirty_sectors=16' t-alloc.img"
judge t-alloc.img
r "cp t.img t-acct.img; bcachefs kvdb --rw -c 'set accounting POS_MIN deleted' t-acct.img"
judge t-acct.img
r "sha256sum *.img"
