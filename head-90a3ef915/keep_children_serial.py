import sys
p=sys.argv[1]; out=sys.argv[2]
s=open(p).read()
a='''        let result = qemu.run_test(&job, BOUND);
'''
assert a in s
s=s.replace(a,a+f'''        if name == "spawn_children_cap" {{
            std::fs::write("{out}", &result.serial).expect("keep the serial");
        }}
''',1)
open(p,'w').write(s)
