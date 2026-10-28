import sys,re
def load(path):
    group=None; out={}
    for line in open(path,errors='replace'):
        m=re.search(r'osbench v=2 os=toyos group=(\S+) start',line)
        if m: group=m.group(1); continue
        m=re.search(r'osbench v=2 os=toyos bench=(\S+) unit=(\S+) (.*)',line)
        if m and group:
            kv=dict(x.split('=',1) for x in m.group(3).split() if '=' in x)
            out[(group,m.group(1))]=(m.group(2),kv)
    return out
