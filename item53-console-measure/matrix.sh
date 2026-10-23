#!/bin/zsh
# Throwaway measurement driver: interleaves uart and virtio per row.
S=~/.claude/jobs/2280e09e/tmp/scratchpad/agents/console-proposal/measure
cd <checkout>/toyos-console-measure
git rev-parse HEAD > $S/runs/base.txt
run() { # row console rep
  local log=$S/runs/$1-$2-$3.log
  echo "$(date +%T) load=$(sysctl -n vm.loadavg) start $1 $2 $3" >> $S/runs/progress.txt
  MEASURE_CONSOLE=$2 cargo test --test toyos-build -- $1 > $log 2>&1
  echo "exit=$?" >> $log
  echo "$(date +%T) done $1 $2 $3 $(grep -a '^exit=' $log)" >> $S/runs/progress.txt
}
for rep in 1 2 3 4 5; do
  for row in measure_flood_q35 measure_flood_hvf measure_flood_virt_tcg measure_boot_q35 measure_boot_hvf measure_boot_virt_tcg; do
    if (( rep % 2 )); then run $row uart $rep; run $row virtio $rep; else run $row virtio $rep; run $row uart $rep; fi
  done
done
for rep in 1 2 3; do
  if (( rep % 2 )); then run crypto_instrument_prints_its_table uart $rep; run crypto_instrument_prints_its_table virtio $rep
  else run crypto_instrument_prints_its_table virtio $rep; run crypto_instrument_prints_its_table uart $rep; fi
done
echo ALLDONE >> $S/runs/progress.txt
