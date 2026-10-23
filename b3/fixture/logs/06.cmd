cd /mnt/t && cmp <(seq 1 40000) a/b/seq.txt && readlink a/b/link && echo contents-ok
