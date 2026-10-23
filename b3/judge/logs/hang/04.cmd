rm -f up.img; truncate -s 32M up.img && bcachefs format --block_size=4096 --fs_label=up up.img && bcachefs fusemount up.img /mnt/t && cp -a /tmp/src/. /mnt/t/ && sync; fusermount3 -u /mnt/t
