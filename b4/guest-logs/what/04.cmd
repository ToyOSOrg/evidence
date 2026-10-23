for b in extents inodes dirents alloc lru freespace backpointers bucket_gens accounting; do bcachefs list -b $b w.img 2>/dev/null > /tmp/after.$b; echo == $b; diff /tmp/before.$b /tmp/after.$b; done
