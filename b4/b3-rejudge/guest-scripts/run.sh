set -u
sudo bash ~bb/b3r/b3-judge.sh
sudo keyctl session - bash ~bb/b3r/b3-encrypted.sh
sudo keyctl session - bash ~bb/b3r/b2-images.sh
sudo bash ~bb/b3r/b3-rw-hang.sh
cat ~bb/b3r/logs/*/verdicts.txt
