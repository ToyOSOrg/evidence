#!/bin/sh
# Per width of the previous storm syscall: count, min and mean whole-syscall
# cycles, min and mean cycles from the walk wrapper's end to the syscall's
# exit, mean kick IPIs received inside it, mean preempting switches inside it.
grep -h 'storm-prev:' "$1" | sed -E 's/.*woke ([0-9]+) syscall ([0-9]+) cycles, wrapper-to-exit ([0-9]+) cycles, kicks received ([0-9]+), preempting switches ([0-9]+).*/\1 \2 \3 \4 \5/' |
awk '$1>0{w=$1; c[w]++; t[w]+=$2; e[w]+=$3; rx[w]+=$4; sw[w]+=$5; if(!(w in mt)||$2<mt[w])mt[w]=$2; if(!(w in me)||$3<me[w])me[w]=$3}
END{printf "%5s %6s %9s %10s %9s %10s %7s %7s\n","woke","calls","min_sys","mean_sys","min_exit","mean_exit","rx","sw";
for(w in c) printf "%5d %6d %9d %10.0f %9d %10.0f %7.2f %7.2f\n",w,c[w],mt[w],t[w]/c[w],me[w],e[w]/c[w],rx[w]/c[w],sw[w]/c[w]}' | sort -n
