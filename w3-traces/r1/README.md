# ToyOSOrg/ToyOS#1128 review round 1, at 443e0d72838f30a80d9c01f7a6965534ffe61d16

Paths are masked: `<dev>` is the developer's source directory and `~` is home.

- `ax2xx-tests.log`: `cargo test -p toyos-ax2xx`, exit 0 (the last line).
- `ci-host.log`: `cargo run -- --ci host`, exit 0, 107 steps, macOS aarch64 host.
- Negative controls. Each `.patch` is `git diff` of the single mutation on the committed head. Each was run with `cargo test -p toyos-ax2xx --test traces` (the log shows the crate compiling) and restored with `git checkout`. Each log ends with its exit code and the empty `git status` after the restore.
  - `control-oracle`: `nvm()`'s decision covers all 110 profile entries instead of the AX200's 51. Exit 101: both traces fail with "a decision rests on a bit the run did not record". This shows that the masked-bit oracle (`both`/`decided`) catches a decision resting on unrecorded bits.
  - `control-band`: swaps the 2.4 and 5 GHz band encoding. Exit 101: Run13 fails and Run11 passes.
  - `control-umac`: shifts the UMAC table's data index by one. Exit 101: Run11 fails and Run13 passes.
- `unrecorded-length-words.txt`: the five device lines whose `rec=` mask records none of the length-and-flags word (`rec=00000000…`).
  - This contradicts §14's item 18, which names only "every length-and-flags word's bits 31:14" as unrecorded.
  - It contradicts §15.2 too, which says each device packet records its lengths.
  - The test keeps the length word as the trace fills it, as framing, and complements only the bits after it.
  - This is for the spec author to settle; the test does not depend on how it is settled.
- This round supersedes the top-level files and `controls-at-head/`. Round 1 changed `Command::header`, `errors.rs` and the trace test, so those earlier results no longer apply to the head.
