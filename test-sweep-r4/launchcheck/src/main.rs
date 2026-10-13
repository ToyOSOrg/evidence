//! Every launch `process_tree` makes, asked of the supervisor's own decision
//! (`toyos_manifest::launch::may_start`) over the manifest the build renders
//! from the image config named on the command line. Exit 0 when each launch
//! is answered as the test needs, 1 otherwise.
use std::path::Path;

use toyos_manifest::launch::{may_start, Sessions, Starts, Target};

fn main() {
    let config = std::env::args().nth(1).expect("an image config");
    let (bytes, symlinks) = toyos_build::build::manifest_and_symlinks(Path::new(&config));
    let manifest = toyos_manifest::parse(std::str::from_utf8(&bytes).expect("utf-8 manifest"));
    let row_of = |path: &str| {
        let rel = path.trim_start_matches("/system/");
        let path = symlinks.iter().find(|(k, _)| k == rel).map(|(_, v)| v.clone()).unwrap_or(path.to_string());
        manifest.programs.iter().find(|p| p.path == path).unwrap_or_else(|| panic!("no row runs {path}"))
    };
    let mut sessions = Sessions::default();
    let machine = sessions.machine();
    let runner = manifest.program("test-runner").expect("test-runner's row");
    let mut failed = false;
    let mut ask = |who: &str, caller: &toyos_manifest::Program, session, path: &str| {
        let answer = may_start(caller, session, Target::Row(row_of(path)));
        println!("{who} in {session} -> {path}: {answer:?}");
        failed |= answer.is_err();
        answer
    };
    // A, B (A's launcher) and under_b_is_gone / a_pipe_is_no_place: cat.
    ask("test-runner", runner, machine, "/system/bin/cat");
    // a_detached_program_outlives_its_shell: the shell, then its detach of cat.
    let shell_session = match ask("test-runner", runner, machine, "/system/bin/shell") {
        Ok(Starts::In(s)) => Some(s),
        Ok(Starts::Opening(screen)) => Some(sessions.open(screen)),
        Err(_) => None,
    };
    if let Some(s) = shell_session {
        ask("shell", manifest.program("shell").expect("shell's row"), s, "/system/bin/cat");
    }
    std::process::exit(failed as i32);
}
