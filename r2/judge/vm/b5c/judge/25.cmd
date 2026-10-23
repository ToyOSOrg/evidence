cp root-fit.img root-fit.list.img && bcachefs fusemount root-fit.list.img /mnt/t && find /mnt/t -mindepth 1 | wc -l; fusermount3 -u /mnt/t
