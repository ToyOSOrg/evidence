bcachefs fusemount dirty.img /mnt/t; mountpoint /mnt/t; pgrep -f '^bcachefs fusemount dirty.img' > fuse.pid; cat fuse.pid
