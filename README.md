# Evidence for ToyOS PR #1139: the kernel's memcpy by page distance

kmemcpy/round-1/
- distance-probe/: a measurement-only kernel memcpy probe (probe.patch on 190f3b164) under QEMU,
  osbench system, ipc and files; analysis.txt is analyse.py over console.log. The segments are
  labelled by the last TEST_END before each dump: "boot" = boot + osbench_system,
  "after osbench_system" = osbench_ipc, "after osbench_ipc" = osbench_files.
- host/: host CI at 42fb86902 (exit in ci-host.exit), kernel-copies under x86-64 (Rosetta), the
  three mutation controls with their patches and logs, the image build.
- qemu-head/: kcopyat_runs on kernel-memcpy-ab head dc535330f (kcopyat and files exit 0, every read
  and copy checked against its source).
- ab/: the metal A/B rule stated before the run, the measurement module and the image checksums.
