# B6 analyst question 1: a crash state whose newest journal entry is torn

**Observed** (B6 judge, bcachefs-tools v1.39.4, `bcachefs fsck -n -K < /dev/null`, in B2's VM):

The image is `pressure-05.img`, sha256 in `b6/judge/SHA256SUMS`. It is a raw crash state of a ToyOS read-write mount, unencrypted, 64 MiB, with 32 KiB journal buckets, the journal at device bucket 65, 16 buckets.
- Entries 1–8 are whole flush entries, in ring buckets 0 and 1. Each has last_seq equal to its own seq.
- Entry 9, in ring bucket 2 at offset 0 (16 sectors), is torn. Its header sector (seq 9, last_seq 9) is the new one, some later sectors are zero, and its checksum fails.
- The superblock is not clean, and there is no blacklist.

Upstream printed:

```
recovering from unclean shutdown
journal read done, but no entries found after dropping non-flushes, not fixing
no journal entries found, not fixing
```

It then ran at 100 % CPU, with 4 GB resident, for 52 minutes, until I stopped it (exit 143). Neighbouring crash states of the same run, whose newest entry is whole, pass (exit 0, no marker). ToyOS replays this image to entry 8 per A2.13 step 2, and its fsck finds nothing.

**Questions:**
1. In v1.39.4's journal read, when the highest-sequence entry is a flush entry whose checksum fails, is that entry's header last_seq used to drop older entries before the entry itself is skipped as torn? Or does something else make entries 1–8 count as non-flush or not found here? Which condition produces "no entries found after dropping non-flushes" for this layout?
2. What does fsck do after "no journal entries found, not fixing" on a volume marked unclean? Is the 52-minute spin a known loop?
3. Is there a writer rule that keeps a torn newest entry recoverable by upstream? For example, a minimum distance between an entry's last_seq and its seq, or a bucket boundary. Or must the newest entry's header last_seq never exceed the newest durable entry's?

Needed for B6's judge verdict on raw crash states. It may reopen A2.13.

**Reproduced** at head `ef28b4e80`. Regenerated with a distinct random stream per mount, `pressure-05.img` (judge round 1, sha256 in `b6/judge/SHA256SUMS`) has the same layout: entries 1–8 whole, and entry 9 torn at ring bucket 2, offset 0. Upstream printed the same two lines, and `timeout 900` ended it (exit 124). Every other raw and replayed crash state of both pressure runs passes: 31 of the 32 unencrypted, and all 24 encrypted. The round-0 image is kept as `b6/judge/held/pressure-05.img`, sha256 15a4fa5c56e6b37d9426c0be5bd236578e9e0d0678fb8047f0f853d7644c0b4f.
