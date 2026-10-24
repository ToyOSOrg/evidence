import sys,re
for f in sys.argv[1:]:
    t=[];b=0;n=0
    done=''
    for line in open(f,errors='replace'):
        m=re.search(r'MEASURE_ARRIVAL us=(\d+) bytes=(\d+) .*console-flood i=',line)
        if m: t.append(int(m.group(1))); b+=int(m.group(2)); n+=1
        if 'MEASURE_DONE' in line: done=line.strip()[line.find('MEASURE_DONE'):][:160]
    span=(t[-1]-t[0]) if len(t)>1 else 0
    per=(span/b) if b else 0
    g=re.search(r'in (\d+) us',done)
    gus=int(g.group(1)) if g else 0
    print(f"{f.split('/')[-1]}: lines={n} bytes={b} host_span_us={span} host_us_per_byte={per:.3f} guest_loop_us={gus} guest_us_per_byte={gus/(n and b/n*380 or 1):.3f}")
