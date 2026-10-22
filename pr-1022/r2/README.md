# Round 2: the lane kernels' extra block

- `linux-7a1101024/`: the r1 binaries run on the benches' Linux 6.8 (T14: i5-1135G7; AMD bench:
  Ryzen 7 4800U). The commit's `lanes_match_one_block_at_a_time` failed at line 211 on both, the
  "n lanes write only their blocks" check: for three lanes the AVX2 kernel stored both pairs and
  the AVX-512 kernel the whole quad. Lane values matched. m1 failed as expected. m2 failed on the
  T14 as expected. On the AMD bench it failed only because the base did.
- `linux/`: README and hashes of the rebuilt binaries at b396df40f (the fix; fb9b8eeca differs
  from it only in one doc comment's line wrapping) and its two mutants, with their runs on both benches. The commit passes 7/7 on both. m1 fails
  on both. m2 fails on the T14 (`lanes_match_…` and `dispatched_streams_…`, the quad's `xor` tail)
  and passes on the AMD bench, which has no AVX-512. The pre-fix runs above are the fix's negative
  control. The branch was later reworded without a tree change: d9dd4b991 has fb9b8eeca's tree.
- `t14-m11c-ab1c7283d/`: the T14 probe boot of ab1c7283d (#1022 at 7a1101024 plus probe rows),
  verdict and rows. It ran with the defect, which only added one 64-byte store to three-block
  calls (seal 65 to 128 B); `agrees_with_ring_at_every_length` passed. Its M12 rows time the
  AES-NI kernels, not the VAES-512 kernel the T14 ships.
