set -u
sudo bash ~bb/b2/b2-unencrypted.sh
sudo keyctl session - bash ~bb/b2/b2-encrypted.sh
