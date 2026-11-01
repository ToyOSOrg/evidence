# Writes a rekey fixture from capture r2: the RSNEs and addresses from air.pcap, then the
# station log's EAPOL-Key frames and keys in their order.
import sys,struct,re
pcap,log,pr,ar,out=sys.argv[1],sys.argv[2],int(sys.argv[3]),int(sys.argv[4]),sys.argv[5]
d=open(pcap,'rb').read(); off=24; recs=[]
while off<len(d):
    incl,=struct.unpack('<I',d[off+8:off+12]); recs.append(d[off+16:off+16+incl]); off+=16+incl
def mpdu(i):
    r=recs[i]; return r[struct.unpack('<H',r[2:4])[0]:]
def elements(body):
    e={}; i=0
    while i+2<=len(body):
        e.setdefault(body[i],body[i:i+2+body[i+1]]); i+=2+body[i+1]
    return e
p=mpdu(pr); a=mpdu(ar)
pe=elements(p[24+12:]); ae=elements(a[24+4:])
lines=[f"aa {p[10:16].hex()}",f"spa {a[10:16].hex()}",f"beacon_rsne {pe[48].hex()}",f"own_rsne {ae[48].hex()}"]
for k,name in ((244,'beacon_rsnxe'),):
    if k in pe: lines.append(f"{name} {pe[k].hex()}")
if 244 in ae: lines.append(f"own_rsnxe {ae[244].hex()}")
pat=re.compile(r"(RX EAPOL-Key|TX EAPOL-Key|WPA: PTK|WPA: Group Key|: IGTK) - hexdump\(len=\d+\): ([0-9a-f ]+)$")
tags={"RX EAPOL-Key":"rx","TX EAPOL-Key":"tx","WPA: PTK":"ptk","WPA: Group Key":"gtk",": IGTK":"igtk"}
for l in open(log):
    m=pat.search(l.rstrip("\n"))
    if m: lines.append(f"{tags[m.group(1)]} {m.group(2).replace(' ','')}")
open(out,'w').write("\n".join(lines)+"\n")
