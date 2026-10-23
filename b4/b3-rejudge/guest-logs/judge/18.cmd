bcachefs fusemount tree-1g.r.img /mnt/t && mkdir /mnt/t/new && seq 1 40000 > /mnt/t/new/seq.txt && ln /mnt/t/new/seq.txt /mnt/t/seq-link && rm /mnt/t/wide/f00000 && sync; fusermount3 -u /mnt/t
