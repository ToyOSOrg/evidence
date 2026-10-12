#!/bin/sh
# Per storm width: calls; min and mean in-walk cycles; mean walker IPIs,
# self-kicks, machine-wide sleeping/busy edges and elisions; mean cycles from
# the walk's end to the post's return; mean machine-wide preempting switches.
grep -h 'storm-diag:' "$1" | sed -E 's/.*woke ([0-9]+) in ([0-9]+) cycles; walker ipis ([0-9]+) self ([0-9]+); machine-wide sleeping-edge ([0-9]+) busy-edge ([0-9]+) elided ([0-9]+); after-walk ([0-9]+) cycles, preempt-switches machine-wide ([0-9]+).*/\1 \2 \3 \4 \5 \6 \7 \8 \9/' |
awk '{n=$1; c[n]++; cy[n]+=$2; ip[n]+=$3; sf[n]+=$4; sl[n]+=$5; bu[n]+=$6; el[n]+=$7; af[n]+=$8; sw[n]+=$9; if($8>mx[n])mx[n]=$8; if(!(n in mn)||$2<mn[n])mn[n]=$2}
END{printf "%5s %6s %9s %9s %6s %6s %7s %7s %7s %10s %10s %6s\n","woke","calls","min_walk","mean_walk","ipis","self","sleepE","busyE","elided","mean_after","max_after","sw";
for(n in c) printf "%5d %6d %9d %9.0f %6.2f %6.2f %7.2f %7.2f %7.2f %10.0f %10d %6.2f\n",n,c[n],mn[n],cy[n]/c[n],ip[n]/c[n],sf[n]/c[n],sl[n]/c[n],bu[n]/c[n],el[n]/c[n],af[n]/c[n],mx[n],sw[n]/c[n]}' | sort -n
