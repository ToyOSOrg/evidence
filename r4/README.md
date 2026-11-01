# PR #1125 r4: review r2's checks, and the B-arm rerun

## Review r2, at display-stage1 364c8aa6a

- `ci-host-tail.txt`: `cargo run -- --ci host`, exit 0, 107 steps green.
- `kernel::rmrr` host tests: 10 pass. They cover:
  - one endpoint;
  - two endpoints;
  - a sub-hierarchy;
  - an unknown scope (an unfollowable path, a kind-5 scope or a malformed list, each of which resolves to `Unknown`);
  - a class that is neither display nor USB;
  - a region that is not whole pages;
  - overlapping RMRRs of two functions;
  - duplicate and overlapping RMRRs of one function;
  - the leaf split across a 2 MiB boundary.
- Negative controls, each a checked mutation restored in the same run (exit 101 each):
  - `mutation-rmrr-unknown.log`: an `Unknown` scope that does not mark the region shared fails `an_unknown_scope_beside_an_endpoint_refuses_it`;
  - `mutation-rmrr-overlap.log`: "alone" judged over a function's own regions only fails `overlapping_regions_of_two_functions_refuse_both`.
- `qemu-claims-r2.log`: `the_compositor_drives_the_virtio_gpu`, exit 0. Its claims cross VT-d, but QEMU's `intel-iommu` publishes no RMRR.
- **4 KiB pages:** `kernel::rmrr::leaves`'s split is host-tested. `table::put_4k`, which writes them, is established by inspection only: the T14's range is 2 MiB-aligned, so no planned machine runs it.

## B-arm rerun on the T14

- Revision `display-stage1-ab` d0dc7c34a: review r1's classification, before r2's whole-DMAR rework.
- Image sha256 a8f0d1ec8e2f8b66ae2e92a7af451a984ad054ed0bc5312a4863f583b196df0c. Exit 0, 228 s, verdict passed.
- Lines: `displayenergycase-lines.txt`.

Against the reviewer's list:

- `iommu: rmrr0 is 00:02.0's alone, kept in its own domain`
- `iommu: domain3 keeps 00:02.0's reserved 0x9c000000..0xa0800000 at its own address`, then `iommu: 00:02.0 moves to domain3`.
- No NOT HANDED OVER line, no NotIsolated, no fault record.
- `tgl-display: plane 1 1920 px wide, totals 2080x1112, 682 blocks, at 138731 kHz; latencies 3 [54 ×4, 73, 110, 115] us, SAGV block 11 us`
- WM levels went from `80004011 00004011 00004007 ×6` to `80004011 80010041 ×4 80014051 80020081 80020081`, the same words as before r1.
- Idle PC2 346 ‰ and PC3 648 ‰, within the exit (PC2 ≤ 400 ‰, PC3 ≥ 600 ‰). The 10 ms sleeper drew 2646 mW, against A's 2860 at bb1f335f7.

On the T14 the RMRR has one endpoint scope, so r2's classification cannot differ there. This boot still checks the claim path that r2 leaves unchanged.

Paths are masked. Only extracted lines are published: the raw log carries a MAC and partition GUIDs.
