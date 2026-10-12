#!/bin/zsh
# Per kind, how many keys the census dates within 6, 12, 24 and 48 hours of its own "now".
census=$1
now=$(awk '/^now /{print $4; exit}' $census)
awk -v now=$now '
/^== lock dirs/ {exit}
/^== / {kind=$2; next}
/lock_mtime=/ { split($2,a,"="); m=a[2]; if (m=="-") {und[kind]++; next}; age=now-m; n[kind]++;
  if (age<=6*3600) h6[kind]++; if (age<=12*3600) h12[kind]++; if (age<=24*3600) h24[kind]++; if (age<=48*3600) h48[kind]++; }
END { for (k in n) printf "%s total=%d undated=%d within6h=%d 12h=%d 24h=%d 48h=%d\n", k, n[k], und[k], h6[k], h12[k], h24[k], h48[k] }' $census | sort
