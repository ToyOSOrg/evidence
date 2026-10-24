# Throwaway measurement instrumentation (never lands). Usage: python3 apply.py <worktree> <before|after>
import sys
wt, side = sys.argv[1], sys.argv[2]
def edit(p, old, new):
    p = f"{wt}/{p}"; s = open(p).read()
    assert s.count(old) == 1, (p, old[:60]); open(p, 'w').write(s.replace(old, new))
edit('kernel/src/actuator.rs', '''    /// Panic between arming the on-screen console and `mm::init`.''', '''    /// MEASUREMENT ONLY (throwaway): a fixed flood of kernel records.
    console_flood = "console-flood";

    /// Panic between arming the on-screen console and `mm::init`.''')
anchor = '    virtio_console::init(&pci_devices);\n' if side == 'before' else '''    #[cfg(feature = "boot-actuators")]
    arch::boot::interrupt_selftests();
'''
edit('kernel/src/main.rs', anchor, anchor + '''
    #[cfg(feature = "boot-actuators")]
    if actuator::console_flood() {
        const LINES: u64 = 380;
        const PAYLOAD: &str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUV";
        let t0 = clock::nanos_since_boot();
        for i in 0..LINES {
            log!("console-flood i={i:05} {PAYLOAD}");
        }
        let us = (clock::nanos_since_boot() - t0) / 1_000;
        log!("console-flood: done, {LINES} records of a {}-byte message in {us} us", 21 + PAYLOAD.len());
    }
''')
# harness: timestamp every flood line's arrival on the console stdout
edit('tests/common/qemu.rs', '''    let Ok(line) = String::from_utf8(raw) else { return false };''', '''    let Ok(line) = String::from_utf8(raw) else { return false };
    if line.contains("console-flood") {
        static T0: std::sync::OnceLock<Instant> = std::sync::OnceLock::new();
        let t0 = *T0.get_or_init(Instant::now);
        eprintln!("MEASURE_ARRIVAL us={} bytes={} {}", t0.elapsed().as_micros(), line.len() + 1, &line[..line.len().min(120)]);
    }''')
edit('tests/toyos.rs', '''const MACHINE_TESTS: &[&str] = &[
''', '''const MACHINE_TESTS: &[&str] = &[
    "measure_console_flood",
''')
edit('tests/toyos.rs', '''fn run_machine_test(name: &str, test_config: &Path) -> Result<(), String> {
    match name {
''', '''fn run_machine_test(name: &str, test_config: &Path) -> Result<(), String> {
    match name {
        "measure_console_flood" => {
            let profile = match std::env::var("MEASURE_PROFILE").as_deref() {
                Ok("virtits") => qemu::Profile::VirtIts,
                _ => qemu::Profile::Headless,
            };
            let qemu = QemuInstance::boot_with_options(
                test_config,
                &[],
                &[],
                BootOptions { profile, kernel_params: &["console-flood"], ..Default::default() },
            );
            let done = qemu.boot_log().lines().find(|l| l.contains("console-flood: done")).unwrap_or("").to_string();
            eprintln!("MEASURE_DONE {done}");
            Ok(())
        }
''')
