# scratch: count near-white pixels in a box below-right of a pointer position on a PPM
import sys
d=open(sys.argv[1],'rb').read(); parts=d.split(b'\n',3); w,h=map(int,parts[1].split()); px=parts[3]
x0,y0,n=int(sys.argv[2]),int(sys.argv[3]),int(sys.argv[4])
c=0
for y in range(max(0,y0-4),min(h,y0+n)):
  for x in range(max(0,x0-4),min(w,x0+n)):
    i=(y*w+x)*3
    if min(px[i:i+3])>=0xe0: c+=1
print(sys.argv[1].rsplit('/',1)[1], w, h, 'near-white px in box at', x0, y0, ':', c)
