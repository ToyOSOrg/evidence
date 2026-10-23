# B3's encrypted volume of directories alone, unlocked from the hex secret
# in the same session keyring as fsck, which runs with stdin closed.
set -u
cd ~bb/b3r; R=$PWD/logs/encrypted; rm -rf "$R"; mkdir -p "$R"; . ~bb/b3r/lib.sh
exec < /dev/null
cd img
r "bcachefs unlock -k session -f pass dirs-data-64m.img; echo exit \$?"
judge dirs-data-64m.img
r "keyctl clear @s"
