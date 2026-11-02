## sample 0 (after-idle) dur 11.61 ms, 8 logged commands
   +  0.404 ms write lba 77029688+8 s2 idle 4396 ms lat 7.616 ms
   +  8.615 ms write lba 73402480+8 s2 idle 0 ms lat 0.053 ms  [gap 0.595 ms, nothing outstanding]
   +  8.621 ms write lba 77026512+8 s2 idle 0 ms lat 0.046 ms
   +  8.622 ms write lba 77027400+16 s2 idle 0 ms lat 0.044 ms
   +  8.795 ms flush lba 0+0 s2 idle 0 ms lat 1.268 ms  [gap 0.127 ms, nothing outstanding]
   + 10.547 ms write lba 73402368+8 s2 idle 0 ms lat 0.052 ms  [gap 0.484 ms, nothing outstanding]
   + 10.553 ms write lba 1331693560+8 s2 idle 0 ms lat 0.045 ms
   + 10.687 ms flush lba 0+0 s2 idle 0 ms lat 0.830 ms  [gap 0.088 ms, nothing outstanding]
   return after last reap: 0.096 ms
   diary records in window: 154; -1865us:c5:arm -90us:c5:arm -55us:c5:fire -45us:c5:pick:osbench_persist -43us:c5:arm -34us:c5:fires 22us:c5:park:osbench_persist 23us:c5:stop 23us:c5:idle 26us:c5:stop 55us:c10:wake:fileserver 70us:c10:pick:fileserver 74us:c10:arm 101us:c10:fires 189us:c10:park:fileserver 190us:c10:arm 190us:c10:idle 192us:c5:wake:osbench_persist 196us:c10:arm 197us:c5:pick:osbench_persist 199us:c5:arm 230us:c10:wake:fileserver 231us:c5:park:osbench_persist 232us:c10:pick:fileserver 232us:c5:stop 232us:c5:idle 232us:c10:arm 235us:c5:stop 291us:c10:park:fileserver 292us:c10:stop 292us:c10:idle 294us:c10:stop 310us:c6:wake:nvme 317us:c6:pick:nvme 318us:c6:arm 412us:c6:park:nvme 413us:c6:arm 413us:c6:idle 417us:c6:arm 7919us:c0:stop
## sample 1 (after-idle) dur 11.45 ms, 7 logged commands
   +  0.408 ms write lba 77029688+8 s2 idle 3117 ms lat 7.547 ms
   +  8.548 ms write lba 73402480+8 s2 idle 0 ms lat 0.052 ms  [gap 0.593 ms, nothing outstanding]
   +  8.554 ms write lba 77027416+24 s2 idle 0 ms lat 0.045 ms
   +  8.729 ms flush lba 0+0 s2 idle 0 ms lat 1.169 ms  [gap 0.129 ms, nothing outstanding]
   + 10.378 ms write lba 73402368+8 s2 idle 0 ms lat 0.047 ms  [gap 0.480 ms, nothing outstanding]
   + 10.384 ms write lba 1331693560+8 s2 idle 0 ms lat 0.040 ms
   + 10.513 ms flush lba 0+0 s2 idle 0 ms lat 0.814 ms  [gap 0.088 ms, nothing outstanding]
   return after last reap: 0.125 ms
   diary records in window: 154; -206us:c5:arm -23us:c5:fire -12us:c5:pick:osbench_persist -10us:c5:arm 0us:c5:fires 53us:c5:park:osbench_persist 54us:c5:stop 54us:c5:idle 58us:c5:stop 86us:c10:wake:fileserver 102us:c10:pick:fileserver 106us:c10:arm 188us:c10:fires 188us:c10:preempt:fileserver 192us:c10:pick:fileserver 193us:c10:arm 226us:c10:park:fileserver 227us:c10:arm 227us:c10:idle 230us:c5:wake:osbench_persist 233us:c10:arm 236us:c5:pick:osbench_persist 237us:c5:arm 267us:c10:wake:fileserver 269us:c10:pick:fileserver 269us:c10:arm 270us:c5:park:osbench_persist 270us:c5:stop 271us:c5:idle 274us:c5:stop 327us:c10:park:fileserver 328us:c10:stop 328us:c10:idle 331us:c10:arm 346us:c6:wake:nvme 353us:c6:pick:nvme 354us:c6:arm 449us:c6:park:nvme 450us:c6:arm 450us:c6:idle
## sample 2 (after-idle) dur 4.49 ms, 8 logged commands
   +  0.398 ms write lba 77029688+8 s2 idle 66 ms lat 1.397 ms
   +  2.386 ms write lba 73402480+8 s2 idle 0 ms lat 0.053 ms  [gap 0.591 ms, nothing outstanding]
   +  2.392 ms write lba 77026512+8 s2 idle 0 ms lat 0.046 ms
   +  2.393 ms write lba 77027400+16 s2 idle 0 ms lat 0.044 ms
   +  2.529 ms flush lba 0+0 s2 idle 0 ms lat 0.854 ms  [gap 0.090 ms, nothing outstanding]
   +  3.461 ms write lba 73402368+8 s2 idle 0 ms lat 0.041 ms  [gap 0.078 ms, nothing outstanding]
   +  3.462 ms write lba 1331693560+8 s2 idle 0 ms lat 0.040 ms
   +  3.553 ms flush lba 0+0 s2 idle 0 ms lat 0.839 ms  [gap 0.051 ms, nothing outstanding]
   return after last reap: 0.093 ms
   diary records in window: 150; -166us:c5:arm -23us:c5:fire -12us:c5:pick:osbench_persist -11us:c5:arm -1us:c5:fires 53us:c5:park:osbench_persist 54us:c5:stop 54us:c5:idle 58us:c5:stop 84us:c10:wake:fileserver 100us:c10:pick:fileserver 104us:c10:arm 218us:c10:park:fileserver 219us:c10:arm 220us:c10:idle 222us:c5:wake:osbench_persist 225us:c10:arm 228us:c5:pick:osbench_persist 229us:c5:arm 258us:c10:wake:fileserver 259us:c10:pick:fileserver 260us:c10:arm 260us:c5:park:osbench_persist 261us:c5:stop 262us:c5:idle 265us:c5:stop 318us:c10:park:fileserver 319us:c10:stop 319us:c10:idle 321us:c10:stop 337us:c6:wake:nvme 343us:c6:pick:nvme 345us:c6:arm 439us:c6:park:nvme 440us:c6:arm 440us:c6:idle 444us:c6:arm 1727us:c0:stop 1743us:c6:wake:nvme 1755us:c6:pick:nvme
## sample 3 (after-idle) dur 11.39 ms, 7 logged commands
   +  0.398 ms write lba 77029688+8 s2 idle 10000 ms lat 7.534 ms
   +  8.523 ms write lba 73402480+8 s2 idle 0 ms lat 0.052 ms  [gap 0.591 ms, nothing outstanding]
   +  8.529 ms write lba 77027416+24 s2 idle 0 ms lat 0.045 ms
   +  8.683 ms flush lba 0+0 s2 idle 0 ms lat 1.326 ms  [gap 0.108 ms, nothing outstanding]
   + 10.363 ms write lba 73402368+8 s2 idle 0 ms lat 0.034 ms  [gap 0.354 ms, nothing outstanding]
   + 10.368 ms write lba 1331693560+8 s2 idle 0 ms lat 0.028 ms
   + 10.434 ms flush lba 0+0 s2 idle 0 ms lat 0.821 ms
   return after last reap: 0.134 ms
   diary records in window: 152; -172us:c5:arm -24us:c5:fire -14us:c5:pick:osbench_persist -12us:c5:arm -2us:c5:fires 53us:c5:park:osbench_persist 54us:c5:stop 54us:c5:idle 58us:c5:stop 85us:c10:wake:fileserver 101us:c10:pick:fileserver 105us:c10:arm 218us:c10:park:fileserver 219us:c10:arm 219us:c10:idle 221us:c5:wake:osbench_persist 224us:c10:arm 226us:c5:pick:osbench_persist 228us:c5:arm 257us:c10:wake:fileserver 259us:c10:pick:fileserver 259us:c10:arm 260us:c5:park:osbench_persist 261us:c5:stop 261us:c5:idle 264us:c5:arm 319us:c10:park:fileserver 319us:c10:stop 320us:c10:idle 322us:c10:stop 337us:c6:wake:nvme 344us:c6:pick:nvme 345us:c6:arm 438us:c6:park:nvme 439us:c6:arm 439us:c6:idle 442us:c6:arm 1072us:c5:stop 7864us:c0:stop 7878us:c6:wake:nvme
## sample 4 (after-idle) dur 10.58 ms, 8 logged commands
   +  0.400 ms write lba 77029688+8 s2 idle 10000 ms lat 7.521 ms
   +  8.480 ms write lba 73402480+8 s2 idle 0 ms lat 0.041 ms  [gap 0.559 ms, nothing outstanding]
   +  8.485 ms write lba 77026512+8 s2 idle 0 ms lat 0.035 ms
   +  8.486 ms write lba 77027400+16 s2 idle 0 ms lat 0.034 ms
   +  8.579 ms flush lba 0+0 s2 idle 0 ms lat 0.853 ms  [gap 0.058 ms, nothing outstanding]
   +  9.510 ms write lba 73402368+8 s2 idle 0 ms lat 0.041 ms  [gap 0.078 ms, nothing outstanding]
   +  9.511 ms write lba 1331693560+8 s2 idle 0 ms lat 0.039 ms
   +  9.602 ms flush lba 0+0 s2 idle 0 ms lat 0.853 ms  [gap 0.051 ms, nothing outstanding]
   return after last reap: 0.125 ms
   diary records in window: 150; -174us:c5:arm -24us:c5:fire -13us:c5:pick:osbench_persist -11us:c5:arm -2us:c5:fires 54us:c5:park:osbench_persist 54us:c5:stop 55us:c5:idle 59us:c5:stop 86us:c10:wake:fileserver 102us:c10:pick:fileserver 106us:c10:arm 219us:c10:park:fileserver 221us:c10:arm 221us:c10:idle 223us:c5:wake:osbench_persist 227us:c10:arm 228us:c5:pick:osbench_persist 229us:c5:arm 258us:c10:wake:fileserver 260us:c10:pick:fileserver 260us:c10:arm 261us:c5:park:osbench_persist 262us:c5:stop 262us:c5:idle 265us:c5:stop 319us:c10:park:fileserver 319us:c10:stop 320us:c10:idle 322us:c10:stop 338us:c6:wake:nvme 344us:c6:pick:nvme 346us:c6:arm 439us:c6:park:nvme 440us:c6:arm 441us:c6:idle 444us:c6:arm 7850us:c0:stop 7866us:c6:wake:nvme 7877us:c6:pick:nvme
## sample 5 (after-idle) dur 11.34 ms, 0 logged commands
   diary records in window: 156; -38us:c5:arm -29us:c5:fire -18us:c5:pick:osbench_persist -16us:c5:arm -6us:c5:fires -5us:c5:preempt:osbench_persist -1us:c5:arm 49us:c5:park:osbench_persist 50us:c5:stop 50us:c5:idle 53us:c5:stop 84us:c10:wake:fileserver 100us:c10:pick:fileserver 104us:c10:arm 220us:c10:park:fileserver 221us:c10:arm 222us:c10:idle 223us:c5:wake:osbench_persist 228us:c10:arm 228us:c5:pick:osbench_persist 230us:c5:arm 259us:c10:wake:fileserver 261us:c10:pick:fileserver 261us:c10:arm 262us:c5:park:osbench_persist 263us:c5:stop 263us:c5:idle 266us:c5:stop 320us:c10:park:fileserver 321us:c10:stop 321us:c10:idle 323us:c10:stop 339us:c6:wake:nvme 346us:c6:pick:nvme 347us:c6:arm 571us:c6:park:nvme 572us:c6:arm 572us:c6:idle 576us:c6:arm 7988us:c0:stop
## sample 6 (after-idle) dur 10.69 ms, 0 logged commands
   diary records in window: 150; -167us:c5:arm -25us:c5:fire -15us:c5:pick:osbench_persist -13us:c5:arm -2us:c5:fires 52us:c5:park:osbench_persist 53us:c5:stop 53us:c5:idle 57us:c5:stop 85us:c10:wake:fileserver 100us:c10:pick:fileserver 104us:c10:arm 218us:c10:park:fileserver 219us:c10:arm 220us:c10:idle 221us:c5:wake:osbench_persist 225us:c10:arm 227us:c5:pick:osbench_persist 228us:c5:arm 257us:c10:wake:fileserver 259us:c10:pick:fileserver 259us:c10:arm 260us:c5:park:osbench_persist 261us:c5:stop 261us:c5:idle 264us:c5:stop 318us:c10:park:fileserver 319us:c10:stop 319us:c10:idle 321us:c10:stop 337us:c6:wake:nvme 343us:c6:pick:nvme 345us:c6:arm 439us:c6:park:nvme 440us:c6:arm 440us:c6:idle 444us:c6:arm 7894us:c0:stop 7909us:c6:wake:nvme 7921us:c6:pick:nvme
## sample 7 (after-idle) dur 11.29 ms, 0 logged commands
   diary records in window: 152; -180us:c5:arm -31us:c5:fire -20us:c5:pick:osbench_persist -18us:c5:arm -8us:c5:fires -6us:c5:fire -6us:c5:preempt:osbench_persist -2us:c5:pick:osbench_persist -2us:c5:arm 50us:c5:park:osbench_persist 52us:c5:stop 52us:c5:idle 56us:c5:stop 96us:c10:wake:fileserver 111us:c10:pick:fileserver 115us:c10:arm 228us:c10:park:fileserver 230us:c10:arm 230us:c10:idle 232us:c5:wake:osbench_persist 236us:c10:arm 238us:c5:pick:osbench_persist 239us:c5:arm 268us:c10:wake:fileserver 269us:c10:pick:fileserver 270us:c10:arm 270us:c5:park:osbench_persist 271us:c5:stop 272us:c5:idle 275us:c5:arm 328us:c10:park:fileserver 328us:c10:stop 329us:c10:idle 331us:c10:stop 347us:c6:wake:nvme 353us:c6:pick:nvme 355us:c6:arm 447us:c6:park:nvme 449us:c6:arm 449us:c6:idle
## sample 8 (b2b) dur 2.55 ms, 0 logged commands
   diary records in window: 240; -1998us:c6:arm -1189us:c0:stop -1175us:c6:wake:nvme -1169us:c6:pick:nvme -1168us:c6:arm -1160us:c6:fires -1125us:c6:park:nvme -1124us:c6:arm -1124us:c6:idle -1122us:c6:arm -1116us:c10:wake:fileserver -1110us:c10:pick:fileserver -1109us:c10:arm -1055us:c10:park:fileserver -1054us:c10:stop -1054us:c10:idle -1053us:c10:stop -1047us:c5:wake:osbench_persist -1043us:c5:pick:osbench_persist -1042us:c5:arm -1030us:c5:fires 14us:c5:park:osbench_persist 14us:c5:stop 15us:c5:idle 16us:c5:stop 21us:c10:wake:fileserver 23us:c10:pick:fileserver 23us:c10:arm 57us:c10:park:fileserver 58us:c10:arm 58us:c10:idle 59us:c10:arm 62us:c5:wake:osbench_persist 64us:c5:pick:osbench_persist 65us:c5:arm 76us:c5:park:osbench_persist 77us:c5:stop 77us:c5:idle 78us:c5:stop 85us:c10:wake:fileserver
## sample 9 (b2b) dur 2.91 ms, 0 logged commands
   diary records in window: 288; -1313us:c10:stop -1277us:c6:arm -1263us:c0:stop -1258us:c6:wake:nvme -1256us:c6:pick:nvme -1255us:c6:arm -1252us:c6:fires -1239us:c6:park:nvme -1239us:c6:arm -1239us:c6:idle -1238us:c6:arm -1221us:c10:wake:fileserver -1216us:c10:pick:fileserver -1214us:c10:arm -1209us:c10:fires -1101us:c10:park:fileserver -1100us:c10:stop -1099us:c10:idle -1099us:c6:wake:nvme -1097us:c6:pick:nvme -1097us:c6:arm -1096us:c10:stop -1075us:c6:park:nvme -1075us:c6:arm -1075us:c6:idle -1074us:c6:arm -1046us:c0:stop -1041us:c6:wake:nvme -1039us:c6:pick:nvme -1039us:c6:arm -1022us:c6:park:nvme -1022us:c6:arm -1022us:c6:idle -1021us:c6:arm -1004us:c10:wake:fileserver -999us:c10:pick:fileserver -997us:c10:arm -962us:c10:park:fileserver -961us:c10:stop -960us:c10:idle
## sample 10 (b2b) dur 2.65 ms, 0 logged commands
   diary records in window: 276; -1723us:c0:stop -1626us:c10:stop -1552us:c6:arm -1549us:c6:wake:nvme -1549us:c0:stop -1545us:c6:pick:nvme -1544us:c6:arm -1536us:c6:fires -1536us:c6:preempt:nvme -1534us:c6:arm -1512us:c6:park:nvme -1512us:c6:arm -1512us:c6:idle -1511us:c6:arm -1496us:c10:wake:fileserver -1490us:c10:pick:fileserver -1489us:c10:arm -1485us:c10:fires -1377us:c10:park:fileserver -1375us:c10:stop -1375us:c6:wake:nvme -1375us:c10:idle -1374us:c6:pick:nvme -1373us:c6:arm -1372us:c10:stop -1353us:c6:park:nvme -1352us:c6:arm -1352us:c6:idle -1351us:c6:arm -1323us:c0:stop -1318us:c6:wake:nvme -1316us:c6:pick:nvme -1315us:c6:arm -1300us:c6:park:nvme -1300us:c6:arm -1300us:c6:idle -1299us:c6:arm -1282us:c10:wake:fileserver -1277us:c10:pick:fileserver -1276us:c10:arm
