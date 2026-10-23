bcachefs fusemount data-64m.b.img /mnt/t && cmp <(seq 1 40000) /mnt/t/d/seq.txt && cmp <(printf hello-toyos) /mnt/t/a.txt && echo contents-ok; fusermount3 -u /mnt/t
