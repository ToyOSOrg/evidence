#!/bin/bash
# Runs on <runner>: releases a debug-wait kernel's spin gate through QEMU's GDB
# stub. The loop loads the flag's address through a GOT slot (`mov X(%rip),%rax`
# just before it); the slot holds the flag's runtime address.
for i in $(seq 1 1800); do ss -ltn | grep -q ':1234 ' && break; sleep 1; done
for i in $(seq 1 120); do
    slot=$(timeout 60 gdb -nx -batch -ex "target remote localhost:1234" -ex 'x/12i $pc-24' -ex detach 2>/dev/null | grep -B6 -E pause | grep -E 'mov +0x[0-9a-f]+\(%rip\),%rax' | head -1 | grep -oE '# 0x[0-9a-f]+' | cut -c3-)
    [ -n "$slot" ] && break
    sleep 5
done
[ -n "$slot" ] || { echo "GATE: no GOT load found"; exit 70; }
timeout 60 gdb -nx -batch -ex "target remote localhost:1234" -ex "set \$f = *(unsigned long*)$slot" -ex 'print (int)*(unsigned char*)$f' -ex 'set var *(unsigned char*)$f = 0' -ex 'print (int)*(unsigned char*)$f' -ex detach 2>&1 | grep -E '^\$'
echo "GATE: released through $slot"
