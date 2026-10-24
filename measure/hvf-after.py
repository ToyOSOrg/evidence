import sys
wt=sys.argv[1]
p=f"{wt}/tests/common/qemu.rs"; s=open(p).read()
old="    } else if options.mute {"
new='''    } else if std::env::var_os("MEASURE_VIRT_CONSOLE").is_some() {
        qemu.arg("-chardev")
            .arg(format!("socket,id=uart0,path={}", socket_dir.join(UART_SOCKET).display()))
            .arg("-serial")
            .arg("chardev:uart0")
            .arg("-chardev")
            .arg("stdio,id=cs0,signal=off")
            .args(toyos_build::vmconsole::args("cs0", ",iommu_platform=on"));
    } else if options.mute {'''
assert s.count(old)==1; s=s.replace(old,new)
old="    let virtio = options.profile.shape().virtio.present();"
new="    let virtio = options.profile.shape().virtio.present() || std::env::var_os(\"MEASURE_VIRT_CONSOLE\").is_some();"
assert s.count(old)==1; s=s.replace(old,new)
open(p,'w').write(s)
