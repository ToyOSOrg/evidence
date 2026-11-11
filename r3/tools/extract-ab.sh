#!/bin/bash
# extract-ab.sh <metal-dir> <out-dir> <bench>: each A/B boot's verdict and its osbench lines, one file per boot.
M=$1; E=$2; b=$3
for side in base head; do
  for d in "$M/$side/$b/benchcase"/boot-*; do
    o="$E/osbench/$side/$b"; mkdir -p "$o"
    n=$(basename "$d")
    { echo "verdict: $(head -1 "$d/verdict.txt")"; grep -E "osbench v=2 os=toyos bench=" "$d/kernel.log" | sed -E 's/^\[[^]]*\] //'; } > "$o/$n.txt"
  done
done
