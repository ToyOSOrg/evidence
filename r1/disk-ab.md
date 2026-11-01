## t14
| row | unit | A p50s | B p50s | B vs A (median) | resolved | regression |
|---|---|---|---|---|---|---|
| fs.disk.create_write_unlink | ns | [128754, 203458] | [132329, 130080] | -21.0% | - |  |
| fs.disk.direct.fstat | ns | [8399, 8560] | [8374, 8508] | -0.5% | - |  |
| fs.disk.direct.pread_4k | ns | [9303, 9456] | [9274, 9440] | -0.2% | - |  |
| fs.disk.direct.read_4k_at | ns | [19265, 17865] | [17463, 17829] | -5.0% | B better |  |
| fs.disk.direct.seek | ns | [8260, 8391] | [8227, 8391] | -0.2% | - |  |
| fs.disk.direct.stat | ns | [10459, 13738] | [10486, 10571] | -13.0% | - |  |
| fs.disk.fstat | ns | [8769, 8787] | [8642, 8770] | -0.8% | - |  |
| fs.disk.mkdir_rmdir | ns | [93305, 138331] | [89073, 88080] | -23.5% | B better |  |
| fs.disk.open_close | ns | [21998, 22204] | [22305, 22378] | +1.1% | B worse |  |
| fs.disk.pread_4k | ns | [9553, 9630] | [9510, 9612] | -0.3% | - |  |
| fs.disk.pread_8 | ns | [8857, 8916] | [8847, 8906] | -0.1% | - |  |
| fs.disk.read_4k | ns | [9618, 9569] | [9527, 9580] | -0.4% | - |  |
| fs.disk.read_4k_at | ns | [10160, 10099] | [9993, 10122] | -0.7% | - |  |
| fs.disk.readdir.1000 | ns | [902557, 872441] | [872531, 870850] | -1.8% | - |  |
| fs.disk.rename | ns | [79746, 100410] | [76591, 75657] | -15.5% | B better |  |
| fs.disk.seek | ns | [243, 240] | [241, 243] | +0.2% | - |  |
| fs.disk.seq_read.1048576 | MB/s | [6431, 6534] | [6601, 6507] | +1.1% | - |  |
| fs.disk.seq_read.4096 | MB/s | [423, 424] | [425, 420] | -0.2% | - |  |
| fs.disk.seq_write.1048576 | MB/s | [288, 558] | [294, 560] | +0.9% | - |  |
| fs.disk.seq_write.4096 | MB/s | [199, 219] | [220, 167] | -7.4% | - |  |
| fs.disk.stat | ns | [11731, 12719] | [11561, 11715] | -4.8% | B better |  |
| fs.disk.tree.100 | ns | [15024859, 20525652] | [15024399, 15454539] | -14.3% | - |  |
| fs.disk.write_4k_at | ns | [10105, 10122] | [10086, 10135] | -0.0% | - |  |
| persist.append_4k_fsync | ns | [5934825, 6313366] | [6104338, 922840] | -42.6% | - |  |
| persist.create_fsync_unlink | ns | [6190217, 6447479] | [1055129, 1043433] | -83.4% | B better |  |
| persist.fsync_clean | ns | [14579, 14524] | [14477, 14667] | +0.1% | - |  |
| persist.seq_read_cached | MB/s | [6478, 7209] | [7096, 7297] | +5.2% | - |  |
| persist.seq_write_fsync | MB/s | [237, 238] | [565, 508] | +125.9% | B better |  |
| persist.write_4k_fsync | ns | [5948674, 6136320] | [6110842, 927320] | -41.8% | - |  |
| persist.write_4k_fsync_after_idle | ns | [5903154, 6796560] | [17900112, 14207706] | +152.8% | B worse | **YES** |

after_idle A max [6151614, 6865121] B max [18433696, 14471062]; A min [5805253, 6452781] B min [15049911, 6141657]

## amd
| row | unit | A p50s | B p50s | B vs A (median) | resolved | regression |
|---|---|---|---|---|---|---|
| fs.disk.create_write_unlink | ns | [113108, 116013] | [115333, 114611] | +0.4% | - |  |
| fs.disk.direct.fstat | ns | [9699, 9709] | [9738, 9719] | +0.3% | B worse |  |
| fs.disk.direct.pread_4k | ns | [10841, 10820] | [10771, 10650] | -1.1% | B better |  |
| fs.disk.direct.read_4k_at | ns | [20380, 20590] | [20109, 20229] | -1.5% | B better |  |
| fs.disk.direct.seek | ns | [9569, 9518] | [9338, 9569] | -0.9% | - |  |
| fs.disk.direct.stat | ns | [11732, 11723] | [11452, 11623] | -1.6% | B better |  |
| fs.disk.fstat | ns | [10039, 10330] | [9999, 9909] | -2.3% | B better |  |
| fs.disk.mkdir_rmdir | ns | [79193, 79593] | [78812, 79052] | -0.6% | B better |  |
| fs.disk.open_close | ns | [21281, 22313] | [21572, 21231] | -1.8% | - |  |
| fs.disk.pread_4k | ns | [11282, 11271] | [11291, 11141] | -0.5% | - |  |
| fs.disk.pread_8 | ns | [10310, 10400] | [10339, 10260] | -0.5% | - |  |
| fs.disk.read_4k | ns | [11463, 11351] | [11401, 11282] | -0.6% | - |  |
| fs.disk.read_4k_at | ns | [11793, 11702] | [11753, 11603] | -0.6% | - |  |
| fs.disk.readdir.1000 | ns | [684542, 685661] | [683769, 683375] | -0.2% | B better |  |
| fs.disk.rename | ns | [62951, 63232] | [62501, 62400] | -1.0% | B better |  |
| fs.disk.seek | ns | [200, 200] | [201, 201] | +0.5% | B worse |  |
| fs.disk.seq_read.1048576 | MB/s | [4587, 4593] | [4548, 4415] | -2.4% | B worse |  |
| fs.disk.seq_read.4096 | MB/s | [361, 355] | [357, 361] | +0.3% | - |  |
| fs.disk.seq_write.1048576 | MB/s | [883, 888] | [876, 879] | -0.9% | B worse |  |
| fs.disk.seq_write.4096 | MB/s | [254, 251] | [252, 257] | +0.8% | - |  |
| fs.disk.stat | ns | [12704, 13045] | [12805, 12514] | -1.7% | - |  |
| fs.disk.tree.100 | ns | [12801240, 12861670] | [12631820, 12703322] | -1.3% | B better |  |
| fs.disk.write_4k_at | ns | [12464, 12323] | [12414, 12144] | -0.9% | - |  |
| persist.append_4k_fsync | ns | [2382870, 2401276] | [2425036, 2392445] | +0.7% | - |  |
| persist.create_fsync_unlink | ns | [2554901, 2581845] | [2562833, 2594184] | +0.4% | - |  |
| persist.fsync_clean | ns | [42222, 37723] | [40108, 37332] | -3.1% | - |  |
| persist.seq_read_cached | MB/s | [4139, 2437] | [2333, 2732] | -23.0% | - |  |
| persist.seq_write_fsync | MB/s | [658, 559] | [693, 552] | +2.3% | - |  |
| persist.write_4k_fsync | ns | [2328415, 2335580] | [2316748, 2329654] | -0.4% | - |  |
| persist.write_4k_fsync_after_idle | ns | [3009900, 3005591] | [10058527, 10019687] | +233.8% | B worse | **YES** |

after_idle A max [3061750, 3120683] B max [10213597, 10074131]; A min [2983218, 2956877] B min [10002810, 9930555]

