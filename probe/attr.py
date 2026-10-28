import sys, re, statistics as st
rows = [dict(re.findall(r"(\w+)=(\d+)", l)) for l in sys.stdin]
k = lambda n: st.median(int(r[n]) for r in rows)
forced = k("forced_flushes"); fl = k("dev_flushes"); per = k("dev_flush_us") / fl
print(f"rounds {len(rows)} (8 MiB each, 1 MiB writes), medians:")
print(f"  server WRITE handling {k('server_write_us')/1000:.1f} ms (alloc {k('vol_alloc_us')/1000:.1f}, cache copy {k('vol_copy_us')/1000:.1f})")
print(f"  fsync {k('fsync_us')/1000:.1f} ms, of which the cache flush {k('cache_flush_us')/1000:.1f}")
print(f"  device Flushes {fl:.0f} ({forced:.0f} forced by a full arena), {per/1000:.2f} ms each, {k('dev_flush_us')/1000:.1f} ms")
print(f"  device writes {k('dev_writes'):.0f} requests for {k('cache_flush_blocks'):.0f} blocks, {(k('dev_write_us')-forced*per)/1000:.1f} ms without the forced Flushes timed inside them")
