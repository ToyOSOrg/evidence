bcachefs fusemount t1g.r.img /mnt/t && cmp <(seq 1 40000) /mnt/t/seq-link && stat -c %h /mnt/t/new/seq.txt && echo contents-ok; fusermount3 -u /mnt/t
