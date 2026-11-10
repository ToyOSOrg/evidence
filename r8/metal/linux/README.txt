# The Linux side of the request. Nothing here was run on a bench.

Binary
  path    : <scratch>/metal/linux/osbench
  sha256  : b965e86b76d1fae9ef837c8fa70bd4fafcd96a48e248d7aa4e97f626a4f9b24b
  what    : x86_64-unknown-linux-musl, static-pie, 6780240 bytes; needs no library and no toolchain on the bench
  built   : at 24f5de7789377154d59ee41d880447fae37a7cda (P, branch nvme-apst), clean tree, with
            cargo +nightly-2026-07-22 build -p osbench --target x86_64-unknown-linux-musl --profile toyos
            (tests/guest/osbench/README.md's own command), exit 0
  one binary serves both benches.

Persist run (3 per bench: L1, L2, L3). No sudo, no arguments beyond the group.
  command : <copied path>/osbench persist </dev/null > <out> 2> <err>
  as      : the bench user, not root
  cwd     : any; the bench user's home is fine. The program does not use it.
  writes  : $HOME/osbench-<pid>/ on whatever filesystem holds $HOME, which must be the bench's NVMe
            root (ext4), as in r3-r7. Under 12 MiB at once (three 1 MiB files, one 8 MiB file, a log
            that grows to 420 KiB). It removes the directory when it ends.
  needs   : HOME set, as a login or ssh session has it.
  time    : about 2 minutes: the after-idle row alone sleeps 8 x 10 s.
  exit    : 0. 1 means a row was refused, and the run is void; its stderr says which.
  state   : Linux as the bench boots it. No governor change and nothing else set, so no sudo here.
            Nothing else should run on the bench during it: the after-idle row needs the disk idle.
  wanted  : stdout whole (every `osbench v=2 os=linux ...` line), stderr, the exit code.

nvme run (1 per bench: LN), as root. Reported, not gated: if the bench does not allow it, skip it
and say so; G1-G3 do not depend on it.
  command : sudo <copied path>/osbench nvme </dev/null > <out> 2> <err>
  cwd     : any. It writes no file and reads no $HOME.
  time    : under a minute.
  what needs root, and nothing else does:
    1. open("/dev/nvme0n1", O_RDONLY | O_DIRECT) on the first NVMe namespace, then pread only:
       4 KiB random reads and 1 MiB sequential reads (256 MiB per round). It is opened read-only
       and never written. Needs read access to the block device (root, or group `disk`).
    2. open("/dev/nvme0", O_RDONLY) and one ioctl: NVME_IOCTL_ADMIN_CMD, request 0xC0484E41
       (_IOWR('N', 0x41, struct nvme_admin_cmd), 72 bytes), carrying Get Features (opcode 0x0A),
       feature 0x0C (the APST table), 256 bytes read back. Nothing is set. Needs CAP_SYS_ADMIN.
    Besides those: reads of /sys/block/nvme*/ and one anonymous mmap for the read buffer.
  without sudo: it still exits, with both read rows and `nvme.apst` marked unmeasured (permission
       denied). That output is of no use; skip the run instead.
  order   : last, after every boot and every persist run on that bench. It sends the controller an
            admin command, and r7 found admin power queries beside the after-idle samples perturbed
            the AMD's drive. One Get Features after everything else touches no measured sample.
  wanted  : stdout whole (the `nvme.apst` note is the table), stderr, the exit code.
