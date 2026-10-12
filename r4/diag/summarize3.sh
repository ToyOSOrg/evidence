#!/bin/sh
# Pairs each storm-diag line's "previous futex_wake syscall" fields with the
# width the previous line on the same CPU woke, and prints per width the mean
# and minimum whole-syscall cycles, the mean kick IPIs that CPU received inside
# the syscall, and its mean preempting switches inside it.
grep -h 'storm-diag:' "$1" | sed -E 's/.*storm-diag: cpu([0-9]+) woke ([0-9]+) in .*previous futex_wake syscall ([0-9]+) cycles, kicks received in it ([0-9]+), preempting switches ([0-9]+).*/\1 \2 \3 \4 \5/' |
awk '{cpu=$1; if (cpu in last) {w=last[cpu]; c[w]++; t[w]+=$3; rx[w]+=$4; sw[w]+=$5; if(!(w in mn)||$3<mn[w])mn[w]=$3} last[cpu]=$2}
END{printf "%5s %6s %10s %10s %8s %8s\n","woke","pairs","min_sys","mean_sys","kick_rx","switch";
for(w in c) printf "%5d %6d %10d %10.0f %8.2f %8.2f\n",w,c[w],mn[w],t[w]/c[w],rx[w]/c[w],sw[w]/c[w]}' | sort -n
