set -u
D=A2-1-64; rm -rf ~bb/b6/$D; mkdir -p ~bb/b6/$D; cd ~bb/b6/$D; R=$PWD; . ~bb/b6/lib.sh
exec < /dev/null
r "truncate -s 64M dirty.img && bcachefs format --block_size=4096 dirty.img"
r "bcachefs fusemount dirty.img /mnt/t; mountpoint /mnt/t; pgrep -f '^bcachefs fusemount dirty.img' > fuse.pid; cat fuse.pid"
r "for i in \$(seq 1 200); do echo \$i > /mnt/t/f\$i; done; sync; ls /mnt/t | wc -l"
# freeze the FUSE daemon so the copy is atomic with respect to the writer
r "kill -STOP \$(cat fuse.pid); grep State /proc/\$(cat fuse.pid)/status; cp --sparse=always dirty.img dirty-crash.img; sha256sum dirty-crash.img; kill -CONT \$(cat fuse.pid)"
r "fusermount3 -u /mnt/t"
r "bcachefs show-super -f all dirty-crash.img"
r "bcachefs list_journal -a -B dirty-crash.img"
r "bcachefs list_journal -a -B -H dirty-crash.img"
r "bcachefs fsck -n -K dirty-crash.img"
r "sha256sum dirty-crash.img"
r "cp dirty-crash.img fix.img; bcachefs fsck -y -K fix.img; bcachefs fsck -n -K fix.img"
r "bcachefs show-super -f all fix.img"
r "gzip -9n < dirty-crash.img > dirty-crash.img.gz; ls -l dirty-crash.img.gz; sha256sum dirty-crash.img.gz"
