#!/bin/bash
# Scratch: toyos-crypto's lib, differential, wycheproof, vectors, nist and fuzz tests for
# x86_64-unknown-linux-musl, opt-level 2 with debug assertions, from $1 (rev or WORK),
# named $2, optional patch $3. FEATURES overrides the feature set.
set -euo pipefail
. <home>/.claude/jobs/2280e09e/tmp/scratchpad/agents/crypto-timing/env.sh
D=$P/crypto-tests/lib/crypto
snapshot "$1" $D "${3:-}"
rm -rf $P/crypto-tests/tests && mkdir -p $P/crypto-tests/tests
if [ "$1" = WORK ]; then cp -R $W/tests/acvp $W/tests/cavp $P/crypto-tests/tests/; rm -rf $P/crypto-tests/sdk; mkdir -p $P/crypto-tests/sdk; cp -R $W/sdk/toyos $W/sdk/abi $P/crypto-tests/sdk/; else rm -rf $P/crypto-tests/sdk; git -C $W archive "$1" tests/acvp tests/cavp sdk/toyos sdk/abi | tar -x -m -C $P/crypto-tests; fi
printf '\n[workspace]\n\n[profile.dev]\nopt-level = 2\n' >> $D/Cargo.toml
cp $W/Cargo.lock $D/
cd $D
CARGO_TARGET_DIR=$P/crypto-tests/target cargo +$TC test --offline --target x86_64-unknown-linux-musl --features "${FEATURES:-std,sign,wpa2,rustls-provider}" --lib --test differential --test wycheproof --test vectors --test nist --test fuzz --no-run --message-format=json-render-diagnostics > $P/logs/test-build-$2.json
for exe in $(python3 -I -c 'import json,sys
for l in sys.stdin:
    m=json.loads(l)
    if m.get("reason")=="compiler-artifact" and m.get("executable") and m["target"]["name"] in ("toyos_crypto","differential","wycheproof","vectors","nist","fuzz"): print(m["target"]["name"]+"="+m["executable"])' < $P/logs/test-build-$2.json); do
  cp "${exe#*=}" $P/bin/${exe%%=*}-$2
done

