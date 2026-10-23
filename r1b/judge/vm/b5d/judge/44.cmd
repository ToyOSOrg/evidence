cp zero-accounting-unmounted.img zero-accounting-unmounted.u.img && bcachefs fusemount zero-accounting-unmounted.u.img /mnt/t && touch /mnt/t/upstream && sync; fusermount3 -u /mnt/t
