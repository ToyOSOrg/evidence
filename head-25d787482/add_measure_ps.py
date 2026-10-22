import sys
p=sys.argv[1]
s=open(p).read()
a='''    "console_image_boots",
'''
s=s.replace(a,a+'''    "measure_memory",
''',1)
a='''        "console_image_boots" => console_image_boots(),'''
s=s.replace(a,a+'''
        "measure_memory" => {
            let mut qemu = QemuInstance::boot_with_options(test_config, &[], &[], BootOptions::default());
            for _ in 0..4 {
                let r = qemu.run_test("free", Duration::from_secs(30));
                eprintln!("MEASURE free: {}", r.stdout.replace('\\n', " | "));
            }
            let p = qemu.run_test("ps", Duration::from_secs(30));
            eprintln!("MEASURE ps: {}", p.stdout.replace('\\n', " | "));
            Ok(())
        }''',1)
open(p,'w').write(s)
