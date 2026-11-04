#!/usr/bin/env python3
"""benchnodata.py <tree>: MEASUREMENT ONLY. benchcase runs the system and ipc groups alone, so no row reads DATA."""
import sys, pathlib
p = pathlib.Path(sys.argv[1], "tests/images/benchcase.toml"); s = p.read_text()
old = '''    "osbench_boot",
    "osbench_identity",
    "osbench_system",
    "osbench_sched",
    "osbench_fair",
    "osbench_files",
    "osbench_ipc",
    "osbench_net",
    "osbench_procs",
    "osbench_mem",
    "osbench_time",
    "osbench_work",
    "osbench_tail",
    "osbench_nvme",
    "osbench_persist",
    "osbench_crunch",
    "reboot",'''
assert s.count(old) == 1
s = s.replace(old, '''    "osbench_boot",
    "osbench_identity",
    "osbench_system",
    "osbench_ipc",
    "reboot",''')
p.write_text(s); print("ok")
