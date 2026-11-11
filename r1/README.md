# PR #1202, review r1: fixes at `fea712a16` (branch `block-fua`)

| file | command | exit |
|---|---|---|
| `ci-host.log` | `cargo run -- --ci host` | 1: 110 of 111 green; the one red is the macOS-only `llvm` environment test, as before |
| `build-only.log` | `cargo run -- --build-only` | 0 |
| `mutation-flush-outside-retry.log` | `cargo test crash` in `lib/bcachefs` with `mutation-flush-outside-retry.patch` (the journal's flush hoisted out of the retry), then restored | 101: exactly `an_entry_written_again_after_a_refusal_follows_a_flush_of_its_own` red, 19 pass |

Guest rows for this head were dispatched (runs 42928628188) and had not started when this was
written; nothing is claimed from them here.

## Where MODE SENSE's page 3Fh and 192 bytes came from

Not from a source checked in this work. The standard lets the allocation be the header's four
bytes, which is all the driver reads. The implementer chose "all pages, 192 bytes" from memory, as
the form of MODE SENSE(6) that desktop hosts commonly send a USB stick at bring-up, on the
reasoning that a stick's firmware is likelier to answer a request it has been sent many times than
a legal one it has rarely seen. Neither the claim about other hosts nor the reasoning was verified
against documentation, code or a device. It is an inference, and the only test of it is a real
stick's bring-up line, which no boot has yet shown (see the USB record's exit).
