# ipc-latency working notes

Method: QEMU TCG x86-64 (4 vCPU, qemu64+pcid/invpcid), scratch plugin tools/plugin/insncount.c
counting every executed guest instruction between cpuid markers in osbench, plus a 1/997-instruction
frame-pointer stack sampler. Instruction counts are a proxy for cost; timing comes from the T14 only.

Kernel instructions per operation (mean over 2000 rounds; null over 20000 calls):
| phase | base 32046264b | rq | m3 | m4 | m5 |
| syscall.null | 973 | 1957* | 303 | 307 | 303 |
| futex cross round trip | 58030 | 42607 | 34378 | 31978 | 32177 |
| pipe cross round trip | 72232 | 57605 | 45787 | 41357 | 39329 |
| ipc.reqrep.8 round trip | 85654 | 70153 | 58329 | 51059 | 47715 |
*contention on PROCESS_TABLE lock during that run.
rq: arena run queue. m3: + offering mask, parked deadline index, syscall profile on TaskHandle,
division-free tick conversion. m4: + single find in reach, futex re-read skip, single-descent
coverage, kick-handler pass gating. m5: + per-pipe ownership (no PIPES lock).
