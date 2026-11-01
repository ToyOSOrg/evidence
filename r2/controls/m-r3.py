import sys
p=sys.argv[1]; s=open(p).read()
a="""        let answer = f(pages, object, &mut |phys| held.give_back(job, *gone, phys, true));"""
b="""        let mut frames = alloc::vec::Vec::new();
        let answer = f(pages, object, &mut |phys| frames.push(phys));
        for phys in frames {
            held.give_back(job, *gone, phys, true);
        }"""
assert a in s; open(p,'w').write(s.replace(a,b,1))
