#!/bin/bash
# fdfuncs.sh <object.o> <out-dir>: one normalized disassembly file per descriptor-table function
# (the toyos_fd_* entry points, their closures, and the owner's `table`). Crate disambiguators,
# anonymous-constant hashes and the object's name are masked so two builds compare by code alone.
obj=$1; out=$2; mkdir -p "$out"
for sec in $(xcrun llvm-objdump -t "$obj" | awk '{print $NF}' | grep -E '^\.text\.(toyos_fd_[a-z0-9_]+|_R(NC)?NvNtNtCs[A-Za-z0-9]+_5toyos2fd5owner[0-9]+(toyos_fd_[a-z0-9_]+0B7_|table))$' | sort -u); do
  name=$(echo "$sec" | sed -E 's/^\.text\.//; s/Cs[A-Za-z0-9]+_5toyos/CsX_5toyos/')
  xcrun llvm-objdump -d -r --demangle --section="$sec" "$obj" | tail -n +4 \
    | sed -E 's/Cs[A-Za-z0-9]+_5toyos/CsX_5toyos/g; s/\.Lanon\.[0-9a-f]+\.[0-9]+/.Lanon.X/g; s/GCC_except_table[0-9]+/GCC_except_tableX/g' > "$out/$name.s"
done
ls "$out" | wc -l
