cp rw-enc-300.img c-keys-rw-enc-300.img; bcachefs unlock -k session -f pass rw-enc-300.img; bcachefs kill_btree_node -n dirents:0:0 -e keys c-keys-rw-enc-300.img; echo exit $?
