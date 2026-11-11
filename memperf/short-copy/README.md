# libc's short copy: negative controls

These ran in a scratch crate. It compiles the PR's `sdk/libc/src/arch/x86_64.rs` through `#[path]`, with `std-runtime` on, beside a copy of `toyos-libc-copies`' copy tests, including the PR's new short-copy test. It ran with `cargo test --target x86_64-apple-darwin`, x86-64 under Rosetta on an aarch64 macOS host. Rosetta declares no FSRM (leaf 7 EDX = 0), so `copy_forward` itself takes the short copy up to 256 bytes there.

Three mutations of the module were each run against the tests, and each failed (exit 101):

- `mutation-1`: the head stores come before the tail loads, so an overlapping copy reads bytes it already wrote. Caught by the new short-copy test and by `every_copy_agrees_with_copy_within`.
- `mutation-2`: the two-vector arm takes 65 bytes, one more than its four moves cover. Caught by all three copy tests.
- `mutation-3`: the threshold is 260, past what eight moves from each end cover. Caught by `copy_forward`'s tests.

The unmutated file was restored and passed (5 tests).

The PR's own checks of the committed crate are in the PR description.

## Host checks of the committed branch

`host-checks/` holds the three commands at 23d112929; `exits.txt` gives each exit code, all 0. They are the copies crate's tests for x86-64 under Rosetta and natively on aarch64, and its clippy run for x86-64 with the adopted lints and `-D warnings`.

## The guest build's code, and two follow-up commits

`disassembly/` is `memcpy`, `memmove` and the cold first-copy function, taken with GNU objdump from the x86-64 `osbench` that each staging linked: guest profile, ToyOS sysroot.

- **23d112929**: no call to `memcpy` inside `memcpy` or `memmove`, and the 129-256 byte arm keeps all sixteen loads in xmm0-15 with no spill. But the FSRM question was an out-of-line call on every copy of up to 256 bytes, so the prologue saved three registers on every CPU.
- **b6c8d0001**: the question moved into a cold first copy. The prologue still saved one register, to keep `dest` across that call, and tested two states.
- **a7e5b1cb5**, the PR head: one word, the length below which a copy is moves, read and compared once. The first copy is a tail jump. A CPU with FSRM runs `push rbp; mov rbp,rsp; mov rax,rdi; mov rcx,[word]; cmp rdx,rcx; jae; mov rdi,rax; mov rcx,rdx; rep movsb`. Main ran `push rbp; mov rbp,rsp; mov rcx,rdx; mov rax,rdi; rep movsb`.

`host-checks-a7e5b1cb5/` holds the head's checks, each exit 0: the crate's tests for x86-64 under Rosetta and on aarch64, and clippy on both. `copy_forward`'s aarch64 signature changed too: it now answers `dest`.

`mutations-a7e5b1cb5/` holds the same three mutations against the head's module, each caught (exit 101). The unmutated file was restored and compared with `cmp` against the committed one.
