# The judge's control on B5's own volumes: nodes damaged as BB-A9-1 damaged
# upstream's (keys, checksum, zeroed), on a volume written read-write, on a
# raw crash state, and on an encrypted one, must each fail.
set -u
cd ~bb/b5; R=$PWD/logs/controls; rm -rf "$R"; mkdir -p "$R"; . ~bb/b5/lib.sh
exec < /dev/null
cd img
for img in rw-1500 crash-0028-raw; do
  for damage in keys csum zero; do
    r "cp $img.img c-$damage-$img.img; bcachefs kill_btree_node -n dirents:0:0 -e $damage c-$damage-$img.img; echo exit \$?"
    judge c-$damage-$img.img
  done
done
r "cp rw-enc-300.img c-keys-rw-enc-300.img; bcachefs unlock -k session -f pass rw-enc-300.img; bcachefs kill_btree_node -n dirents:0:0 -e keys c-keys-rw-enc-300.img; echo exit \$?"
judge c-keys-rw-enc-300.img
r "keyctl clear @s"
