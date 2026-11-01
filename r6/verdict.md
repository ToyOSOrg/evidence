# t14 (Linux persist runs: 3 of 3)

B after_idle [15.03, 18.93, 14.54] b2b [1.08, 6.75, 1.02] -> cost [13.96, 12.19, 13.52]
A after_idle [6.62, 3.01, 2.86] b2b [5.88, 1.08, 1.05] -> cost [0.74, 1.93, 1.81]
Linux after_idle [13.05, 13.04, 13.01] b2b [4.73, 5.02, 4.72] -> cost [8.32, 8.02, 8.29]
G1 cost_B 13.52 ms vs cost_L 8.29 ms: FAIL   (B-A after_idle p50: 12.02 ms)
G2 worst B 19.93 ms vs Linux worst 17.09 ms: FAIL
G3 regressions: none; resolved worse within 5%: none
VERDICT t14: FAIL

Reported: idle package p50 and excursions
  A1 idle p50 7083 excursions 9
  A2 idle p50 6737 excursions 5
  B1 idle p50 7603 excursions 22
  B2 idle p50 7355 excursions 11
  Linux1 idle p50 1709 excursions 2
  Linux2 idle p50 1520 excursions 2
# amd (Linux persist runs: 3 of 3)

B after_idle [10.35, 10.36, 10.34] b2b [2.54, 2.65, 2.58] -> cost [7.81, 7.72, 7.76]
A after_idle [3.33, 3.28, 3.29] b2b [2.67, 2.55, 2.58] -> cost [0.66, 0.73, 0.71]
Linux after_idle [11.34, 10.68, 10.59] b2b [3.5, 3.01, 3.54] -> cost [7.84, 7.67, 7.05]
G1 cost_B 7.76 ms vs cost_L 7.67 ms: FAIL   (B-A after_idle p50: 7.06 ms)
G2 worst B 19.34 ms vs Linux worst 11.74 ms: FAIL
G3 regressions: none; resolved worse within 5%: ['fs.disk.direct.stat +0.7%', 'fs.disk.mkdir_rmdir +1.0%']
VERDICT amd: FAIL

Reported: idle package p50 and excursions
  A1 idle p50 1719 excursions 0
  A2 idle p50 1710 excursions 0
  B1 idle p50 1732 excursions 0
  B2 idle p50 1702 excursions 0
  Linux1 idle p50 1375 excursions 1
  Linux2 idle p50 1545 excursions 1
