rm -f links.img; truncate -s 32M links.img && bcachefs format --block_size=4096 --fs_label=toyoslinks links.img
