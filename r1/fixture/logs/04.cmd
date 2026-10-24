kill -STOP $(cat fuse.pid); grep State /proc/$(cat fuse.pid)/status; cp --sparse=always dirty.img dirty-crash.img; sha256sum dirty-crash.img; kill -CONT $(cat fuse.pid)
