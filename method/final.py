import json, sys, re
O=sys.argv[1]
rows=json.load(open(f'{O}/rows.json'))
FSRTT='a-file-server-request-costs-three-to-twelve-times-a-kernel-file-call (#1097)'
def own(n):
    b=n.split('@')[0]
    R=[
     (r'^fs\.disk\.seq_read', 'a-sequential-read-of-a-file-as-large-as-datas-clean-cache-reads-the-disk (#1097)','fs-rtt'),
     (r'^fs\.disk\.seq_write', 'unrecorded: the file server\'s write copy','fs-rtt'),
     (r'^fs\.disk\.', FSRTT,'fs-rtt'),
     (r'^fs\.mem\.readdir', 'a-listing-still-scans-the-whole-mount','NONE (kernel tmpfs)'),
     (r'^fs\.mem\.seq_', 'user-memory-hot-paths-are-slower-than-2-mib-pages (as fs.tmp.*)','NONE (kernel user copy)'),
     (r'^fs\.mem\.', 'unrecorded: kernel tmpfs per-call cost','NONE (kernel tmpfs)'),
     (r'^persist\.fsync_clean', 'a-clean-fsync-on-data-writes-the-superblock-and-flushes-the-disk (#1097)','disk-path'),
     (r'^persist\.create_fsync_unlink', 'a-created-fsynced-and-unlinked-file-costs-toyos-more-than-linux (#1097)','disk-path'),
     (r'^persist\.seq_read_cached', 'unrecorded: the file server\'s read copy','disk-path / fs-rtt'),
     (r'^persist\.', 'toyos-durable-writes-on-the-t14s-nvme-took-1-to-6-ms-across-two-boots (#1097; the T14\'s slow boots)','disk-path'),
     (r'^(proc\.|process\.|thread\.)', 'unrecorded: spawn and thread creation','NONE'),
     (r'^work\.build_shaped', 'idle-cpus-enter-the-c-states-cst-names (names j1 only); otherwise unrecorded','NONE'),
     (r'^pipe\.throughput', 'user-memory-hot-paths-are-slower-than-2-mib-pages (the copies)','ipc-events'),
     (r'^ipc\.reqrep\.(4096|65536)', 'user-memory-hot-paths-are-slower-than-2-mib-pages (the copies)','ipc-events'),
     (r'^ipc\.', 'unrecorded: small-message round trip','ipc-events'),
     (r'^wake\.onto_busy', 'an-ordinary-wake-posted-on-its-own-cpu-waits-for-that-cpus-next-pass','sched-place'),
     (r'^wake\.', 'unrecorded','sched-place'),
     (r'^pingpong\.pipe', 'unrecorded (no-published-run lists the row only)','sched-place / ipc-events'),
     (r'^pingpong\.', 'unrecorded','sched-place'),
     (r'^fair\.', 'unrecorded','sched-place'),
     (r'^mem\.(map_unmap_4k|first_touch|map_touch_unmap|anon)', 'user-memory-hot-paths-are-slower-than-2-mib-pages','NONE (memory)'),
     (r'^mem\.munmap_touched_remote', 'unrecorded (no-published-run lists the row only)','NONE (memory)'),
     (r'^mem\.', 'unrecorded','NONE (memory)'),
     (r'^time\.now', 'unrecorded: a clock-page read costs more than the vDSO\'s','clock'),
     (r'^crunch\.', 'toyos-uses-what-modern-hardware-offers-for-speed','power'),
    ]
    for pat,rec,ag in R:
        if re.match(pat,b): return rec,ag
    return 'unrecorded','NONE'
AREA_ORDER=['cpu','scheduler','process/thread','memory','ipc','network','clock','disk','fs']
def fmt(v):
    try: return f'{float(v):,.0f}'
    except: return v
out=[]
out.append('# ToyOS against Linux, current state, 2026-10-28\n')
out.append('Labelled current-state comparison: ToyOS at 069cbbeb8 (#1097, code-identical to its landing head) against each bench\'s Ubuntu 24.04 (Linux 6.8.0-147) as installed. Per bench: 4 ToyOS benchcase boots off the internal NVMe and 5 Linux `osbench all` runs, interleaved L T L | T L | T L | T L, every ToyOS readback judged EXIT=0. A row\'s value is each run\'s p50; the exact two-sided Mann-Whitney test at 0.05 over 5 against 4 runs (least p 2/126) says whether it resolves. Each p is its row\'s alone: about 1.6% of rows resolve by chance with no difference anywhere. The full tables are `t14-compare.md` and `amd-compare.md`.\n')
out.append('Caveats that bear on reading it:\n- The AMD\'s Linux chose `clocksource=tsc` in 3 runs and `hpet` in 2, as booted. Each HPET timestamp costs 1.2 µs, so its per-operation rows have wide Linux spreads. Their medians are the TSC runs\'.\n- Linux runs its distribution\'s governor (T14 `powersave`, the same HWP request ToyOS makes; AMD `schedutil`). This is the baseline, not the matched-request experiment.\n- `persist` and `fs.disk` run on each system\'s filesystem on the same NVMe (ext4 against ToyOS DATA).\n')
for bench,label in [('t14','T14 (i5-1135G7, SK hynix BC501)'),('amd','AMD bench (Ryzen 7 4800U, Samsung MZVLB1T0)')]:
    R=[r for r in rows[bench] if not r['name'].startswith('cpu.clock')]
    measured=[r for r in R if r['worse'] is not None]
    worse=[r for r in measured if r['worse']>1.0]
    rw=[r for r in worse if 'ToyOS worse' in r['verdict']]
    rb=[r for r in R if 'ToyOS better' in r['verdict']]
    out.append(f'\n## {label}\n')
    out.append(f'{len(R)} rows besides `cpu.clock`. {len(measured)} have a direction and both systems\' values. ToyOS resolves **worse in {len(rw)}** and **better in {len(rb)}**. It reads worse but unresolved in {len(worse)-len(rw)}.\n')
    out.append('\n### Every row where ToyOS loses, by area and size\n')
    out.append('| area | row | unit | ToyOS p50 (range) | Linux p50 (range) | ToyOS worse by | resolves | owning record | agent |')
    out.append('|---|---|---|---|---|---|---|---|---|')
    for a in AREA_ORDER+sorted({r['area'] for r in worse}-set(AREA_ORDER)):
        for r in sorted([r for r in worse if r['area']==a],key=lambda r:-r['worse']):
            rec,ag=own(r['name'])
            out.append(f"| {a} | `{r['name']}` | {r['unit']} | {fmt(r['tmed'])} ({r['trange']}) | {fmt(r['lmed'])} ({r['lrange']}) | {r['worse']:.2f}x | {'yes' if 'ToyOS worse' in r['verdict'] else 'no'} | {rec} | {ag} |")
    out.append('\n### Where ToyOS resolves better\n')
    out.append(', '.join(f"`{r['name']}` ({1/r['worse']:.2f}x)" if r['worse'] else f"`{r['name']}`" for r in sorted(rb,key=lambda r:(r['worse'] or 1))))
    out.append('')
open(f'{O}/SCOREBOARD.md','w').write('\n'.join(out)+'\n')
# summary for the report
for bench in ['t14','amd']:
    worse=[r for r in rows[bench] if r['worse'] and r['worse']>1.0 and not r['name'].startswith('cpu.clock')]
    unc=[r for r in worse if own(r['name'])[1].startswith('NONE')]
    print(bench,'uncovered',len(unc),[ (r['name'],round(r['worse'],2),'R' if 'ToyOS worse' in r['verdict'] else 'u') for r in sorted(unc,key=lambda r:-r['worse'])])
