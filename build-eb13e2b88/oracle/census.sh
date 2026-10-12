#!/bin/zsh
# Census of the host store: per kind, every entry and its key lock's mtime (epoch, local).
store=$HOME/.cache/toyos
date -u +"now %Y-%m-%dT%H:%M:%SZ epoch %s"
df -k $store
for kind in sysroots freestanding compilers llvm hosted-clang; do
  echo "== $kind"
  [ -d $store/$kind ] || { echo "(none)"; continue; }
  for e in $store/$kind/*(N) $store/$kind/.*(N); do
    name=${e:t}
    key=${name%%.*}
    lock=$store/locks/$kind/$key
    if [ -e $lock ]; then m=$(stat -f %m $lock); mh=$(stat -f %Sm -t %Y-%m-%dT%H:%M:%S $lock); else m=-; mh=-; fi
    echo "$name lock_mtime=$m $mh"
  done
done
echo "== lock dirs"
for kind in sysroots freestanding compilers llvm hosted-clang; do
  n=$(ls $store/locks/$kind 2>/dev/null | wc -l | tr -d ' '); echo "$kind locks=$n"
done
ls -la $store
