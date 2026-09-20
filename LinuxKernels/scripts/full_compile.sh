#!/usr/bin/env bash
source ./env.sh
set -euo pipefail

echo $CROSS_COMPILE
echo $ARCH
echo $CC

export DEBIAN_FRONTEND=noninteractive
arch="$(dpkg --print-architecture)"

# Install required build dependencies just before compilation to ensure
# they aren't removed or messed up by earlier setup scripts.
sudo apt-get update
sudo apt-get install -y \
  bc \
  bison \
  flex \
  pahole \
  libncurses-dev \
  debhelper \
  debhelper-compat \
  fakeroot \
  "libssl-dev:${arch}" \
  "libdw-dev:${arch}" \
  "libelf-dev:${arch}"

sudo apt-get install --reinstall -y "libssl-dev:${arch}"

cd ./linux
make clean
make olddefconfig
rm -rf ./debian
make bindeb-pkg -j$(nproc)
cd ..
