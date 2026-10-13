#!/bin/sh
# The ceremony's offline steps on sticks' stand-ins: blank disk images, each
# erased by the header's own command, `diskutil eraseDisk <fs> <name> GPT
# <disk>`. C is ExFAT, the format sticks come in, and carries the binary:
# every `toyos-root` below runs from C. A and B are APFS ROOTA and ROOTB,
# with ownership enabled by `sudo diskutil enableOwnership`, after which
# `mount` must not list them `noowners`. `new` onto A must exit 0 and read
# back the running user and -rw-------, as must step 2.3's copy on B; step
# 2.4's `sign` writes root 1 onto C and prints the fingerprint `new` did.
# `new` onto ExFAT and FAT32 must exit 1 and leave no file. Step 2.1's clock
# command is parsed without setting the clock. The script exits with the
# number of expectations that failed.
# $1: the toyos-root binary; $2: an empty scratch directory.
set -u
R=$1; D=$2; failed=0; me=$(id -un)
expect() { if [ "$1" = "$2" ]; then echo "ok: $3"; else echo "FAILED: $3 (got '$1', want '$2')"; failed=$((failed+1)); fi; }
mask() { sed -E "s#/dev/disk[0-9]+(s[0-9]+)?#/dev/diskN#g; s#mounted by $me#mounted by <user>#; s#$D#<scratch>#g"; }
stick() { # $1 fs, $2 name: a blank image erased as the header says; prints its disk
  hdiutil create -quiet -size 64m -layout NONE "$D/$2.dmg" || return 1
  disk=$(diskutil image attach --noMount "$D/$2.dmg" 2>/dev/null | awk 'NR==1{print $1}')
  diskutil eraseDisk "$1" "$2" GPT "$disk" > "$D/$2.erase" 2>&1 || return 1
  echo "$disk"
}
echo "umask $(umask)"
file "$R" | sed 's#^.*: #toyos-root: #'

echo "== C: ExFAT STICKC, the binary copied onto it"
C_DISK=$(stick ExFAT STICKC); expect "$?" 0 "C erased"; C=/Volumes/STICKC
cp "$R" "$C/toyos-root"; expect "$?" 0 "the binary copied to C"
echo "C/toyos-root: $(stat -f '%Sp' "$C/toyos-root")"
ssh-keygen -q -t ed25519 -N '' -C '' -f "$D/signing" && cut -d' ' -f1,2 "$D/signing.pub" > "$C/signing.pub"
expect "$?" 0 "a signing public line on C"

for n in ROOTA ROOTB; do
  echo "== $n: diskutil eraseDisk APFS $n GPT <disk>, sudo diskutil enableOwnership /Volumes/$n"
  disk=$(stick APFS $n); expect "$?" 0 "$n erased"
  eval "${n}_DISK=$disk"
  sudo diskutil enableOwnership "/Volumes/$n" > "$D/$n.own" 2>&1; code=$?
  mask < "$D/$n.own"; expect "$code" 0 "enableOwnership on $n"
  line=$(mount | grep -F " on /Volumes/$n ")
  echo "$line" | mask
  case "$line" in *noowners*) got=noowners;; *) got=owners;; esac
  expect "$got" owners "$n is not mounted noowners"
done
A=/Volumes/ROOTA; B=/Volumes/ROOTB

echo "== step 2.2: <C>/toyos-root new <A>/root-key"
"$C/toyos-root" new "$A/root-key" > "$D/new.out" 2>&1; code=$?
echo "EXIT=$code"; mask < "$D/new.out"
expect "$code" 0 "new on A exits 0"
expect "$(stat -f '%Su %Sp' "$A/root-key" 2>&1)" "$me -rw-------" "A's key reads back the running user and -rw-------"

echo "== step 2.3: cp <A>/root-key <B>/root-key && cmp, stat -f '%Su %Sp' both"
cp "$A/root-key" "$B/root-key" && cmp "$A/root-key" "$B/root-key"; expect "$?" 0 "B's copy is A's bytes"
expect "$(stat -f '%Su %Sp' "$B/root-key" 2>&1)" "$me -rw-------" "B's key reads back the running user and -rw-------"

echo "== step 2.4: <C>/toyos-root sign --key <A>/root-key --signing <C>/signing.pub --out <C>/root.1.txt"
"$C/toyos-root" sign --key "$A/root-key" --signing "$C/signing.pub" --out "$C/root.1.txt" > "$D/sign.out" 2>&1; code=$?
echo "EXIT=$code"; mask < "$D/sign.out"
expect "$code" 0 "sign from C exits 0"
expect "$(grep '^root key ' "$D/sign.out")" "$(grep '^root key ' "$D/new.out")" "sign prints the root key fingerprint new printed"
expect "$(grep '^signing key ' "$D/sign.out" | cut -d' ' -f3)" "$(ssh-keygen -l -f "$D/signing.pub" | cut -d' ' -f2)" "sign prints ssh-keygen's fingerprint of the signing key"
[ -s "$C/root.1.txt" ]; expect "$?" 0 "root 1 is on C"

for fs in ExFAT "MS-DOS FAT32"; do
  name=TRY$(echo "$fs" | tr -cd 'A-Z0-9' | cut -c1-6); vol=/Volumes/$name
  echo "== $fs: <C>/toyos-root new <vol>/root-key"
  disk=$(stick "$fs" "$name"); expect "$?" 0 "$name erased"
  mount | grep -F " on $vol " | mask | sed "s#$vol#<vol>#"
  "$C/toyos-root" new "$vol/root-key" > "$D/$name.new" 2>&1; code=$?
  echo "EXIT=$code"; sed "s#$vol#<vol>#g" "$D/$name.new"
  if [ -e "$vol/root-key" ]; then got=$(stat -f '%Sp' "$vol/root-key"); else got="no file"; fi
  expect "$code" 1 "new on $fs exits 1"
  expect "$got" "no file" "new on $fs leaves no file"
  diskutil eject "$disk" > /dev/null; echo "eject EXIT=$?"
done

for disk in "$ROOTA_DISK" "$ROOTB_DISK" "$C_DISK"; do diskutil eject "$disk" > /dev/null; echo "eject EXIT=$?"; done
rm -f "$D"/*.dmg

echo "== step 2.1's command, parsed without setting the clock: date -u -j 101312002026"
date -u -j 101312002026; echo "EXIT=$?"
echo "failed: $failed"
exit $failed
