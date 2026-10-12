#!/bin/sh
# Each host mutation: written, kept as a checked patch, applied, built and run,
# reported with its exit, and reverted, the porcelain empty after each.
S=/Users/jan/.claude/jobs/2280e09e/tmp/scratchpad/agents/886-r2/mut
W=/Users/jan/Dev/jan/toyos-microcode
cd $W || exit 90
[ -z "$(git status --porcelain --ignore-submodules=none)" ] || { echo "tree not clean"; exit 91; }
echo "head $(git rev-parse HEAD)"
test_of() {
  case $1 in
    h15-*) echo "cargo test --lib licence::tests::a_disallowed_licence_is_refused_by_name" ;;
    j*) echo "cargo test --test toyos-checks microcode_verdict" ;;
    *) echo "cargo test -p toyos-microcode" ;;
  esac
}
ALL="j1-judge-takes-a-refused-line j2-judge-takes-any-outcome j3-judge-takes-any-revision h07-amd-data-checksum-accepted"
# Every mutation, or the ones the arguments name.
for m in ${@:-$ALL}; do
  python3 -I $S/make.py $m || { echo "$m: not written"; exit 92; }
  git diff --binary > $S/$m.patch
  git checkout -q -- .
  git apply --check $S/$m.patch; rc=$?; echo "$m: git apply --check EXIT=$rc"
  [ $rc -eq 0 ] || exit 93
  git apply $S/$m.patch
  cmd=$(test_of $m)
  $cmd > $S/$m.log 2>&1; rc=$?
  echo "$m: $cmd EXIT=$rc; red: $(grep -E '^test .* FAILED$|^    [a-z_:]+$' $S/$m.log | grep -v '^failures' | tr '\n' ' ')"
  echo "EXIT=$rc" >> $S/$m.log
  git apply -R $S/$m.patch
  [ -z "$(git status --porcelain --ignore-submodules=none)" ] || { echo "$m: not restored"; git status --porcelain; exit 94; }
done
echo "restored to $(git rev-parse HEAD); porcelain empty"
