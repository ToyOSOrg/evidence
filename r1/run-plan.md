# osbench energy: run plan (revision 93317a104de7671430865049063d52f8740cadc4)

Both halves are from one revision. Linux binary: `linux/osbench`,
sha256 6a06b6b530db9491ff9d02c2b7e29c69ed624f2c63efa0768355ca9512d96402.

## Round 1: validation (one boot and one Linux run per bench)

T14 (`metal-t14/request.txt`): boot `energybenchcase` (the `osbench_energy`
row) and `testcases` (the `counters` row and `test_rs_counters_read`).
`shared-debug` (`test_rs_counters_silent`) is not needed: the filter took it
in by name.

AMD (`metal-amd/request.txt`): boot `energybenchcase`.

Linux, each bench, before or after its ToyOS boot:

    scp linux/osbench <bench>:/tmp/osbench
    # T14: ssh over the I219 stays up; radios blocked for the run.
    ssh <t14> 'sudo modprobe msr; sudo rfkill block all; sudo /tmp/osbench energy </dev/null; sudo rfkill unblock all' > linux-t14-energy-1.txt
    # AMD: its one link is Wi-Fi, so the run is a unit that outlives the session.
    ssh <amd> "sudo modprobe msr; sudo systemd-run --unit=osbench-energy sh -c 'rfkill block all; /tmp/osbench energy </dev/null >/tmp/energy.txt 2>&1; rfkill unblock all'"
    # about 4 minutes later, once the Wi-Fi is back:
    ssh <amd> 'cat /tmp/energy.txt' > linux-amd-energy-1.txt

Both: on AC, panel lit and console unblanked (no DPMS blank), nothing else
running. The T14 Linux governor stays as installed (the baseline).

## Round 2: the scoreboard (once round 1 reads right)

Four ToyOS boots of `energybenchcase` and four Linux runs per bench,
interleaved Linux, ToyOS, Linux, ToyOS. Each ToyOS boot is its own readback
directory: the same image, `--readback <dir>-<k>`. Then:

    cargo run -p osbench-compare -- linux-<bench>-energy-*.txt <readback>-*/kernel.log
