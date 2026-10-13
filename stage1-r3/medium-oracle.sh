#!/bin/sh
# toyos-root new onto sticks' stand-ins: blank disk images attached, each
# erased by the header's own command, `diskutil eraseDisk <fs> <name> GPT
# <disk>`, then `new` onto it and its mode read back by stat. APFS must mint
# -rw------- and exit 0; ExFAT and FAT32 must refuse, exit 1, and leave no
# file. Step 2.3's B copy is measured on the APFS volume, and step 2.1's
# clock command is parsed without setting the clock. The script exits with
# the number of expectations that failed.
# $1: the toyos-root binary; $2: an empty scratch directory.
set -u
R=$1; D=$2; failed=0
expect() { if [ "$1" = "$2" ]; then echo "ok: $3"; else echo "FAILED: $3 (got '$1', want '$2')"; failed=$((failed+1)); fi; }
echo "umask $(umask)"
file "$R" | sed 's#^.*: #toyos-root: #'
for fs in APFS ExFAT "MS-DOS FAT32"; do
  name=TRY$(echo "$fs" | tr -cd 'A-Z0-9' | cut -c1-6)
  img="$D/$name.dmg"; vol=/Volumes/$name
  echo "== $fs: a blank 64 MiB image, attached unmounted"
  hdiutil create -quiet -size 64m -layout NONE "$img"; echo "create EXIT=$?"
  disk=$(hdiutil attach -nomount "$img" 2>/dev/null | awk 'NR==1{print $1}')
  echo "== diskutil eraseDisk $fs $name GPT <disk>"
  diskutil eraseDisk "$fs" "$name" GPT "$disk" > "$D/$name.erase" 2>&1; echo "eraseDisk EXIT=$?"
  mount | grep -F " on $vol " | sed -E "s#/dev/disk[0-9]+s[0-9]+#/dev/diskNsM#; s#on $vol #on <vol> #"
  diskutil info "$vol" | grep -E 'File System Personality'
  echo "== toyos-root new <vol>/root-key"
  "$R" new "$vol/root-key" > "$D/$name.new" 2>&1; code=$?
  echo "EXIT=$code"; sed "s#$vol#<vol>#g" "$D/$name.new"
  if [ -e "$vol/root-key" ]; then got=$(stat -f '%Sp' "$vol/root-key"); else got="no file"; fi
  echo "root-key: $got"
  if [ "$fs" = APFS ]; then
    expect "$code" 0 "new on $fs exits 0"
    expect "$got" "-rw-------" "new on $fs mints -rw-------"
    echo "== step 2.3 on the same volume: cp, cmp, stat -f %Sp"
    cp "$vol/root-key" "$vol/B-root-key" && cmp "$vol/root-key" "$vol/B-root-key"; echo "cmp EXIT=$?"
    expect "$(stat -f %Sp "$vol/B-root-key")" "-rw-------" "the B copy on $fs reads -rw-------"
  else
    expect "$code" 1 "new on $fs exits 1"
    expect "$got" "no file" "new on $fs leaves no file"
  fi
  hdiutil detach -quiet "$disk"; echo "detach EXIT=$?"
  rm -f "$img"
done
echo "== step 2.1's command, parsed without setting the clock: date -u -j 101312002026"
date -u -j 101312002026; echo "EXIT=$?"
echo "failed: $failed"
exit $failed
