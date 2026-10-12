#!/bin/sh
# Per storm width: calls, and the mean walker IPIs, self-kicks, and machine-wide
# sleeping-edge, busy-edge and elided rings during the walk.
grep -h 'storm-diag:' "$1" | sed -E 's/.*woke ([0-9]+) in ([0-9]+) cycles; walker ipis ([0-9]+) self ([0-9]+); machine-wide sleeping-edge ([0-9]+) busy-edge ([0-9]+) elided ([0-9]+).*/\1 \2 \3 \4 \5 \6 \7/' |
awk '{n=$1; c[n]++; cy[n]+=$2; ip[n]+=$3; sf[n]+=$4; sl[n]+=$5; bu[n]+=$6; el[n]+=$7; if(!(n in mn)||$2<mn[n])mn[n]=$2}
END{printf "%5s %6s %10s %10s %8s %8s %8s %8s %8s\n","woke","calls","min_cyc","mean_cyc","ipis","self","sleepE","busyE","elided";
for(n in c) printf "%5d %6d %10d %10.0f %8.2f %8.2f %8.2f %8.2f %8.2f\n",n,c[n],mn[n],cy[n]/c[n],ip[n]/c[n],sf[n]/c[n],sl[n]/c[n],bu[n]/c[n],el[n]/c[n]}' | sort -n
