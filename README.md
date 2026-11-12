# Evidence for ToyOS #1280

- `r14/`: at 0df33fdf3, a clean tree (`summary.txt`, the commands in `checks14.sh`): the image, the host suites of the
  crates #1252 touched, every kernel clippy shape of `build/clippy.rs`, and clippy on `toyos`, the libraries and the
  ABI. Each log ends with its exit; all exit 0.
- `fix/kcheck.log`: `cargo check -p kernel --target x86_64-unknown-none` with the `get_sent` change, before the commit.
