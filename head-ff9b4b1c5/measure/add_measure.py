import sys
p=sys.argv[1]
s=open(p).read()
a='''    "console_image_boots",
'''
assert a in s
s=s.replace(a,a+'''    "measure_memory",
''',1)
a='''        "console_image_boots" => console_image_boots(),'''
assert a in s
s=s.replace(a,a+'''
        "measure_memory" => {
            let mut qemu = QemuInstance::boot_with_options(test_config, &[], &[], BootOptions::default());
            for _ in 0..8 {
                let r = qemu.run_test("free", Duration::from_secs(30));
                eprintln!("MEASURE free: {}", r.stdout.replace('\\n', " | "));
            }
            Ok(())
        }''',1)
open(p,'w').write(s)
