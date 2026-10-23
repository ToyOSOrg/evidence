# BB-A9-1's bad5 again: the first run's position parse failed, so kvdb
# refused and the image was the clean one.
set -u
cd ~bb/b2; R=$PWD/logs/controls-bad5; rm -rf "$R"; mkdir -p "$R"; . ~bb/b2/lib.sh
exec < /dev/null
cd c
r "bcachefs list -b alloc clean.img | grep -B1 'data_type btree' | head -1"
ab=$(awk '{print $5}' "$f.out")
r "cp clean.img bad5.img; bcachefs kvdb --rw -c 'update alloc $ab dirty_sectors=16' bad5.img"
judge bad5.img
