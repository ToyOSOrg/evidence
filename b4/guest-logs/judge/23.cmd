awk 'BEGIN{n=2147483648} { if ($1 != n) { print "inode " $1 " at " $2 ", want " n; bad=1 } n++ } END { if (!bad) print "inodes-sorted-ok " NR }' /tmp/root-aarch64.inos
