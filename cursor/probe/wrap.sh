#!/bin/bash
# scratch: rewrite cargo run's QEMU argv to headless + VNC + cursor traces
S=$SCRATCH
real=/opt/homebrew/bin/$(basename "$0")
args=()
skip=0
for a in "$@"; do
  if [ $skip = 1 ]; then skip=0; args+=("dbus,p2p=yes"); continue; fi
  if [ "$a" = "-display" ]; then skip=1; args+=("$a"); continue; fi
  case "$a" in
    *tmp/toyos-qmp.sock*) a="unix:$S/qmp.sock,server,nowait" ;;
    *tmp/toyos-uart-early.log*) a="file:$S/uart.log" ;;
    *hostfwd=tcp::2222-:22*) a="user,id=net0" ;;
  esac
  [ "$a" = "-s" ] && continue
  args+=("$a")
done
echo "${args[@]}" > $S/qemu-argv.txt
exec "$real" "${args[@]}" -vnc unix:$S/vnc.sock -qmp unix:$S/qmp2.sock,server,nowait -trace "virtio_gpu_update_cursor" -trace "virtio_gpu_cmd_res_create_2d" -trace "virtio_gpu_cmd_set_scanout" -D $S/trace.log
