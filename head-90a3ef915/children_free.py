import sys
p=sys.argv[1]
s=open(p).read()
a='''    for (int i = 0; i < MAX; i++) {
        int ends[2];'''
assert a in s
s=s.replace(a,'''    for (int i = 0; i < MAX; i++) {
        if (i % 50 == 0) {
            printf("MEASURE held=%d\\n", i);
            fflush(stdout);
            system("/system/bin/toybox free");
        }
        int ends[2];''',1)
open(p,'w').write(s)
