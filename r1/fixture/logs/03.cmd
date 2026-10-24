for i in $(seq 1 200); do echo $i > /mnt/t/f$i; done; sync; ls /mnt/t | wc -l
