cp root-32m.img root-32m.a.img && bcachefs fusemount root-32m.a.img /mnt/t && ls -la /mnt/t; fusermount3 -u /mnt/t
