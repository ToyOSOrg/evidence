#!/bin/zsh
# From a census.sh reading alone: the sysroots a sweep after one more placement removes. The placed one is
# the newest; of the whole sysroots ranked by their lock's mtime, then key, all but the newest $2 - 1 are
# older than the cut, and each goes unless the lock listing $3 shows it held.
census=$1 kept=$2 held=$3
awk '/^== / { kind=$2; next } kind=="sysroots" && /lock_mtime=/ && $1 ~ /^[0-9a-f]+$/ { split($2,a,"="); print a[2], $1 }' $census | sort |
awk -v kept=$kept -v held="$(awk 'NR>1 {n=split($NF,p,"/"); print p[n]}' $held | tr '\n' ' ')" '
BEGIN { split(held, h, " "); for (i in h) inuse[h[i]] = 1 }
{ m[NR]=$1; k[NR]=$2 }
END { older = NR + 1 - kept; printf "%d whole sysroots, %d after the placement, %d older than the cut\n", NR, NR + 1, (older > 0 ? older : 0);
      for (i = 1; i <= older; i++) printf "%s %s %s\n", (k[i] in inuse ? "held, stays" : "goes"), k[i], m[i] }'
