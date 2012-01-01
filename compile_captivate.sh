#!/bin/bash

PARAM=$1
PARAMTWO=$2

if [ "$PARAM" == "new" ]; then
	let RELVER=$RELVER+1
fi

if [ "$PARAM2" == "new" ]; then
        let RELVER=$RELVER+1
fi

RELVER=`cat .version`

if [ "${PARAM}" == "BIGMEM" ]; then
        SUFFIX="_BIGMEM" 
else 
	SUFFIX=""
fi

. ./setenv.sh
cp arch/arm/configs/aries_captivatemtd_defconfig .config
 echo "building kernel"
 sed -i 's/^.*FB_VOODOO.*$//' .config
 echo 'CONFIG_FB_VOODOO=n
 CONFIG_FB_VOODOO_DEBUG_LOG is not set' >> .config
#echo "CONFIG_CPU_FREQ_DEBUG=n
#CONFIG_BT_BNEP_MC_FILTER=n
#CONFIG_BT_BNEP_PROTO_FILTER=n" >> .config

if [ "${PARAM}" == "BIGMEM" ]; then
        echo "CONFIG_S5PV210_BIGMEM=y" >>.config
else
        echo "# CONFIG_S5PV210_BIGMEM is not set" >>.config
fi

make -j5

echo "creating boot.img"
./scripts/mkshbootimg.py release/boot.img arch/arm/boot/zImage ./ramdisks//ramdisk.img ./ramdisks/ramdisk-recovery.img

echo "launching packaging script"
./release/doit_captivate.sh ${RELVER}v${SUFFIX}

mv release/ICS_Captivate*.zip ~/Dropbox/Public/phonestuff/kernel/

