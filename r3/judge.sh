#!/bin/bash
# Judges every A/B readback offline with the row judges at the P arm's commit (d1ea387ef; its harness is
# M's too: the two differ in no file under tests/ or build/), each run against a fresh copy of the records.
J=<scratch>/judge
cd <scratch>/wt || exit 9
echo "rev $(git rev-parse HEAD), local patch:" > $J/logs/run.log
git diff --stat >> $J/logs/run.log
judge() { # judge <bench> <boot> <row>
  local rec=$J/records/$1-$2
  rm -rf "$rec"; mkdir -p "$rec"; cp -p $J/records-base/*.toml "$rec"/
  JUDGE_RECORDS="$rec" cargo test --test toyos-build -- --metal --metal-readback "$J/$1/$2" "$3" > "$J/logs/$1-$2.log" 2>&1
  local rc=$?
  echo "$(date -u +%FT%TZ) $1 $2 $3 exit=$rc" | tee -a $J/logs/run.log
}
judge t14 R2 bench_data_survives_reboot
for b in t14 amd; do
  for n in r1-M r1-P r2-M r2-P r3-M r3-P r4-M r4-P C2; do judge $b $n osbench_disk; done
done
echo done >> $J/logs/run.log
