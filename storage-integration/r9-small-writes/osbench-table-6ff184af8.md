
### T14

| row | unit | Linux | main (dc1a8642e) | #1152 r1 (94fdd7faa) | #1152 (6ff184af8) | /main | /Linux |
|---|---|---|---|---|---|---|---|
| fs.disk.create_write_unlink | ns | 11206 | 161348 | 195115 | 127853 | 0.79 | 11.41 |
| fs.disk.direct.fstat | ns | - | 8450 | 11824 | 10546 | 1.25 | - |
| fs.disk.direct.pread_4k | ns | - | 9430 | 10909 | 10841 | 1.15 | - |
| fs.disk.direct.read_4k_at | ns | - | 17753 | 20595 | 18552 | 1.05 | - |
| fs.disk.direct.seek | ns | - | 8348 | 9588 | 8433 | 1.01 | - |
| fs.disk.direct.stat | ns | - | 10657 | 49134 | 12527 | 1.18 | - |
| fs.disk.fstat | ns | 224 | 8719 | 12207 | 10842 | 1.24 | 48.40 |
| fs.disk.mkdir_rmdir | ns | 15176 | 84955 | 116600 | 81135 | 0.96 | 5.35 |
| fs.disk.open_close | ns | 1252 | 26222 | 67881 | 24350 | 0.93 | 19.45 |
| fs.disk.pread_4k | ns | 590 | 9584 | 945 | 894 | 0.09 | 1.52 |
| fs.disk.pread_8 | ns | 377 | 8959 | 687 | 642 | 0.07 | 1.70 |
| fs.disk.read_4k | ns | 539 | 9576 | 951 | 951 | 0.10 | 1.76 |
| fs.disk.read_4k_at | ns | 728 | 10012 | 1245 | 1199 | 0.12 | 1.65 |
| fs.disk.readdir.1000 | ns | 273843 | 908345 | 2751006 | 2879891 | 3.17 | 10.52 |
| fs.disk.rename | ns | 3624 | 87717 | 77669 | 45347 | 0.52 | 12.51 |
| fs.disk.reopen_read_4k | ns | - | - | 68950 | 24974 | - | - |
| fs.disk.seek | ns | 120 | 264 | 284 | 241 | 0.91 | 2.01 |
| fs.disk.seq_read.1048576 | MB/s | 10016 | 7016 | 6737 | 6729 | 0.96 | 0.67 |
| fs.disk.seq_read.4096 | MB/s | 7784 | 427 | 3992 | 4105 | 9.61 | 0.53 |
| fs.disk.seq_write.1048576 | MB/s | 346 | 349 | 43 | 383 | 1.10 | 1.11 |
| fs.disk.seq_write.4096 | MB/s | 624 | 133 | 39 | 18 | 0.14 | 0.03 |
| fs.disk.stat | ns | 584 | 11631 | 50658 | 13729 | 1.18 | 23.51 |
| fs.disk.tree.100 | ns | 1350872 | 13957113 | 32735460 | 21655863 | 1.55 | 16.03 |
| fs.disk.write_4k_at | ns | 722 | 10195 | 18335 | 24953 | 2.45 | 34.56 |

### AMD

| row | unit | Linux | main (dc1a8642e) | #1152 r1 (94fdd7faa) | #1152 (6ff184af8) | /main | /Linux |
|---|---|---|---|---|---|---|---|
| fs.disk.create_write_unlink | ns | 28270 | 115431 | 189896 | 122840 | 1.06 | 4.35 |
| fs.disk.direct.fstat | ns | - | 9748 | 11532 | 11641 | 1.19 | - |
| fs.disk.direct.pread_4k | ns | - | 10761 | 11482 | 11241 | 1.04 | - |
| fs.disk.direct.read_4k_at | ns | - | 20179 | 21110 | 21180 | 1.05 | - |
| fs.disk.direct.seek | ns | - | 9509 | 9478 | 9768 | 1.03 | - |
| fs.disk.direct.stat | ns | - | 11542 | 37681 | 13525 | 1.17 | - |
| fs.disk.fstat | ns | 1188 | 9919 | 11882 | 11813 | 1.19 | 9.94 |
| fs.disk.mkdir_rmdir | ns | 37904 | 80384 | 111409 | 76463 | 0.95 | 2.02 |
| fs.disk.open_close | ns | 3728 | 21672 | 53841 | 23314 | 1.08 | 6.25 |
| fs.disk.pread_4k | ns | 1803 | 11191 | 1413 | 1393 | 0.12 | 0.77 |
| fs.disk.pread_8 | ns | 1324 | 10330 | 741 | 922 | 0.09 | 0.70 |
| fs.disk.read_4k | ns | 1813 | 11142 | 1183 | 1202 | 0.11 | 0.66 |
| fs.disk.read_4k_at | ns | 1919 | 11532 | 1703 | 1693 | 0.15 | 0.88 |
| fs.disk.readdir.1000 | ns | 442635 | 693862 | 1983029 | 2006442 | 2.89 | 4.53 |
| fs.disk.rename | ns | 10117 | 63282 | 68218 | 41167 | 0.65 | 4.07 |
| fs.disk.reopen_read_4k | ns | - | - | 54973 | 24306 | - | - |
| fs.disk.seek | ns | 804 | 200 | 191 | 190 | 0.95 | 0.24 |
| fs.disk.seq_read.1048576 | MB/s | 11397 | 4789 | 8927 | 8914 | 1.86 | 0.78 |
| fs.disk.seq_read.4096 | MB/s | 5006 | 364 | 4892 | 5502 | 15.12 | 1.10 |
| fs.disk.seq_write.1048576 | MB/s | 787 | 340 | 45 | 451 | 1.33 | 0.57 |
| fs.disk.seq_write.4096 | MB/s | 742 | 211 | 28 | 18 | 0.09 | 0.02 |
| fs.disk.stat | ns | 2163 | 12544 | 39384 | 14627 | 1.17 | 6.76 |
| fs.disk.tree.100 | ns | 3455124 | 12733562 | 26612873 | 17757007 | 1.39 | 5.14 |
| fs.disk.write_4k_at | ns | 2333 | 12183 | 23764 | 29997 | 2.46 | 12.86 |
