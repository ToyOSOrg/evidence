import sys,struct
data=open(sys.argv[1],'rb').read(); sig=sys.argv[2].encode(); base=int(sys.argv[3],16)
i=0
while True:
    i=data.find(sig,i)
    if i<0: break
    ln=struct.unpack_from('<I',data,i+4)[0]
    if 36<=ln<65536 and sum(data[i:i+ln])%256==0:
        print(hex(base+i), ln, data[i+8]); open(sys.argv[4],'wb').write(data[i:i+ln])
    i+=1
