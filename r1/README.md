# PR #1073 round 1: deep idle

Branch `deep-idle`, head named in each log's `.rev`.

- `m1/`: #875's check outside the tree, extended (`cst-check-main.rs`, its
  `Cargo.toml`; paths masked), run on the T14's and the AMD bench's table
  dumps, which stay out of every repository.
  - `summary-t14.txt`, `summary-amd.txt`: the server's own `cst::processors`
    and `cst::declare` under ToyOS's claims, and what each processor's
    declaration holds.
  - `claims-sweep-*.txt`: each processor `_OSC` claim set, committed with no
    query and queried then committed with the offer, and the `_CST`, `_CSD`
    and `_LPI` each yields, whole (the design's M1).
- `mutations/`: each mutation as a patch, the log of the host tests it ran
  against, and `summary.txt` with each one's exit code and failing tests.
  Every patch was checked, applied, run and restored in one loop.
- `ci-host.log`: `cargo run -- --ci host` at the head its `.rev` names.

Linux's sysfs readings on both benches (`cpuidle.txt`) were used as a
black-box comparison for the dumps' `_CST` only.
- `soundserver-host.log`, `acpiserver-host.log`: those suites again at the
  head their `.rev` names, after the last two changes, which touched only
  those programs.
- `qemu-1.log`: `hda_plays_to_the_controller_that_reaches_an_output` and
  `acpi_press_is_one_sci` on QEMU at `qemu-1.rev`. QEMU 11.1.1's q35 declares
  no `_CST` (`lib/acpi/fixtures/qemu-11.1.1`), so these exercise the
  declaration's absence and soundserver's hold, not a deep state.
- `metal/request.txt`: the staged T14 and AMD boots (A control, B branch,
  M the always-deepest negative control, `mutations/always-deepest-metal.patch`);
  nothing was run on a machine.
