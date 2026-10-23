cp tree-1g.img t1g.r.img && bcachefs fusemount t1g.r.img /mnt/t && mkdir /mnt/t/new && seq 1 40000 > /mnt/t/new/seq.txt && ln /mnt/t/new/seq.txt /mnt/t/seq-link && sync; fusermount3 -u /mnt/t
