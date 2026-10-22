import sys
p=sys.argv[1]; s=open(p).read()
a='''    if read.is_ok() {
        reader.join().expect("supervisor: the bootstrap reader panicked");
    }'''
assert a in s
s=s.replace(a,'''    drop(reader);''')
open(p,'w').write(s)
