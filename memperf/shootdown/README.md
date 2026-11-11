# #1267: a user change asks each CPU running the space for its range

`checks-cf96bb979/` holds one script's run at the PR head, in a build slot on an aarch64 macOS host. `exits.txt` gives each command's exit code and time.

- `loom-models`: `cargo test -p kernel-loom --test tlb_shootdown --test counters_round --test tlb_tags`, exit 0. `tlb_shootdown` ran 12 models.
- `control-*`: each negative control, as `cargo test -p kernel-loom --features <control> --test <model>`. Every one is red (exit 101), and each log names the models that failed.
  - `shootdown-take-relaxed`, `shootdown-ask-range-late`, `shootdown-ask-stale-answers` and `shootdown-ask-many-as-one` are new.
  - `shootdown-serve-relaxed` and `shootdown-served-relaxed` existed and still red.
- `kernel-lib`: `cargo test -p kernel --lib --features sched-check`, 459 passed.
- `clippy-*`: the kernel's CI shapes, with the adopted lints and `-D warnings`, each exit 0:
  - the host library with tests;
  - x86-64 plain, with the actuators, and with every instrument;
  - aarch64;
  - kernel-loom, plain and with every shootdown control.
- `build-tests`: `toyos-build`'s `every_model_control_is_run`.

An earlier run at the first commit (7cdb5552d) failed `clippy-x86` on an unused hint, `Asks::owed`. The PR head removes it.
