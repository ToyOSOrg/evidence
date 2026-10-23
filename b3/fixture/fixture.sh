# The upstream fixture with hard links and a multi-level tree: upstream's
# FUSE writes it, its own fsck judges it, and `stat` records what the
# engine's reader must find.
set -u
cd ~bb/b3; R=$PWD/logs/fixture; rm -rf "$R"; mkdir -p "$R"; . ~bb/b3/lib.sh
exec < /dev/null
r "bcachefs version; uname -r"
r "rm -f links.img; truncate -s 32M links.img && bcachefs format --block_size=4096 --fs_label=toyoslinks links.img"
r "bcachefs fusemount links.img /mnt/t"
r "cd /mnt/t && mkdir -p a/b/c/d/e empty && printf hello-toyos > a/hello.txt && ln a/hello.txt a/b/hello-link && ln a/hello.txt a/b/c/d/e/hello-deep && seq 1 40000 > a/b/seq.txt && ln a/b/seq.txt seq-again && ln -s ../hello.txt a/b/link && : > a/b/c/empty-file && mkdir many && for i in \$(seq 1 600); do echo \$i > many/f\$i; done && ln many/f1 many/f1-twin && sync"
r "cd /mnt/t && find . -printf '%i %n %s %y %p\n' | sort -k5"
r "cd /mnt/t && cmp <(seq 1 40000) a/b/seq.txt && readlink a/b/link && echo contents-ok"
r "fusermount3 -u /mnt/t; while pgrep -f \"bcachefs fusemount\" >/dev/null; do sleep 1; done; echo daemon-exited"
judge links.img
r "bcachefs show-super -f all links.img"
r "for b in alloc freespace need_discard bucket_gens lru backpointers accounting inodes dirents extents logged_ops; do echo \"== \$b\"; bcachefs list -b \$b links.img | wc -l; done"
r "bcachefs list -b accounting links.img"
r "bcachefs list -b inodes links.img | head -40; bcachefs list -b dirents links.img | head -20"
r "gzip -9n < links.img > links.img.gz && sha256sum links.img links.img.gz && ls -l links.img links.img.gz"
