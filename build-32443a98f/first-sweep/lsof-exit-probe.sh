#!/bin/zsh
# What lsof +D's exit code says: a directory holding one file this shell has open and one it has not, then only the open one, then none open.
d=${0:A:h}/lsof-probe-dir; rm -rf $d; mkdir -p $d && cd $d || exit 2
: > open; : > closed
exec 3<open
lsof +D $d; echo "one open, one closed: lsof EXIT=$?"
rm closed
lsof +D $d; echo "the one file open: lsof EXIT=$?"
exec 3<&-
lsof +D $d; echo "none open: lsof EXIT=$?"
cd / && rm -rf $d
