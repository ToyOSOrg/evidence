#!/bin/zsh
# What changed in the store between two census.sh readings: per kind, each key placed, removed or re-dated
# (its lock's mtime moved, so something used it), with the epoch seconds of each date.
awk '
FNR==1 { file++ }
/^== lock dirs/ { skip=1 } /^== [a-z-]+$/ && !/lock dirs/ { skip=0; kind=$2; next }
skip || !/lock_mtime=/ { next }
{ split($2,a,"="); k=kind" "$1; if (file==1) b[k]=a[2]; else { c[k]=a[2]; if (!(k in b)) print "placed   " k " used " a[2]; else if (b[k]!=a[2]) print "re-dated " k " " b[k] " -> " a[2] } }
END { for (k in b) if (!(k in c)) { split(k, x, " "); gone[x[1]]++ }; for (kind in gone) print "removed  " kind " " gone[kind] " key(s)" }' $1 $2
