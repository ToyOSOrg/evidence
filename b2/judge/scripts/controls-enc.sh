# B2's encrypted volume, its nodes' MAC damaged; run in one session keyring.
set -u
cd ~bb/b2; R=$PWD/logs/controls-enc; rm -rf "$R"; mkdir -p "$R"; . ~bb/b2/lib.sh
exec < /dev/null
mkdir -p c && cd c
r "cp ../data-64m.img e.img && bcachefs unlock -k session -f ../pass e.img; echo exit \$?"
judge e.img
r "cp e.img e-csum.img; bcachefs kill_btree_node -n inodes:0:0 -e csum e-csum.img"
judge e-csum.img
r "cp e.img e-flip.img; printf '\\377' | dd of=e-flip.img bs=1 seek=\$((82*64*512+200)) conv=notrunc status=none; cmp -l e.img e-flip.img"
judge e-flip.img
