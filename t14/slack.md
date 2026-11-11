| row | ToyOS ns | Linux, default slack | ToyOS against it | Linux, slack 1 ns | ToyOS against it | p | reading |
|---|---|---|---|---|---|---|---|
| `time.sleep_late.100us` | 5,210 | 51,850 | 0.10x | 1,827 | 2.85x | 0.016 | behind |
| `time.sleep_late.10ms` | 31,318 | 218,198 | 0.14x | 163,553 | 0.19x | 0.016 | ahead |
| `time.sleep_late.10us` | 1,434 | 51,819 | 0.03x | 1,820 | 0.79x | 0.016 | ahead |
| `time.sleep_late.1ms` | 25,639 | 72,340 | 0.35x | 20,400 | 1.26x | 0.286 | unresolved |
| `time.sleep_late.1us` | 1,501 | 51,814 | 0.03x | 3,982 | 0.38x | 0.016 | ahead |
| `time.timer_1ms.late` | 14,155 | 70,302 | 0.20x | 20,087 | 0.70x | 0.190 | unresolved |
| `wake.periodic.idle` | 20,806 | 67,862 | 0.31x | 17,667 | 1.18x | 0.016 | behind |
| `wake.periodic.loaded` | 3,624 | 52,374 | 0.07x | 2,373 | 1.53x | 0.016 | behind |
