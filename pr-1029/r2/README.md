# PR #1029, round r2

## Review fix (head e0b2c851499ecbaf99f32fb38e92d9bc754cbab0, development Mac)
- `logs/test-*.log`, `logs/clippy-*.log`: `cargo test -p toyos-crypto` and `cargo clippy -p toyos-crypto --all-targets -- -D warnings`
  in the crate's three forms (dispatched, portable, default), each exit 0.
- `mutations/`: eight negative controls applied by `run.sh`, each built, red and reverted (`summary.txt`).
  m5 removes the MAX_MEMORY table bound, m7 bounds only the table by the caller's memory limit, and m8 ignores the work limit.

## T14 constant-time boot (head ba90ee11c, the r1 head; the r2 change touches only `Params` validation)
- LENOVO 20W0003AMZ, BIOS N34ET71W (1.71), Intel signature 0x806c1, microcode 0xbe (`t14/cpu.txt`, `t14/boot.txt`).
- Boot `cryptoctcase`: verdict `passed` (`t14/verdict.txt`); judge `1 passed, 0 failed` (`t14/judge.log`).
- New lines:
  - `ct pbkdf2-hmac-sha256, 32 B password and salt, 2 iterations, 64 B: pass max |t| 1.35`
  - `ct scrypt salsa20/8 core: pass max |t| 1.99`
- Controls: null max |t| 1.51 and 1.56, leaky max |t| 100.94 and 1177.70.
