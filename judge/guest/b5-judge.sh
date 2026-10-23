# B5's volumes under upstream's judge (bcachefs-tools v1.39.4, fsck -n -K,
# stdin closed): mkfs with its clean entry; volumes written read-write and
# unmounted clean; seeded raw crash states, which fsck replays in memory,
# and each after ToyOS's replay and clean unmount; the constructed
# interleavings; the upstream unclean fixture after ToyOS's read-write
# mount. Encrypted volumes are unlocked from the hex secret in this session
# keyring. Then upstream's own read-write mount of a few, and the judge
# again; and upstream FUSE's listing of the 1500-name volume.
set -u
cd ~bb/b5; R=$PWD/logs/judge; rm -rf "$R"; mkdir -p "$R"; . ~bb/b5/lib.sh
exec < /dev/null
cd img
r "bcachefs version; uname -r; sha256sum *.img"
for img in $(ls *.img); do
  case $img in
    *enc*) r "bcachefs unlock -k session -f pass $img; echo exit \$?"; judge $img; r "keyctl clear @s" ;;
    *) judge $img ;;
  esac
done
gone() { while pgrep -x bcachefs > /dev/null; do sleep 1; done; }
r "cp rw-1500.img rw-1500.list.img && bcachefs fusemount rw-1500.list.img /mnt/t && find /mnt/t -mindepth 1 | wc -l; fusermount3 -u /mnt/t"
gone
for img in rw-1500 skip-blacklisted-clean early-pin-replayed fixture-rw; do
  r "cp $img.img $img.u.img && bcachefs fusemount $img.u.img /mnt/t && mkdir /mnt/t/upstream && seq 1 1000 > /mnt/t/upstream/seq && sync; fusermount3 -u /mnt/t"
  gone
  judge $img.u.img
done
r "sha256sum *.img"
