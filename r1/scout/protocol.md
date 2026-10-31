# T14 display scout: read-only, one boot

- Branch: `display-scout` at `22e638ae79fc5e3cfd39c1e28d4b261f85d018ad`, in worktree `../toyos-display`. It is a measurement branch built on `power-scout` `9fd3114fc`, not for landing.
- Row: `display_scout`, which is named-only. Image: scoutcase, on a test-actuators kernel. The command is in `request.txt`, run from `../toyos-display`.
- Duration: up to 120 s waiting for quiet, then a register read, one 30 s idle row, a second read, and the boot's usual reboot.
- Judge: `osbench_display_scout` ran to its end.

## What it reads

Each read is logged as `scout: display ...` lines in the kernel log.

- 00:02.0's config space: PCICMD, MGGC0, BDSM.
- Singles: FUSE_STATUS, DE_POWER1/2, ARB_CTL2, DBUF_CTL_S1/S2, MBUS_ABOX_CTL, WM_LINETIME_A, PWR_WELL_CTL1/2, DC_STATE_EN, 45520h, CDCLK_CTL, TRANS_DDI_FUNC_CTL_A, SRD_CTL/STATUS/PERF_CNT_A, PSR2_CTL/STATUS_A, TRANS_CONF_A, PIPE_ARB_CTL_A.
- Dense dumps (non-zero words only):
  - transcoder A at 60000h-6007Fh: timings and M/N;
  - pipe A at 70000h-7087Fh: the cursor and planes 1-7, with PLANE_WM_0..7, WM_TRANS and BUF_CFG;
  - CSR program storage at 80000h-8003Fh;
  - 8F000h-8F0FFh.
- The GGTT PTE for PLANE_SURF_1_A, read at GTTMMADR + 8 MiB.
- Pipe A's frame count over 0.5 s, which gives the refresh rate.

## Writes

No display register is written. The only writes are queries to the GT driver mailbox (138124h/138128h/13812Ch), each skipped if the mailbox is busy:

- command 06h: memory latencies, both sets;
- command 23h: SAGV block time;
- command 0Dh, PARAM1=0: MemSS global info;
- command 0Dh, PARAM1=1, PARAM2=0..3: QGV points.

The PARAM2 field position (23:16) is an inference. The mailbox's error code shows whether it is right.

## Risk

All reads are of pipe A and global display registers in a powered well. The mailbox commands are queries from Vol 12, with no configuration change.
