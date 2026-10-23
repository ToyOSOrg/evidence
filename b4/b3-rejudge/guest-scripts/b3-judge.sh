# B3's generated trees under upstream's judge, upstream's own reading of
# them against the generator's manifest, BB-A9-2, and the control: the same
# kinds of damage to a populated volume must fail.
set -u
cd ~bb/b3r; R=$PWD/logs/judge; rm -rf "$R"; mkdir -p "$R"; . ~bb/b3r/lib.sh
exec < /dev/null
cd img
r "bcachefs version; uname -r; sha256sum *.img"
gone() { for i in $(seq 1 120); do pgrep -x bcachefs > /dev/null || { echo daemon-exited-after-${i}s; return 0; }; sleep 1; done; echo daemon-still-running; pkill -TERM -x bcachefs; sleep 3; }
for img in tree-8m tree-32m tree-1g; do
  r "bcachefs show-super -f all $img.img"
  judge $img.img
  r "cp $img.img $img.r.img && bcachefs fusemount $img.r.img /mnt/t && cd /mnt/t && find . -mindepth 1 | sort | while IFS= read -r p; do if [ -L \"\$p\" ]; then echo \"l \$(readlink \"\$p\" | tr -d '\\n' | sha256sum | cut -d' ' -f1) \$p\"; elif [ -d \"\$p\" ]; then echo \"d \$p\"; else echo \"f \$(sha256sum < \"\$p\" | cut -d' ' -f1) \$(stat -c %h \"\$p\") \$p\"; fi; done > /tmp/$img.seen; cd /; fusermount3 -u /mnt/t"
  gone
  r "diff <(sort $img.manifest) <(sort /tmp/$img.seen) && wc -l < $img.manifest && echo manifest-ok"
  r "bcachefs fusemount $img.r.img /mnt/t && mkdir /mnt/t/new && seq 1 40000 > /mnt/t/new/seq.txt && ln /mnt/t/new/seq.txt /mnt/t/seq-link && rm /mnt/t/wide/f00000 && sync; fusermount3 -u /mnt/t"
  gone
  judge $img.r.img
done
# BB-A9-2: the host test's small volume as written (type 5), and its extents
# rewritten with the metadata type 1 and with no checksum entry.
for img in a9-2-type5 a9-2-type1 a9-2-nocrc; do
  judge $img.img
done
# Control: a populated volume damaged the ways upstream's tools can.
r "bcachefs list -b alloc tree-8m.img | grep -B1 'data_type user' | head -1"
ab=$(awk '{print $5}' "$f.out")
r "cp tree-8m.img c-alloc.img; bcachefs kvdb --rw -c 'update alloc $ab dirty_sectors=8' c-alloc.img"
judge c-alloc.img
r "bcachefs list -b dirents tree-8m.img | grep -B1 'link-0-0' | head -1"
dp=$(awk '{print $5}' "$f.out")
r "cp tree-8m.img c-dirent.img; bcachefs kvdb --rw -c 'set dirents $dp deleted' c-dirent.img"
judge c-dirent.img
r "sha256sum *.img"
