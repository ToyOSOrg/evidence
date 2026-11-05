# #1181 round 2: T14 boots (images built at ToyOS 2d86471a9)

The orchestrator ran the staged images (round 1's `metal-request.txt`) on the T14: both driver runs rc=0, both verdicts `passed`. `runner.log` is its runner log.

`metal-judge.log` holds the judgement: the staging command (`cargo test --test toyos-build -- --metal --metal-readback <scratch>/metal app_view std_fs hierarchy_paths state_view`) re-run at 1d470454a with the readbacks in place. Exit 0: "5 passed, 0 failed, 2 boot(s)", namely `app_view` on proctreecase and the testcases members `std_fs`, `std_fs_write`, `hierarchy_paths` and `state_view`. The heads after 2d86471a9 change only `issues/`.

`proctreecase/kernel.log` carries app_view's /tmp arms: "the app's /tmp write is in /tmp/apps/appview", "its /tmp lists only what it wrote" and "every arm held".

Disk images are not published. Paths, machine vendor, product and BIOS, ACPI OEM strings, partition GUIDs and the NVMe identifier are masked.
