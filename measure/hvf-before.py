import sys
wt=sys.argv[1]
p=f"{wt}/tests/common/qemu.rs"; s=open(p).read()
old="    } else if options.mute {"
new='''    } else if std::env::var_os("MEASURE_VIRT_CONSOLE").is_some() {
        qemu.arg("-serial").arg(format!("file:{}", uart_log.display()))
            .arg("-chardev").arg("stdio,id=cs0,signal=off")
            .arg("-device").arg("virtio-serial-pci-non-transitional,id=virtio-serial0,max_ports=1")
            .arg("-device").arg("virtconsole,chardev=cs0,id=console0");
    } else if options.mute {'''
assert s.count(old)==1; s=s.replace(old,new)
old='''        .virtio
        .present()
        .then(toyos_build::kernelconsole::KernelConsole::default);'''
new='''        .virtio
        .present()
        .then_some(())
        .or(std::env::var_os("MEASURE_VIRT_CONSOLE").map(drop))
        .map(|()| toyos_build::kernelconsole::KernelConsole::default());'''
assert s.count(old)==1; s=s.replace(old,new)
open(p,'w').write(s)
p=f"{wt}/tests/toyos.rs"; s=open(p).read()
old='''                Ok("virtits") => qemu::Profile::VirtIts,'''
new='''                Ok("virtits") => qemu::Profile::VirtIts,
                Ok("virt") => qemu::Profile::Virt,'''
assert s.count(old)==1; s=s.replace(old,new); open(p,'w').write(s)
