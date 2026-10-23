for b in alloc freespace need_discard bucket_gens lru backpointers accounting inodes dirents extents logged_ops; do echo "== $b"; bcachefs list -b $b links.img | wc -l; done
