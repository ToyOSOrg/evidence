cp orphans-released.img orphans-released.u.img && bcachefs fusemount orphans-released.u.img /mnt/t && touch /mnt/t/upstream && sync; fusermount3 -u /mnt/t
