# Judge rule for torn superblock copies (design §3.4 as amended), and the writer's named refusals

**Revision:** head `1172d82a58397a3f1c43c7703fa3dc7fe646b866`. Its engine code matches round 1's `3d743e72d`, except the `writable` refusal messages.

## judge/

**The verdict.** `guest/lib.sh` adds `judge_torn` beside `judge`. A crash image passes when:
- fsck's status is 0;
- its only marker is "checksum error";
- every checksum-error line names a superblock copy ("primary superblock unreadable" is the first copy, "sb @ N" is copy N);
- that copy is the one the crash point lies inside;
- every other copy is whole.

Anything else fails. That includes a checksum error on any copy the crash point is not inside, or on anything that is not a superblock copy.

**The harness side.** `dump_b5d.rs` records, for each crash image, the writes pending since the last flush, which is what a crash can tear. It writes a sidecar, `sidecars/<image>.torn`, with three lines:
- `copies`: the layout's copies, by sector;
- `inflight`: the copy whose 64 KiB space a pending write overlaps;
- `whole`: the copies whose bytes decode with a valid checksum.

All 39 regenerated images are byte-identical to the round-1 images judged before (`regen-vs-judged-r1.txt`).

**`judge4-run-d.log`:** all 36 empty-journal crash states pass, including the 10 that failed under the unamended rule. Each of the 10 has its torn copy at the crash point: 8, 2056 or 63488.

**Controls**, each a clean volume with one copy's byte flipped:
- `ctl-torn-inflight`: the primary torn, with the crash inside it. **PASS**: the rule admits what it should.
- `ctl-torn-elsewhere`: copy 2056 torn, with the crash inside the primary. **FAIL**, as required.
- `ctl-torn-none-pending`: the primary torn, with no write pending. **FAIL**.

The zero-accounting volumes still pass under `judge`, and so does their FUSE continuation.

## host/, controls/

The writer's refusals now have their own names:
- "writing a volume of blocks under 4 KiB";
- "writing a volume of btree nodes under 16 KiB";
- one for nodes or buckets that are not whole blocks or nodes.

Each refusal is tested in `mount::small_blocks_and_a_journal_position_off_a_block_are_refused`. Its two controls (`f-geometry-unchecked`, regenerated, and `f-node-floor-unchecked`) are red. `cargo test -p bcachefs` and clippy exit 0.
