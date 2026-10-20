#!/bin/bash
# usage: batch.sh <binary> <threads> <batches> <width> <outdir>
B=$1; t=$2; n=$3; w=$4; out=$5; mkdir -p $out; rm -f $out/*
for b in $(seq 1 $n); do
  for j in $(seq 1 $w); do ( $B --test-threads=$t > $out/$b-$j.log 2>&1; echo $? > $out/$b-$j.rc ) & done; wait
done
total=$(ls $out/*.rc | wc -l); failed=$(grep -L '^0$' $out/*.rc | wc -l)
echo "binary $B threads $t: $total runs, $failed failed"
for f in $(grep -L '^0$' $out/*.rc); do grep -h "panicked at\|never ran" ${f%.rc}.log; done | sort | uniq -c
for f in $(grep -l '^0$' $out/*.rc); do rm ${f%.rc}.log; done
