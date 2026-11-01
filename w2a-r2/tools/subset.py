# Copies the pcap's global header and the records at the given indices, unchanged.
import sys,struct
src,dst=sys.argv[1],sys.argv[2]; want=set(map(int,sys.argv[3:]))
d=open(src,'rb').read(); out=bytearray(d[:24]); off=24; i=0
while off<len(d):
    incl,=struct.unpack('<I',d[off+8:off+12]); rec=d[off:off+16+incl]
    if i in want: out+=rec
    off+=16+incl; i+=1
open(dst,'wb').write(out)
