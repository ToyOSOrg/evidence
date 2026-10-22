import sys
p=sys.argv[1]
s=open(p).read()
a='''    "console_image_boots",
'''
s=s.replace(a,a+'''    "scratch_dlopen",
''',1)
a='''        "console_image_boots" => console_image_boots(),'''
s=s.replace(a,a+'''
        "scratch_dlopen" => {
            let (c_bins, rust_bins) = build_shared_bins();
            let want = ["dlopen_dedup", "abuse_dlopen_ledger", "std_tls_multi_crate", "std_tls_dlopen", "std_unwind_so", "abuse_elf_loader", "abuse_elf_segments", "std_tls_cranelift", "abuse_kernel_addr"];
            let rust: Vec<(String, Vec<u8>)> = rust_bins.iter().filter(|(n, _)| n.ends_with(".so") || want.contains(&n.as_str())).cloned().collect();
            let c: Vec<(String, Vec<u8>)> = c_bins.iter().filter(|(n, _)| n.starts_with("204_") || n.starts_with("207_")).cloned().collect();
            let mut failed = Vec::new();
            for (features, set) in [(&[][..], &want[..8]), (toyos_build::build::TEST_KERNEL, &want[8..])] {
                let options = BootOptions { kernel_features: features, ..Default::default() };
                let mut qemu = QemuInstance::boot_with_options(test_config, &c, &rust, options);
                for name in set.iter().map(|n| format!("test_rs_{n}")).chain(if features.is_empty() { c.iter().map(|(n, _)| format!("test_c_{n}")).collect::<Vec<_>>() } else { Vec::new() }) {
                    let r = qemu.run_test(&name, Duration::from_secs(120));
                    eprintln!("SCRATCH {name}: exit {:?}\\n{}", r.exit_code, r.stdout);
                    if r.exit_code != Some(0) { failed.push(name); }
                }
            }
            if failed.is_empty() { Ok(()) } else { Err(format!("failed: {failed:?}")) }
        }''',1)
open(p,'w').write(s)
