cp rw-1500.img rw-1500.list.img && bcachefs fusemount rw-1500.list.img /mnt/t && find /mnt/t -mindepth 1 | wc -l; fusermount3 -u /mnt/t
