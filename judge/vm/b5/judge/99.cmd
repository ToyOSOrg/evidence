cp early-pin-replayed.img early-pin-replayed.u.img && bcachefs fusemount early-pin-replayed.u.img /mnt/t && mkdir /mnt/t/upstream && seq 1 1000 > /mnt/t/upstream/seq && sync; fusermount3 -u /mnt/t
