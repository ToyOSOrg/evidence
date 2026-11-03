#!/bin/bash
# members.sh <worktree> <outdir> <names-file>
# Boots the testcases shared boot under QEMU through the harness's --debug
# mode, releases the debug kernel's DEBUG_WAIT over the GDB stub, runs each
# named member ("rs:<name>" or "c:<name>") and records its result, then quits.
# Exit 0 only if every member exited 0.
set -uo pipefail
tree=$1 out=$2 names=$3
mkdir -p "$out"
for f in /tmp/toyos-debug-cmd /tmp/toyos-debug-result /tmp/toyos-debug-ready; do
    [ -e "$f" ] && { echo "members: $f exists; another debug run holds the paths" >&2; exit 70; }
done
(cd "$tree" && cargo test --test toyos-build -- --debug >"$out/boot.log" 2>&1; echo "rc=$?" >>"$out/boot.log") &
harness=$!
until grep -q "Launching QEMU" "$out/boot.log" 2>/dev/null; do
    kill -0 $harness 2>/dev/null || { echo "members: the harness ended before QEMU" >&2; exit 1; }
    sleep 2
done
for _ in $(seq 1 90); do
    lldb -b "$tree/target/x86_64-unknown-none/toyos/kernel" -o "gdb-remote localhost:1234" \
        -o 'script import lldb as L; e=L.SBError(); f=lldb.thread.GetFrameAtIndex(0); a=f.FindRegister("rax").GetValueAsUnsigned(); ins=lldb.target.ReadInstructions(f.GetPCAddress(), 1)[0].GetMnemonic(lldb.target); m=lldb.process.ReadMemory(a,1,e) if e.Success() or True else b""; spin=ins in ("pause","jmp","movzbl","testb","je") and m==b"\x01"; print("SPIN", ins, hex(a), m); (lldb.process.WriteMemory(a, bytes([0]), e), print("CLEARED", e.Success())) if spin else print("NOT YET")' \
        -o "process detach" >"$out/lldb.log" 2>&1 && grep -q "CLEARED True" "$out/lldb.log" && break
    sleep 2
done
grep -q "CLEARED True" "$out/lldb.log" || { echo "members: DEBUG_WAIT not cleared" >&2; kill $harness; exit 1; }
until [ -e /tmp/toyos-debug-ready ]; do kill -0 $harness 2>/dev/null || exit 1; sleep 2; done
status=0
while read -r entry; do
    kind=${entry%%:*} m=${entry#*:}
    echo "run test_${kind}_$m" >/tmp/toyos-debug-cmd
    until [ -e /tmp/toyos-debug-result ]; do kill -0 $harness 2>/dev/null || { echo "members: harness gone at $m" >&2; exit 1; }; sleep 1; done
    sleep 1
    mv /tmp/toyos-debug-result "$out/$kind-$m.txt"
    grep -q "^exit_code: Some(0)$" "$out/$kind-$m.txt" || status=1
    echo "$kind:$m: $(grep exit_code "$out/$kind-$m.txt")"
done <"$names"
echo quit >/tmp/toyos-debug-cmd
wait $harness
rm -f /tmp/toyos-debug-result
exit $status
