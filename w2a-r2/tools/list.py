import sys,struct
def frames(p):
    d=open(p,'rb').read()
    magic,=struct.unpack('<I',d[:4]); assert magic==0xa1b2c3d4, hex(magic)
    lt,=struct.unpack('<I',d[20:24]); off=24; i=0
    while off<len(d):
        ts,tu,incl,orig=struct.unpack('<IIII',d[off:off+16]); rec=d[off+16:off+16+incl]; off+=16+incl
        yield i,lt,ts,tu,rec; i+=1
for p in sys.argv[1:]:
    print(p)
    for i,lt,ts,tu,rec in frames(p):
        rl,=struct.unpack('<H',rec[2:4]); f=rec[rl:]
        fc=f[0]; t=(fc>>2)&3; st=fc>>4
        a1=f[4:10].hex(':'); a2=f[10:16].hex(':')
        kind={(0,8):'beacon',(0,0):'assocreq',(0,1):'assocresp',(0,11):'auth',(0,4):'probereq',(0,5):'proberesp',(0,13):'action'}.get((t,st),f't{t}s{st}')
        if t==2:
            body=f[24+(2 if st&8 else 0):]
            if body[:8]==bytes.fromhex('aaaa03000000888e'): kind='EAPOL '+body[8:8+7].hex()
            elif f[1]&0x40: kind='protected data'
        if kind!='beacon' or i<3: print(i,kind,a1,a2,len(f),'radiotap',rl)
