cp fixture-rw.img fixture-rw.u.img && bcachefs fusemount fixture-rw.u.img /mnt/t && mkdir /mnt/t/upstream && seq 1 1000 > /mnt/t/upstream/seq && sync; fusermount3 -u /mnt/t
