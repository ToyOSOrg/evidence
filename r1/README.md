# ToyOS #1143 r1: the ramp exit's first T14 session

The session was Linux (L1), ToyOS t1 at 4f52c3056 (image sha256 in image-sha256.txt), Linux (L2). Every run exited 0, and t1's harness verdict was `passed`.

- `toyos-t1-lan-lines.txt`: t1's osbench lan lines (an excerpt; the boot log holds network identifiers). The group was refused with `no netstack link holds 10.0.2.15`.
- `linux-{1,2}-upload-row.txt`: each Linux run's `lan.wired.tcp.upload` row, with per-round marks.
- `judge-t1.log`: judge.py (pr-1138 r1) exited 1, because t1 has no upload row.
- `request.txt`: the request and its decision rule, set before the run.
