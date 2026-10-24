# B6's volumes under upstream's judge (bcachefs-tools v1.39.4, fsck -n -K,
# stdin closed). Raw crash states of renames reusing buckets, unencrypted on
# a nearly full volume and encrypted, each by judge_torn, and each after
# ToyOS's replay and clean unmount; a volume that reused its buckets twice
# over; a full volume, unclean and unmounted; 2 MiB buckets of eight nodes;
# a bucket emptied by an unwritten entry, raw and replayed. The negative
# control, the same medium with the emptied bucket's node written over as
# an early reuse leaves it, must FAIL. Then upstream FUSE's read-write mount
# of two, and the judge again. Encrypted volumes are unlocked from the hex
# secret in this session keyring.
set -u
cd ~bb/b6; R=$PWD/logs/judge; rm -rf "$R"; mkdir -p "$R"; . ~bb/b6/lib.sh
exec < /dev/null
cd img
r "bcachefs version; uname -r; sha256sum *.img"
for img in $(ls *.img); do
  enc=no; case $img in *enc*) enc=yes ;; esac
  [ $enc = yes ] && r "bcachefs unlock -k session -f pass $img; echo exit \$?"
  if [ -f "${img%.img}.torn" ]; then judge_torn $img; else judge $img; fi
  [ $enc = yes ] && r "keyctl clear @s"
done
gone() { while pgrep -x bcachefs > /dev/null; do sleep 1; done; }
for img in full-unmounted renames-past-buckets; do
  r "cp $img.img $img.u.img && bcachefs fusemount $img.u.img /mnt/t && mkdir /mnt/t/upstream && seq 1 1000 > /mnt/t/upstream/seq && sync; fusermount3 -u /mnt/t"
  gone
  judge $img.u.img
done
r "sha256sum *.img"
# Held for the analyst question: round 0's raw state whose newest journal
# entry is torn, which upstream could not recover from, bounded at 15 min.
r "timeout 900 bcachefs fsck -n -K ../held/r0-pressure-05.img < /dev/null; echo status \$?"
