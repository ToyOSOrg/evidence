# B2's unencrypted volumes: the judge, then BB-A1-1's read-write mount.
set -u
cd ~bb/b2; R=$PWD/logs/unencrypted; rm -rf "$R"; mkdir -p "$R"; . ~bb/b2/lib.sh
exec < /dev/null
r "bcachefs version; uname -r; sha256sum *.img"
for img in root-32m root-1g; do
  r "bcachefs show-super -f all $img.img"
  judge $img.img
  r "sha256sum $img.img"
  r "cp $img.img $img.a.img && bcachefs fusemount $img.a.img /mnt/t && ls -la /mnt/t; fusermount3 -u /mnt/t"
  judge $img.a.img
  r "bcachefs show-super -f all $img.a.img"
  r "cp $img.a.img $img.b.img && bcachefs fusemount $img.b.img /mnt/t && mkdir /mnt/t/d && seq 1 40000 > /mnt/t/d/seq.txt && printf hello-toyos > /mnt/t/a.txt && sync && ls -laR /mnt/t; fusermount3 -u /mnt/t"
  judge $img.b.img
  r "bcachefs fusemount $img.b.img /mnt/t && cmp <(seq 1 40000) /mnt/t/d/seq.txt && cmp <(printf hello-toyos) /mnt/t/a.txt && echo contents-ok; fusermount3 -u /mnt/t"
  judge $img.b.img
done
