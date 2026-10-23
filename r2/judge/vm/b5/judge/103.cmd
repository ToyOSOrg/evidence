cp rw-1500.img rw-1500.u.img && bcachefs fusemount rw-1500.u.img /mnt/t && mkdir /mnt/t/upstream && seq 1 1000 > /mnt/t/upstream/seq && sync; fusermount3 -u /mnt/t
