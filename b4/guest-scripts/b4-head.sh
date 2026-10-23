# The judge on the ROOTs built at the PR's head.
set -u
cd ~bb/b4; R=$PWD/logs/head; rm -rf "$R"; mkdir -p "$R"; . ~bb/b4/lib.sh
exec < /dev/null
cd head
r "bcachefs version; sha256sum *.img"
for img in root-x86_64 root-aarch64; do
  judge $img.img
  r "bcachefs list -b freespace $img.img 2>/dev/null | wc -l"
done
