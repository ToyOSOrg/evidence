import sys,struct
d=open(sys.argv[1],'rb').read(); i=36
while i<len(d):
    t,l=d[i],d[i+1]
    if t==0:
        fl,par,pid,n=struct.unpack_from('<IIII',d,i+4); res=struct.unpack_from('<%dI'%n,d,i+20)
        print(f"{i:#05x} node flags={fl:#x} parent={par:#x} id={pid} res={[hex(r) for r in res]}")
    elif t==1:
        fl,nxt,size,sets=struct.unpack_from('<IIII',d,i+4); att=d[i+21]
        print(f"{i:#05x} cache len={l} flags={fl:#x} next={nxt:#x} size={size} type={(att>>2)&3}")
    else: print(f"{i:#05x} type {t} len {l}")
    i+=l
