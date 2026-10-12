#!/bin/sh
# Per width of the previous storm syscall: count; mean whole-syscall cycles;
# mean passes, cycles in passes, and cycles waiting on a share lock, all on
# the waker's CPU inside the syscall.
grep -h 'storm-prev:' "$1" | sed -E 's/.*woke ([0-9]+) syscall ([0-9]+) cycles,.*passes ([0-9]+), self-kicks ([0-9]+), pass cycles ([0-9]+), share-lock wait ([0-9]+).*/\1 \2 \3 \5 \6/' |
awk '$1>0{w=$1; c[w]++; t[w]+=$2; p[w]+=$3; pc[w]+=$4; sw[w]+=$5}
END{printf "%5s %6s %10s %7s %11s %11s\n","woke","calls","mean_sys","passes","pass_cyc","share_wait";
for(w in c) printf "%5d %6d %10.0f %7.2f %11.0f %11.0f\n",w,c[w],t[w]/c[w],p[w]/c[w],pc[w]/c[w],sw[w]/c[w]}' | sort -n
