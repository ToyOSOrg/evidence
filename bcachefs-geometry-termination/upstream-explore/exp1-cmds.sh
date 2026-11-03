cd /
for geo in "--block_size=32k --btree_node_size=32k --bucket_size=32k" "--block_size=32k --btree_node_size=32k" "--block_size=4k --btree_node_size=32k" ""; do
  rm -f /up.img
  /usr/bin/busybox dd if=/dev/zero of=/up.img bs=1M count=0 seek=64 2>/dev/null
  echo "===UPFORMAT [$geo]"
  $BC format $geo /up.img > /fmt.txt 2>&1; ec=$?
  tail -3 /fmt.txt
  echo "===UPFORMAT-EXIT $ec"
  $BC show-super /up.img 2>/dev/null | grep -iE "block size|btree node size|bucket size" | head -5
  $BC fsck -n -f -K /up.img </dev/null > /fsck.txt 2>&1; ec=$?
  grep -vE "\.\.\. done" /fsck.txt | tail -12
  echo "===UPFSCK-EXIT [$geo] $ec"
done
