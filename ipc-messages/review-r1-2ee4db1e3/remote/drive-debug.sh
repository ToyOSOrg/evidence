#!/bin/bash
# Runs on <runner>: drives one `cargo test --test toyos-build -- --debug` boot
# through every member named on stdin, one `run test_rs_<name>` at a time.
set -u
cmd=/tmp/toyos-debug-cmd res=/tmp/toyos-debug-result ready=/tmp/toyos-debug-ready
for i in $(seq 1 3600); do [ -e $ready ] && break; sleep 1; done
[ -e $ready ] || { echo "DRIVER: no ready file in an hour"; exit 70; }
echo "DRIVER: ready"
while read -r name; do
    rm -f $res
    echo "run test_rs_$name" > $cmd
    for i in $(seq 1 120); do [ -e $res ] && break; sleep 1; done
    if [ -e $res ]; then echo "=== $name"; cat $res; else echo "=== $name"; echo "DRIVER: no result in 120 s"; fi
done
rm -f $res; echo quit > $cmd
for i in $(seq 1 30); do [ -e $res ] && break; sleep 1; done
echo "DRIVER: quit sent"
