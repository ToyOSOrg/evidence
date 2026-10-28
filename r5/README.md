# pr-1073 r5: B5 and the A* testcases control at d60d727aa

- `logs/judge-*.log`: the harness judge over the four boots. Each exits 0.
  - `osbench` passes on both benches, with every group's job at exit 0.
  - On the A\* testcases boots, `hda_tone`, `hda_tone_resampled` and `acpi_tables_loaded` pass.
- `run5-out.txt` and `readback-notes/*-B5.osbench.txt`: the B5 benchcase readings.
  - T14: deflate 54.80 ms; `cpu.clock` above 4100 at 5 of 17 group starts (sched, files, ipc, work, crunch).
  - AMD: deflate 63.70 ms; above 4100 at 17 of 17.
- `readback-notes/*.audio.txt`: soundserver's per-window `worst_irq_late_us` and `underruns`, with the deep states (r2 B2t, r4 B4) and without them (r5 A\*). Ranges by bench:

  | Bench | Deep states | A\* (all idle CPUs in C1) |
  |---|---|---|
  | T14 | 166-564 µs | 457-572 µs |
  | AMD | 0-2661 µs | 0-2661 µs (2661 and 2651) |

  No window underran in any boot.
- Group starts above 4100 MHz on the six T14 boots with the deep states: 8, 8, 8, 10, 10 and 5. Only sched, files, ipc and work reach it in all six.
- `diag/`: the follow-up diagnostics on the idle track, staged at `10fdff439`. They are not this PR's evidence.
  - D1 is the counters read around each group's clock.
  - D2 is D1 with the history switched off.
