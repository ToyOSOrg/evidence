rm -rf /tmp/src; mkdir /tmp/src; cp tree-8m.img x.img && bcachefs fusemount x.img /mnt/t && cp -a /mnt/t/. /tmp/src/ && fusermount3 -u /mnt/t
