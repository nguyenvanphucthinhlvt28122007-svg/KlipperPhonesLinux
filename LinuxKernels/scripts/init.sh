#!/bin/sh
set -eu

export DEBIAN_FRONTEND=noninteractive
arch="$(dpkg --print-architecture)"

sudo apt-get update
sudo apt-get install -y \
  binfmt-support \
  qemu-user-static \
  gcc-aarch64-linux-gnu \
  fakeroot \
  simg2img \
  img2simg \
  mkbootimg \
  bison \
  flex \
  pkg-config \
  "libncurses-dev:${arch}" \
  "libssl-dev:${arch}" \
  unzip \
  git \
  rsync

sudo mkdir -p /mnt/chroot
