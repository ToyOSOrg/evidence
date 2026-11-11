| row | ToyOS ns | Linux, default slack | ToyOS against it | Linux, slack 1 ns | ToyOS against it | p | reading | slack-free TSC runs |
|---|---|---|---|---|---|---|---|---|
| `time.sleep_late.100us` | 5,688 | 65,595 | 0.09x | 11,189 | 0.51x | 0.016 | ahead | 10,351, 10,433 |
| `time.sleep_late.10ms` | 56,524 | 118,624 | 0.48x | 289,050 | 0.20x | 0.016 | ahead | 289,050, 297,859 |
| `time.sleep_late.10us` | 1,367 | 61,099 | 0.02x | 11,023 | 0.12x | 0.016 | ahead | 10,454, 10,478 |
| `time.sleep_late.1ms` | 6,192 | 88,402 | 0.07x | 24,312 | 0.25x | 0.016 | ahead | 11,191, 11,652 |
| `time.sleep_late.1us` | 1,400 | 61,020 | 0.02x | 13,497 | 0.10x | 0.016 | ahead | 13,497, 12,615 |
| `time.timer_1ms.late` | 49,110 | 74,260 | 0.66x | 24,250 | 2.03x | 0.016 | behind | 11,126, 11,601 |
| `wake.periodic.idle` | 20,426 | 73,658 | 0.28x | 20,134 | 1.01x | 1.000 | at parity | 10,810, 11,027 |
| `wake.periodic.loaded` | 4,403 | 59,212 | 0.07x | 9,156 | 0.48x | 0.413 | unresolved | 4,339, 4,414 |
