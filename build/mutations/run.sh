#!/bin/sh
# Each host mutation: written, kept as a checked patch, applied, built and run,
# reported with its exit, and reverted, the porcelain empty after each.
S=/Users/jan/.claude/jobs/2280e09e/tmp/scratchpad/microcode-build/mut
W=/Users/jan/Dev/jan/toyos-microcode
cd $W || exit 90
[ -z "$(git status --porcelain --ignore-submodules=none)" ] || { echo "tree not clean"; exit 91; }
echo "head $(git rev-parse HEAD)"
test_of() {
  case $1 in
    h15-*) echo "cargo test --lib licence::tests::a_disallowed_licence_is_refused_by_name" ;;
    h16-*|h17-*) echo "cargo test --test toyos-checks microcode_verdict" ;;
    *) echo "cargo test -p toyos-microcode" ;;
  esac
}
ALL="h01-a-guest-may-load h02-revision-0xffffffff-may-load h03-hygon-reads-as-amd
     h04-amd-equal-revision-is-current h05-amd-match-ignores-stepping h06-amd-chipset-patch-accepted
     h07-amd-minimum-revision-accepted h08-amd-any-section-is-a-patch h09-amd-magic-unread
     h10-amd-table-type-unread h11-amd-first-match-kept h12-amd-every-family-flushes-or-none
     h13-intel-equal-revision-reloads h14-renoir-patch-byte-flipped h15-firmware-licence-passes-as-code
     h16-judge-takes-any-amd-bsp h17-judge-takes-a-t14-below-linux"
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
