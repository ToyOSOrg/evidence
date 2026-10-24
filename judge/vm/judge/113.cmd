cp full-unmounted.img full-unmounted.u.img && bcachefs fusemount full-unmounted.u.img /mnt/t && mkdir /mnt/t/upstream && seq 1 1000 > /mnt/t/upstream/seq && sync; fusermount3 -u /mnt/t
