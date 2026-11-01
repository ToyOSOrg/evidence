#!/bin/bash
# Scratch: build toyos-crypto's x86-64 suites from $1 (rev or WORK) as $2 and run each under QEMU TCG -cpu max.
# Prints "<suite> exit=<code>" from the guest init's exit code.
CT=<home>/.claude/jobs/2280e09e/tmp/scratchpad/agents/crypto-timing
set -u
bash $CT/tools/test-build.sh "$1" "$2" || { echo "build failed"; exit 2; }
status=0
for s in toyos_crypto differential wycheproof vectors nist fuzz; do
  VM_TREES="$CT/crypto-tests/lib/crypto/tests $CT/crypto-tests/tests" bash $CT/tools/vm.sh $CT/bin/$s-$2 > $CT/logs/vm-$s-$2.log 2>&1
  code=$(grep -o 'exitcode=0x[0-9a-f]*' $CT/logs/vm-$s-$2.log | head -1)
  echo "$s $code $(grep -E '^test result' $CT/logs/vm-$s-$2.log | tail -1)"
  [ "$code" = "exitcode=0x00000000" ] || status=1
done
exit $status
