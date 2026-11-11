# pr-1208: what the kernel still holds

| check | revision | target | exit | log |
|---|---|---|---|---|
| `cargo run -- --ci host` | 231d33b65 | macOS arm64 host | 1: 109 of 110 steps green; `the build system` red by `llvm::tests::the_caller_s_environment_reaches_neither_the_build_nor_the_key` alone | `host/ci-host.log` |

`inventory/` is how the record's area table was counted at ToyOS `9349705ce`:
`git ls-files 'kernel/src/*.rs' | xargs wc -l`, each path less `kernel/src/`
fed to `area.awk` as `<lines> <path>`. `files-by-area.tsv` is the area, lines
and path of every file; `areas.tsv` the area, file count and line sum.

Paths under the home directory, the worktree and the host's temporary
directories are masked.
