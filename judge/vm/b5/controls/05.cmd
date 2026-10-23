cp rw-1500.img c-zero-rw-1500.img; bcachefs kill_btree_node -n dirents:0:0 -e zero c-zero-rw-1500.img; echo exit $?
