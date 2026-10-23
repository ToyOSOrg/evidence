cp rw-1500.img c-csum-rw-1500.img; bcachefs kill_btree_node -n dirents:0:0 -e csum c-csum-rw-1500.img; echo exit $?
