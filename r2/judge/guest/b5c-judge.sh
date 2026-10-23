# B5c's volumes under upstream's judge: raw crash states of mixed namespace
# operations and each replayed; a directory removed with its last name,
# raw and replayed; orphans a crash left, raw, and released by the next
# mount; ROOT's fitted shape, its journal empty. Then upstream FUSE's
# read-write mount of the released-orphan volume, and the judge again.
set -u
cd ~bb/b5c; R=$PWD/logs/judge; rm -rf "$R"; mkdir -p "$R"; . ~bb/b5c/lib.sh
exec < /dev/null
cd img
r "bcachefs version; uname -r; sha256sum *.img"
for img in $(ls *.img); do judge $img; done
gone() { while pgrep -x bcachefs > /dev/null; do sleep 1; done; }
r "cp root-fit.img root-fit.list.img && bcachefs fusemount root-fit.list.img /mnt/t && find /mnt/t -mindepth 1 | wc -l; fusermount3 -u /mnt/t"
gone
r "cp orphans-released.img orphans-released.u.img && bcachefs fusemount orphans-released.u.img /mnt/t && touch /mnt/t/upstream && sync; fusermount3 -u /mnt/t"
gone
judge orphans-released.u.img
