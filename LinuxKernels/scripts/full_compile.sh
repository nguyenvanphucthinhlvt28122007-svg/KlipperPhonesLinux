source ./env.sh
set -e

echo $CROSS_COMPILE
echo $ARCH
echo $CC

cd ./linux
make clean
rm -rf ./debian
make bindeb-pkg -j$(nproc)
cd ..

# ./umount_rootfs.sh
# ./mount_rootfs.sh

