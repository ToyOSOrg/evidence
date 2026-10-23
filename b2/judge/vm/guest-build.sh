set -ex
sudo DEBIAN_FRONTEND=noninteractive apt-get update -q
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y -q build-essential pkg-config git libaio-dev libblkid-dev libkeyutils-dev liblz4-dev libsodium-dev liburcu-dev libzstd-dev zlib1g-dev uuid-dev libudev-dev libfuse3-dev fuse3 clang libclang-dev llvm-dev cargo rustc bindgen keyutils xxd python3 2>&1 | tail -3
rustc --version; cargo --version
cd ~ && rm -rf bcachefs-tools && git clone -q --branch v1.39.4 --depth 1 https://github.com/koverstreet/bcachefs-tools.git
cd bcachefs-tools && git rev-parse HEAD && git status --short | wc -l
make -j6 BCACHEFS_FUSE=1 2>&1 | tail -15
sudo make install BCACHEFS_FUSE=1 2>&1 | tail -3
bcachefs version
