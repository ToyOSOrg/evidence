#!/bin/bash
# guest-mutate.sh <worktree> <outdir> <name> <file> <python-replace-script>: apply, run the owner-death member on QEMU, restore.
set -uo pipefail
tree=$1 out=$2 name=$3 file=$4 script=$5
cp "$tree/$file" "$out/$name.orig"
python3 -I "$script" "$tree/$file" || { echo "$name: the mutation did not apply"; exit 70; }
cd "$tree" && cargo clippy -q -p kernel --target x86_64-unknown-none >/dev/null 2>&1 || echo "$name: (clippy warns; building anyway)"
"$(dirname "$0")/qemu-members.sh" "$tree" "$out/$name" a_pager_s_end_answers_its_waiting_holders_gone > "$out/$name.log" 2>&1
code=$?
cp "$out/$name.orig" "$tree/$file"
git -C "$tree" diff --quiet -- "$file" && echo "$name: restored" || echo "$name: NOT RESTORED"
echo "$name: run exited $code"; cat "$out/$name.log"
