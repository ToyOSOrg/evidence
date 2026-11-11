# The sweep for #1219

What was looked for: a test that encodes a spawn refusal, an argument or
environment bound, `ARG_MAX`, a process name or an `.expect` line that #1189
(the loader is the program's; a spawn with no image refused in the SDK) or
#1200 (the startup block; names chosen by the parent; `SYS_GET_ENV` gone)
changed.

## Shared T14 members: by run

`testcases` carries every discovered Rust binary, every corpus case with an
`.expect` and `LAST_MEMBERS`; `shared-debug` carries `ACTUATOR_TESTS`. The
T14 ran both whole at 23f692c91, which holds #1189 and #1200:
`testcases: 236 member(s)`, `shared-debug: 9 member(s)`, and the only
members it failed were `test_rs_served_file_offset` and `206_libc_refusals`
(evidence 8982a439e09f0faed7c69c52b8fb40868890c989, `metal-run/judge-branch.txt`;
`quoted-lines.txt` holds every member that ended nonzero).

`git diff 23f692c91 b56693152` over `sdk`, `kernel/src/syscall`,
`kernel/src/loader`, `kernel/src/process.rs`, `tests/guest` and `tests/corpus`:
comments in `kernel/src/syscall/dispatch.rs`, `sdk/abi/src/syscall.rs` and
`sdk/toyos/src/syscap.rs`; `file_mtime.rs` changed and `hpet_stall_read.rs`
added (a `RUST_SKIP` helper, not a member). No member was added or removed.

## Everything else: by inspection

`non-member-binaries.txt`: the 58 `RUST_SKIP` binaries that do not ride
`testcases`, with grep counts. Read in full where a count was nonzero:

- They assert a spawn or launch succeeded (`expect`), or refusals that are
  not spawn bounds: ACPI (`acpi_mediated`), a manifest or launcher
  (`app_view`, `launch_toctou`), streams (`stream_handles`), memory kinds
  (`kernel_objects_refused`).
- `memory_floor` asserts a spawn refused for memory is `OutOfMemory`. std
  reads the image into memory counted to the endowed job before any startup
  block exists; `ImageRefused::Memory(ResourceExhausted)` maps to
  `OutOfMemory` (`sdk/std/sys/fs.rs`, `sdk/std/sys/pal/mod.rs`).
- `ring_park_herd` reads the roster by pid, not by name.
- `launch_toctou` depends on toybox running as `ps` from its `argv[0]`,
  which the block carries as given; it asserts exits, not names.
- Ran green in #1200's own checks: `libc_children` (every
  `tests/guest/libc` program and `stdio_named`, `libc_recv_beside_close`,
  `quit_tree`, `libc_read_restarts`, `tty_interrupt`), `session_lifecycle`,
  `launch_unsent_stdio` and `process_tree`.

The harness's judges (`tests/toyos.rs`, `tests/common`, `tests/metal/src`):
the kernel lines they match (`spawn: <path>`, `exit: <name> pid=`, `spawn:
refused under pid`) name processes as before: the SDK names a child for its
`argv[0]`'s last component and the old kernel did the same, both to 27 bytes.

`.expect` files: only `tests/corpus/tinycc` has them, and every case that
runs is a `testcases` member.
