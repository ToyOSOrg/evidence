# B2's empty volumes as mkfs writes them at B4's head.
set -u
cd ~bb/b3r; R=$PWD/logs/b2; rm -rf "$R"; mkdir -p "$R"; . ~bb/b3r/lib.sh
exec < /dev/null
cd img
for img in root-32m root-1g data-64m data-1g; do
  case $img in data-*) r "bcachefs unlock -k session -f pass $img.img; echo exit \$?";; esac
  judge $img.img
done
r "keyctl clear @s"
