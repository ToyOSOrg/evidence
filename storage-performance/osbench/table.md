
### T14

| row | unit | Linux | main (dc1a8642e) | #1152 (94fdd7faa) | #1152/main | #1152/Linux |
|---|---|---|---|---|---|---|
| fs.disk.create_write_unlink | ns | 11206 | 161348 | 195115 | 1.21 | 17.41 |
| fs.disk.direct.fstat | ns | - | 8450 | 11824 | 1.40 | - |
| fs.disk.direct.pread_4k | ns | - | 9430 | 10909 | 1.16 | - |
| fs.disk.direct.read_4k_at | ns | - | 17753 | 20595 | 1.16 | - |
| fs.disk.direct.seek | ns | - | 8348 | 9588 | 1.15 | - |
| fs.disk.direct.stat | ns | - | 10657 | 49134 | 4.61 | - |
| fs.disk.fstat | ns | 224 | 8719 | 12207 | 1.40 | 54.50 |
| fs.disk.mkdir_rmdir | ns | 15176 | 84955 | 116600 | 1.37 | 7.68 |
| fs.disk.open_close | ns | 1252 | 26222 | 67881 | 2.59 | 54.22 |
| fs.disk.pread_4k | ns | 590 | 9584 | 945 | 0.10 | 1.60 |
| fs.disk.pread_8 | ns | 377 | 8959 | 687 | 0.08 | 1.82 |
| fs.disk.read_4k | ns | 539 | 9576 | 951 | 0.10 | 1.76 |
| fs.disk.read_4k_at | ns | 728 | 10012 | 1245 | 0.12 | 1.71 |
| fs.disk.readdir.1000 | ns | 273843 | 908345 | 2751006 | 3.03 | 10.05 |
| fs.disk.rename | ns | 3624 | 87717 | 77669 | 0.89 | 21.43 |
| fs.disk.reopen_read_4k | ns | - | - | 68950 | - | - |
| fs.disk.seek | ns | 120 | 264 | 284 | 1.08 | 2.37 |
| fs.disk.seq_read.1048576 | MB/s | 10016 | 7016 | 6737 | 0.96 | 0.67 |
| fs.disk.seq_read.4096 | MB/s | 7784 | 427 | 3992 | 9.35 | 0.51 |
| fs.disk.seq_write.1048576 | MB/s | 346 | 349 | 43 | 0.12 | 0.12 |
| fs.disk.seq_write.4096 | MB/s | 624 | 133 | 39 | 0.29 | 0.06 |
| fs.disk.stat | ns | 584 | 11631 | 50658 | 4.36 | 86.74 |
| fs.disk.tree.100 | ns | 1350872 | 13957113 | 32735460 | 2.35 | 24.23 |
| fs.disk.write_4k_at | ns | 722 | 10195 | 18335 | 1.80 | 25.39 |

### AMD

| row | unit | Linux | main (dc1a8642e) | #1152 (94fdd7faa) | #1152/main | #1152/Linux |
|---|---|---|---|---|---|---|
| fs.disk.create_write_unlink | ns | 28270 | 115431 | 189896 | 1.65 | 6.72 |
| fs.disk.direct.fstat | ns | - | 9748 | 11532 | 1.18 | - |
| fs.disk.direct.pread_4k | ns | - | 10761 | 11482 | 1.07 | - |
| fs.disk.direct.read_4k_at | ns | - | 20179 | 21110 | 1.05 | - |
| fs.disk.direct.seek | ns | - | 9509 | 9478 | 1.00 | - |
| fs.disk.direct.stat | ns | - | 11542 | 37681 | 3.26 | - |
| fs.disk.fstat | ns | 1188 | 9919 | 11882 | 1.20 | 10.00 |
| fs.disk.mkdir_rmdir | ns | 37904 | 80384 | 111409 | 1.39 | 2.94 |
| fs.disk.open_close | ns | 3728 | 21672 | 53841 | 2.48 | 14.44 |
| fs.disk.pread_4k | ns | 1803 | 11191 | 1413 | 0.13 | 0.78 |
| fs.disk.pread_8 | ns | 1324 | 10330 | 741 | 0.07 | 0.56 |
| fs.disk.read_4k | ns | 1813 | 11142 | 1183 | 0.11 | 0.65 |
| fs.disk.read_4k_at | ns | 1919 | 11532 | 1703 | 0.15 | 0.89 |
| fs.disk.readdir.1000 | ns | 442635 | 693862 | 1983029 | 2.86 | 4.48 |
| fs.disk.rename | ns | 10117 | 63282 | 68218 | 1.08 | 6.74 |
| fs.disk.reopen_read_4k | ns | - | - | 54973 | - | - |
| fs.disk.seek | ns | 804 | 200 | 191 | 0.95 | 0.24 |
| fs.disk.seq_read.1048576 | MB/s | 11397 | 4789 | 8927 | 1.86 | 0.78 |
| fs.disk.seq_read.4096 | MB/s | 5006 | 364 | 4892 | 13.44 | 0.98 |
| fs.disk.seq_write.1048576 | MB/s | 787 | 340 | 45 | 0.13 | 0.06 |
| fs.disk.seq_write.4096 | MB/s | 742 | 211 | 28 | 0.13 | 0.04 |
| fs.disk.stat | ns | 2163 | 12544 | 39384 | 3.14 | 18.21 |
| fs.disk.tree.100 | ns | 3455124 | 12733562 | 26612873 | 2.09 | 7.70 |
| fs.disk.write_4k_at | ns | 2333 | 12183 | 23764 | 1.95 | 10.19 |
