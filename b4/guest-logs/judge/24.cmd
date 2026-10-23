bcachefs fusemount root-aarch64.r.img /mnt/t && mkdir /mnt/t/new && echo hi > /mnt/t/new/f && stat -c '%i %n' /mnt/t/new /mnt/t/new/f && sync; fusermount3 -u /mnt/t
