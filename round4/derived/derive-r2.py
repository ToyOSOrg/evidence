import re, sys
M = sys.argv[1]
pat = re.compile(r'scout_tlb: k=(\d+) pages rt_cycles min=(\d+) p50=(\d+) max=(\d+) .*?parent pmc/rt \[(.*?)\] \| child pmc/rt \[(.*?)\]')
def read(path):
    rows = {}
    for line in open(path):
        m = pat.search(line)
        if m:
            k = int(m.group(1))
            par = [float(x.strip().strip('"')) for x in m.group(5).split(',')]
            chi = [float(x.strip().strip('"')) for x in m.group(6).split(',')]
            rows[k] = dict(mn=int(m.group(2)), p50=int(m.group(3)), mx=int(m.group(4)), par=par, chi=chi)
    return rows
pairs = {
 'AMD scout_tlb_base (round 2)': (M+'/base-amd/scout-tlb-base/kernel.log', M+'/scout-amd/scout-tlb-base/kernel.log'),
 'T14 scout_tlb_base (round 2)': (M+'/base-t14/scout-tlb-base/kernel.log', M+'/scout-t14/scout-tlb-base/kernel.log'),
}
old = {
 'AMD scout_tlb_base': (M+'/base-amd/scout-tlb-base/kernel.log', M+'/amd2/scout-amd/scout-tlb-base/kernel.log'),
 'T14 scout_tlb_base': (M+'/base-t14/scout-tlb-base/kernel.log', M+'/scout-t14/scout-tlb-base/kernel.log'),
 'T14 scout_tlb_nopcid': (M+'/base-t14/scout-tlb-nopcid/kernel.log', M+'/scout-t14/scout-tlb-nopcid/kernel.log'),
}
for name, (b, h) in pairs.items():
    B, H = read(b), read(h)
    print('==', name)
    for k in sorted(B):
        x, y = B[k], H[k]
        disjoint = x['mx'] < y['mn'] or y['mx'] < x['mn']
        d = y['p50'] - x['p50']
        print(f"k={k:2d} base p50={x['p50']} [{x['mn']}-{x['mx']}] head p50={y['p50']} [{y['mn']}-{y['mx']}] "
              f"delta={d:+d} ({100*d/x['p50']:+.2f}%) head/base={y['p50']/x['p50']:.4f} 0.98xbase={0.98*x['p50']:.1f} disjoint={disjoint}")
        if name.startswith('AMD'):
            for tag, r in (('base', x), ('head', y)):
                fw = r['par'][1]+r['par'][3]+r['chi'][1]+r['chi'][3]
                l1d = r['par'][0]+r['chi'][0]; l2d = r['par'][1]+r['chi'][1]; l2i = r['par'][3]+r['chi'][3]
                print(f"      {tag}: L1dTLB {l1d:.2f} L2dTLB {l2d:.2f} L2iTLB {l2i:.2f} full walks {fw:.2f}")
        else:
            for tag, r in (('base', x), ('head', y)):
                w = sum(r['par'][:3]) + sum(r['chi'][:3])
                print(f"      {tag}: itlb parent {r['par'][2]:.2f} child {r['chi'][2]:.2f}  walks(3 ctrs, both) {w:.2f}  pending cyc {r['par'][3]+r['chi'][3]:.2f}")
# tlb_shootdown_cost, the latencycase boots' `tlb: bench` line.
for bench in ('amd', 't14'):
    for arm in ('base', 'scout'):
        for line in open(f"{M}/{arm}-{bench}/latencycase/kernel.log"):
            if 'shootdowns across' in line:
                print(f"tlb_shootdown_cost {bench} {arm}: {line.strip()}")
