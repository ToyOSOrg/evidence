
### T14

| row | unit | Linux | main (dc1a8642e) | #1152 r1 (94fdd7faa) | #1152 (a1f07627e) | /main | /Linux |
|---|---|---|---|---|---|---|---|
| fs.disk.create_write_unlink | ns | 11206 | 161348 | 195115 | 128800 | 0.80 | 11.49 |
| fs.disk.direct.fstat | ns | - | 8450 | 11824 | 10639 | 1.26 | - |
| fs.disk.direct.pread_4k | ns | - | 9430 | 10909 | 10152 | 1.08 | - |
| fs.disk.direct.read_4k_at | ns | - | 17753 | 20595 | 18712 | 1.05 | - |
| fs.disk.direct.seek | ns | - | 8348 | 9588 | 8497 | 1.02 | - |
| fs.disk.direct.stat | ns | - | 10657 | 49134 | 12493 | 1.17 | - |
| fs.disk.fstat | ns | 224 | 8719 | 12207 | 10857 | 1.25 | 48.47 |
| fs.disk.mkdir_rmdir | ns | 15176 | 84955 | 116600 | 81333 | 0.96 | 5.36 |
| fs.disk.open_close | ns | 1252 | 26222 | 67881 | 24185 | 0.92 | 19.32 |
| fs.disk.pread_4k | ns | 590 | 9584 | 945 | 964 | 0.10 | 1.63 |
| fs.disk.pread_8 | ns | 377 | 8959 | 687 | 644 | 0.07 | 1.71 |
| fs.disk.read_4k | ns | 539 | 9576 | 951 | 952 | 0.10 | 1.77 |
| fs.disk.read_4k_at | ns | 728 | 10012 | 1245 | 1211 | 0.12 | 1.66 |
| fs.disk.readdir.1000 | ns | 273843 | 908345 | 2751006 | 2863176 | 3.15 | 10.46 |
| fs.disk.rename | ns | 3624 | 87717 | 77669 | 45751 | 0.52 | 12.62 |
| fs.disk.reopen_read_4k | ns | - | - | 68950 | 24899 | - | - |
| fs.disk.seek | ns | 120 | 264 | 284 | 243 | 0.92 | 2.02 |
| fs.disk.seq_read.1048576 | MB/s | 10016 | 7016 | 6737 | 6779 | 0.97 | 0.68 |
| fs.disk.seq_read.4096 | MB/s | 7784 | 427 | 3992 | 4125 | 9.66 | 0.53 |
| fs.disk.seq_write.1048576 | MB/s | 346 | 349 | 43 | 452 | 1.30 | 1.31 |
| fs.disk.seq_write.4096 | MB/s | 624 | 133 | 39 | 162 | 1.22 | 0.26 |
| fs.disk.stat | ns | 584 | 11631 | 50658 | 13581 | 1.17 | 23.26 |
| fs.disk.tree.100 | ns | 1350872 | 13957113 | 32735460 | 21385348 | 1.53 | 15.83 |
| fs.disk.write_4k_at | ns | 722 | 10195 | 18335 | 23941 | 2.35 | 33.16 |

### AMD

| row | unit | Linux | main (dc1a8642e) | #1152 r1 (94fdd7faa) | #1152 (a1f07627e) | /main | /Linux |
|---|---|---|---|---|---|---|---|
| fs.disk.create_write_unlink | ns | 28270 | 115431 | 189896 | 125866 | 1.09 | 4.45 |
| fs.disk.direct.fstat | ns | - | 9748 | 11532 | 11862 | 1.22 | - |
| fs.disk.direct.pread_4k | ns | - | 10761 | 11482 | 11331 | 1.05 | - |
| fs.disk.direct.read_4k_at | ns | - | 20179 | 21110 | 21400 | 1.06 | - |
| fs.disk.direct.seek | ns | - | 9509 | 9478 | 9898 | 1.04 | - |
| fs.disk.direct.stat | ns | - | 11542 | 37681 | 13876 | 1.20 | - |
| fs.disk.fstat | ns | 1188 | 9919 | 11882 | 12082 | 1.22 | 10.17 |
| fs.disk.mkdir_rmdir | ns | 37904 | 80384 | 111409 | 77475 | 0.96 | 2.04 |
| fs.disk.open_close | ns | 3728 | 21672 | 53841 | 23704 | 1.09 | 6.36 |
| fs.disk.pread_4k | ns | 1803 | 11191 | 1413 | 1382 | 0.12 | 0.77 |
| fs.disk.pread_8 | ns | 1324 | 10330 | 741 | 902 | 0.09 | 0.68 |
| fs.disk.read_4k | ns | 1813 | 11142 | 1183 | 1202 | 0.11 | 0.66 |
| fs.disk.read_4k_at | ns | 1919 | 11532 | 1703 | 1693 | 0.15 | 0.88 |
| fs.disk.readdir.1000 | ns | 442635 | 693862 | 1983029 | 1991264 | 2.87 | 4.50 |
| fs.disk.rename | ns | 10117 | 63282 | 68218 | 42240 | 0.67 | 4.18 |
| fs.disk.reopen_read_4k | ns | - | - | 54973 | 24756 | - | - |
| fs.disk.seek | ns | 804 | 200 | 191 | 190 | 0.95 | 0.24 |
| fs.disk.seq_read.1048576 | MB/s | 11397 | 4789 | 8927 | 8953 | 1.87 | 0.79 |
| fs.disk.seq_read.4096 | MB/s | 5006 | 364 | 4892 | 5590 | 15.36 | 1.12 |
| fs.disk.seq_write.1048576 | MB/s | 787 | 340 | 45 | 448 | 1.32 | 0.57 |
| fs.disk.seq_write.4096 | MB/s | 742 | 211 | 28 | 164 | 0.78 | 0.22 |
| fs.disk.stat | ns | 2163 | 12544 | 39384 | 14928 | 1.19 | 6.90 |
| fs.disk.tree.100 | ns | 3455124 | 12733562 | 26612873 | 17939719 | 1.41 | 5.19 |
| fs.disk.write_4k_at | ns | 2333 | 12183 | 23764 | 30758 | 2.52 | 13.18 |
