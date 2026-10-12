#!/bin/sh
# Every deleted name, bare and as a path, over the index (the tree as it
# will be committed): each must find nothing outside issues/.
set -u
fail=0
check() {
  label=$1; shift
  out=$(git grep -n "$@" -- ':!issues/')
  code=$?
  echo "== $label: git grep $* -- ':!issues/' -> exit $code"
  [ -n "$out" ] && echo "$out"
  [ $code -eq 1 ] || fail=1
}
echo "head: $(git rev-parse HEAD)"
check proctest -w proctest
check tests/guest/proctest -e 'tests/guest/proctest'
check launch_authority -w launch_authority
check test_rs_launch_authority -e test_rs_launch_authority
check bin/net -e 'bin/net\b'
check bin/spin -e 'bin/spin\b'
check 'net.rs (toybox)' -e 'toybox/src/net\.rs'
check 'spin.rs (toybox)' -e 'toybox/src/spin\.rs'
check 'toybox net' -e 'toybox net\b'
check 'toybox spin' -e 'toybox spin\b'
check 'mod net' -e 'mod net;' -- system/toybox
check 'mod spin' -e 'mod spin;'
check toybox-net-cannot-reach-netstack -e toybox-net-cannot-reach-netstack
check the-shipped-image-carries-two-test-programs -e the-shipped-image-carries-two-test-programs
check '"net" applet arm' -e '\bnet,' -- system/toybox
check '"spin" applet arm' -e '\bspin,' -- system/toybox
echo "== the same, in issues/ (kept: Prose forbids editing an issue this branch does not take up)"
git grep -n -w -e proctest -e launch_authority -e toybox-net-cannot-reach-netstack -e the-shipped-image-carries-two-test-programs -e 'bin/spin' -e 'bin/net' -- issues/
echo "fail=$fail"
exit $fail
