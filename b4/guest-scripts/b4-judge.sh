# B4: the built ROOTs (x86-64 and AArch64) under upstream's judge; upstream's
# FUSE reading every path back against the build's manifest; the inode
# numbers the writer chose (BB-A5-3) and the volume with no free bucket
# (BB-A6-1); then an upstream read-write mount of each, and the judge again.
set -u
cd ~bb/b4; R=$PWD/logs/judge; rm -rf "$R"; mkdir -p "$R"; . ~bb/b4/lib.sh
exec < /dev/null
cd img
gone() { for i in $(seq 1 120); do pgrep -x bcachefs > /dev/null || { echo daemon-exited-after-${i}s; return 0; }; sleep 1; done; echo daemon-still-running; pkill -TERM -x bcachefs; sleep 3; }
r "bcachefs version; uname -r; sha256sum *.img"
for img in root-x86_64 root-aarch64; do
  r "bcachefs show-super -f all $img.img"
  judge $img.img
  r "bcachefs list -b alloc $img.img | wc -l; bcachefs list -b freespace $img.img | wc -l; bcachefs list -b freespace $img.img"
  r "bcachefs list -b accounting $img.img"
  r "bcachefs list -b logged_ops $img.img"
  r "cp $img.img $img.r.img && bcachefs fusemount $img.r.img /mnt/t && cd /mnt/t && find . -mindepth 1 | LC_ALL=C sort | while IFS= read -r p; do if [ -L \"\$p\" ]; then echo \"l \$(readlink \"\$p\" | tr -d '\\n' | sha256sum | cut -d' ' -f1) \$p\"; elif [ -d \"\$p\" ]; then echo \"d \$p\"; else echo \"f \$(sha256sum < \"\$p\" | cut -d' ' -f1) \$p\"; fi; done > /tmp/$img.seen; find . -mindepth 1 -printf '%i %p\n' | LC_ALL=C sort -k2 > /tmp/$img.inos; cd /; fusermount3 -u /mnt/t"
  r "$(declare -f gone); gone"
  r "diff <(LC_ALL=C sort $img.manifest) <(LC_ALL=C sort /tmp/$img.seen) && wc -l < $img.manifest && echo manifest-ok"
  # BB-A5-3: inode numbers in sorted path order from 2^31, each one more.
  r "awk 'BEGIN{n=2147483648} { if (\$1 != n) { print \"inode \" \$1 \" at \" \$2 \", want \" n; bad=1 } n++ } END { if (!bad) print \"inodes-sorted-ok \" NR }' /tmp/$img.inos"
  # Upstream read-write: a new file takes the cursor's next number.
  r "bcachefs fusemount $img.r.img /mnt/t && mkdir /mnt/t/new && echo hi > /mnt/t/new/f && stat -c '%i %n' /mnt/t/new /mnt/t/new/f && sync; fusermount3 -u /mnt/t"
  r "$(declare -f gone); gone"
  r "bcachefs show-super $img.r.img | grep -E 'Clean'"
  judge $img.r.img
done
r "sha256sum *.img"
# Control: the AArch64 ROOT as written before each level was spread evenly,
# its last extents leaf a remainder upstream merges, stalls without a free
# bucket. The ceiling ends it.
judge root-aarch64-greedy.img
