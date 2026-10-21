# Uncommitted: a QEMU registration running job_fairness at 2, 4 and 8 vCPUs.
import sys
p='<worktree>/tests/toyos.rs'
s=open(p).read()
if 'scratch_job_fairness' in s:
    sys.exit("already applied")
s=s.replace('const MACHINE_TESTS: &[&str] = &[\n','const MACHINE_TESTS: &[&str] = &[\n    "scratch_job_fairness_2",\n    "scratch_job_fairness_4",\n    "scratch_job_fairness_8",\n',1)
s=s.replace('        "vector_state_survives_a_switch" => vector_state_survives_a_switch(test_config),\n',
'''        "vector_state_survives_a_switch" => vector_state_survives_a_switch(test_config),
        "scratch_job_fairness_2" => scratch_job_fairness(test_config, 2),
        "scratch_job_fairness_4" => scratch_job_fairness(test_config, 4),
        "scratch_job_fairness_8" => scratch_job_fairness(test_config, 8),
''',1)
s=s.replace('fn vector_state_survives_a_switch(test_config: &Path) -> Result<(), String> {','''fn scratch_job_fairness(test_config: &Path, smp: u32) -> Result<(), String> {
    const JOB: &str = "job_fairness";
    let bin = qemu::build_toyos_bin(qemu::SUITE_ARCH, &compile::repo_root().join("tests/guest/rust-tests"), JOB);
    let options = BootOptions { smp, ..BootOptions::default() };
    let mut qemu = QemuInstance::boot_with_options(test_config, &[], &[(JOB.to_string(), bin)], options);
    serial::Serial::boot(&qemu).must_be_clean()?;
    let result = qemu.run_test("test_rs_job_fairness", Duration::from_secs(300));
    for line in result.stdout.lines().filter(|l| l.contains("job_fairness")) {
        eprintln!("  [jobs smp={smp}] {line}");
    }
    if let Some(why) = &result.error {
        return Err(format!("{why}\\nthe job said:\\n{}", result.stdout));
    }
    if result.exit_code != Some(0) {
        return Err(format!("the job ended {:?}:\\n{}", result.exit_code, result.stdout));
    }
    Ok(())
}

fn vector_state_survives_a_switch(test_config: &Path) -> Result<(), String> {''',1)
open(p,'w').write(s)
