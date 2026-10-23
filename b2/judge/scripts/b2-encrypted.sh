# B2's encrypted volumes, unlocked from the hex secret in the same session
# keyring as fsck, which runs with stdin closed (design §3.4; BB-A10-2's
# steps 05-07 and BB-A9-3 on B2's volume).
set -u
cd ~bb/b2; R=$PWD/logs/encrypted; rm -rf "$R"; mkdir -p "$R"; . ~bb/b2/lib.sh
exec < /dev/null
r "xxd pass; keyctl show @s"
for img in data-64m data-1g; do
  judge $img.img
  r "bcachefs unlock -c $img.img; echo exit \$?"
  r "bcachefs unlock -k session -f pass $img.img; echo exit \$?"
  r "keyctl show @s"
  r "bcachefs show-super -f all $img.img"
  judge $img.img
  r "sha256sum $img.img"
  r "cp $img.img $img.b.img && bcachefs fusemount $img.b.img /mnt/t && mkdir /mnt/t/d && seq 1 40000 > /mnt/t/d/seq.txt && printf hello-toyos > /mnt/t/a.txt && sync && ls -laR /mnt/t; fusermount3 -u /mnt/t"
  judge $img.b.img
  r "bcachefs fusemount $img.b.img /mnt/t && cmp <(seq 1 40000) /mnt/t/d/seq.txt && cmp <(printf hello-toyos) /mnt/t/a.txt && echo contents-ok; fusermount3 -u /mnt/t"
  r "keyctl clear @s; bcachefs fsck -n -K $img.img < pass; echo exit \$?"
  r "printf '%s\n' \$(tr 0 1 < pass) > wrong; bcachefs unlock -k session -f wrong $img.img; echo exit \$?"
  r "keyctl clear @s"
done
