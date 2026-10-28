Judged with `cargo test --test toyos-build -- --metal --metal-readback judge/<run> <row>` from tcp-connect at 46848c491: all exit 0, 1 passed.
connect p50/min ms: base-net-1 2.03/1.79, base-net-2 2.99/1.85; head-net-1 (1f828f331) 2.56/1.75, head-net-2 2.93/1.97; linux-lan-1 1.15/0.90, linux-lan-2 1.94/1.11
upload p50 MB/s: base 39/36, head 40/39, linux 112/112 (main lacks #1069's TX ring)
download p50 MB/s: base 114/114, head 114/111, linux 110/111
pipe.throughput p50 MB/s base-bench (544f9cc3c): 64:85 256:336 1024:1165 4096:2717 16384:4393 65536:6930
