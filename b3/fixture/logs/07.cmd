fusermount3 -u /mnt/t; while pgrep -f "bcachefs fusemount" >/dev/null; do sleep 1; done; echo daemon-exited
