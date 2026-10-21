# pr-972 round 2

Tree under test: commit eddc6dc9c (fork pin 11e31a52778); `ci-host.log` and `clippy.log` ran on its exact tree before it was committed.
`clippy-shape.sh` is the negative control for the new `-p toyos --all-targets` shape: a `clone_on_copy` in the transport's unit tests makes `cargo run -- --clippy` exit 1, and the file is restored. A first attempt put the clone inside `assert_eq!`, where clippy reports nothing, so the log is the second form.
Paths are masked: $HOME, $DEV (the directory holding the worktrees), $SCRATCH (the agent's scratch directory), $TMP.
