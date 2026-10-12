#!/bin/bash
# Each mutant applied as a checked patch, its tests run, its exit recorded,
# and the patch reversed: the tree is clean after each.
T=<worktree>
M=<scratch>/mutants
cd "$T" || exit 1
echo "ToyOS head $(git rev-parse HEAD)"
run() {
  name=$1; shift
  echo "=== $name: $*"
  git apply --check "$M/$name.patch" || { echo "PATCH DOES NOT APPLY"; return; }
  git apply "$M/$name.patch"
  "$@" > "$M/$name.log" 2>&1
  code=$?
  git apply -R "$M/$name.patch"
  grep -E "^test .* FAILED$|^error(\[|:)" "$M/$name.log"
  echo "EXIT=$code"
  echo "tree clean: $(git status --porcelain | wc -l | tr -d ' ') changed"
}
run r1-protected-passes cargo test -p toyos-userbound --test firmware
run r1-server-denies-a-free-port cargo test -p acpiserver host::tests
run r2-refused-method-keeps-what-it-made cargo test -p toyos-aml --test heap a_method_refused
run r2-refused-evaluation-keeps-its-global-lock cargo test -p toyos-aml --test heap a_method_refused
run r3-every-device-examined cargo test -p acpiserver init::tests
run r3-refused-sta-closes-its-subtree cargo test -p acpiserver init::tests
run r3-no-integer-sta-closes-its-subtree cargo test -p acpiserver init::tests
