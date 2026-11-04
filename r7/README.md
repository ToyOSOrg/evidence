# pr-1150 r7: the send gap and the pipe gap found under KVM

All guest runs here are on the remote KVM host (Intel i7-8700K) through `qemu-remote.sh`,
osbench's bench groups (`osbench_capability_groups_exit_0` on `*-kvm` measurement branches).
Every `MEASUREMENT ONLY` branch named below is never to land.

- **The KVM A/B reproduces round 4's shape** (`*-s0a-probe-base-kvm.log`, `*-s0a-probe-kvm.log`,
  head 05f6c884f). Base's rounds agree within about 1%. The head is −5 to −10% on small pipe
  writes, +9% on `ipc.reqrep.4096`, and about +80 ns per send.
- **The IPC cause:** the SDK frames a message behind a 4-byte type and carries up to 8192 bytes
  a frame. So `ipc.reqrep.4096` sends 4100-byte messages and `65536` 8196-byte ones, past the
  4096-byte bounce, and only the 12-byte messages ever bounced (`*-seg*.log`, segment counts).
  - With an 8200-byte bounce (`*-b8200.log`) every IPC row matched main.
  - 68518af87 bounces every message (at most `MAX_MESSAGE_LEN`). `*-s0a-probe2-kvm.log`:
    `ipc.reqrep.4096` 16411/16029 ns against main's 16334-16407; `65536` within 2%.
- **The pipe cause** (`*-kvm-thr.log`, `*-kvm-wseg.log`; a busy thread's line at its exit):
  - Base's writer spends 585-604 ns per 64-byte write, the head's 671-701, a fixed cost per
    call.
  - Inside the head's copy-in, the wait for the process's address-space lock is 375-424
    cycles against base's 62-71. The reader's rises from 69 to 216.
  - Base made every user copy under the process lock, so the two threads' copies never met
    on the space's lock or on its `Arc` refcount, which a copy clones. Without that
    serialization they contend on both.
  - `*-noarc.log` borrows the space rather than cloning it. The copy-in falls about 7%, and
    the lock wait stays.
- `*-68518af87.log`: the declared x86 machine tests relevant to streams, connections, sessions,
  stdio and the log, at 68518af87: 8 of 8 pass.
- `host-7.*`: `cargo run -- --ci host` at 68518af87, rc=0, 109 steps green.
  - Its last step, "the libraries built for a guest", overlapped a branch switch in its
    worktree for about three seconds.
  - `host-7-libs-rerun.log` reruns that step's command at 68518af87: rc=0.
