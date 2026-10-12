#!/bin/sh
# Per width of the previous storm syscall: count, min and mean whole-syscall
# cycles, min and mean cycles from the walk wrapper's end to the syscall's
# exit, and the mean kick IPIs received, preempting switches, passes and
# self-kicks inside it.
grep -h 'storm-prev:' "$1" | sed -E 's/.*woke ([0-9]+) syscall ([0-9]+) cycles, wrapper-to-exit ([0-9]+) cycles, kicks received ([0-9]+), preempting switches ([0-9]+), passes ([0-9]+), self-kicks ([0-9]+).*/\1 \2 \3 \4 \5 \6 \7/' |
awk '$1>0{w=$1; c[w]++; t[w]+=$2; e[w]+=$3; rx[w]+=$4; sw[w]+=$5; p[w]+=$6; k[w]+=$7; if($6>mp[w])mp[w]=$6; if(!(w in mt)||$2<mt[w])mt[w]=$2; if(!(w in me)||$3<me[w])me[w]=$3}
END{printf "%5s %6s %9s %10s %9s %10s %6s %6s %8s %8s %8s\n","woke","calls","min_sys","mean_sys","min_exit","mean_exit","rx","sw","passes","maxpass","selfk";
for(w in c) printf "%5d %6d %9d %10.0f %9d %10.0f %6.2f %6.2f %8.2f %8d %8.2f\n",w,c[w],mt[w],t[w]/c[w],me[w],e[w]/c[w],rx[w]/c[w],sw[w]/c[w],p[w]/c[w],mp[w],k[w]/c[w]}' | sort -n
