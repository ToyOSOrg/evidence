# Review round 1's volumes under upstream's judge: a stored accounting total
# of zero, clean, unclean and unmounted; clean volumes with an empty journal
# (clean at 0 and at 7) at every request of going read-write and their
# first commit. Then upstream FUSE's read-write mount of the unmounted
# zero-key volume, and the judge again.
set -u
cd ~bb/b5d; R=$PWD/logs/judge; rm -rf "$R"; mkdir -p "$R"; . ~bb/b5d/lib.sh
exec < /dev/null
cd img
r "bcachefs version; uname -r; sha256sum *.img"
for img in $(ls *.img); do judge $img; done
gone() { while pgrep -x bcachefs > /dev/null; do sleep 1; done; }
r "cp zero-accounting-unmounted.img zero-accounting-unmounted.u.img && bcachefs fusemount zero-accounting-unmounted.u.img /mnt/t && touch /mnt/t/upstream && sync; fusermount3 -u /mnt/t"
gone
judge zero-accounting-unmounted.u.img
