export ARCH=arm 
export TOOLCHAIN=/opt/toolchains/arm-2009q3
export TOOLPREFIX=arm-none-linux-gnueabi
export PATH=$PATH:${TOOLCHAIN}/bin:/usr/java/jdk1.6.0_21/bin
export CROSS_COMPILE=${TOOLCHAIN}/bin/${TOOLPREFIX}-
export CC=${TOOLCHAIN}/bin/${TOOLPREFIX}-gcc
export LD=${TOOLCHAIN}/bin/${TOOLPREFIX}-ld
export AR=${TOOLCHAIN}/bin/${TOOLPREFIX}-ar
export RANLIB=${TOOLCHAIN}/arm-eabi/bin/ranlib
export PATH=$PATH:${TOOLCHAIN}/bin
export PATH=$PATH:${TOOLCHAIN}/
export PATH=$PATH:${TOOLCHAIN}/lib
export CFLAGS="-static -Os -fstack-protector -fstack-protector-all -std=c99"
export LDFLAGS="-static -Os"
export CPPFLAGS="-static -Os"
export ANDROID_BUILD_TOP=/Everything/Android/ICSCyanobuildsystem
export KBUILD_BUILD_VERSION="cyano@onecosmic"
echo "ARM environment set"
