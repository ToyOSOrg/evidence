#!/bin/zsh
# Per kind, from physdu.py's per-owner rows: owners, apparent and exclusive GiB, and the least and most exclusive.
awk -F'\t' 'NR>1 && /apparent/ { split($1,p,"/"); kind=p[1]; sub(/apparent /,"",$2); sub(/ GiB/,"",$2); sub(/exclusive /,"",$3); sub(/ GiB/,"",$3); n[kind]++; app[kind]+=$2; ex[kind]+=$3; if ($3>mx[kind]) mx[kind]=$3; if (mn[kind]==""||$3<mn[kind]) mn[kind]=$3 } END { for (k in n) printf "%s n=%d apparent=%.2f exclusive_sum=%.2f excl_min=%.3f excl_max=%.3f\n", k, n[k], app[k], ex[k], mn[k], mx[k] }' $1 | sort
