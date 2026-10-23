#!/bin/bash
# Scratch: list integer divide instructions in functions whose name matches $2, in an llvm-objdump listing $1.
awk -v pat="$2" '/^[0-9a-f]+ <.*>:$/{name=$0; inm = (name ~ pat); if (inm) fns++} inm && /\t(div|idiv)[bwlq]?\t|\t[us]div\t/{print name " :: " $0; n++} END {print "functions matched: " fns ", integer divides: " n+0}' "$1"
