# BB-A5-3 on the built ROOTs: upstream's read-write mount gives a new
# directory and file the numbers after the writer's last, as the cursor
# says; a data write on the full volume is refused; the judge passes after.
set -u
cd ~bb/b4; R=$PWD/logs/cursor; rm -rf "$R"; mkdir -p "$R"; . ~bb/b4/lib.sh
exec < /dev/null
cd img
gone() { for i in $(seq 1 120); do pgrep -x bcachefs > /dev/null || { echo daemon-exited-after-${i}s; return 0; }; sleep 1; done; echo daemon-still-running; pkill -TERM -x bcachefs; sleep 3; }
for img in root-x86_64 root-aarch64; do
  r "bcachefs list -b logged_ops $img.img 2>/dev/null"
  r "cp $img.img $img.c.img && bcachefs fusemount $img.c.img /mnt/t && mkdir /mnt/t/new; touch /mnt/t/new/f; stat -c '%i %n' /mnt/t/new /mnt/t/new/f; echo hi > /mnt/t/new/g; echo write \$?; sync; fusermount3 -u /mnt/t"
  r "$(declare -f gone); gone"
  judge $img.c.img
done
