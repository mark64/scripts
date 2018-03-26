#!/bin/sh

if [ $# -ne 1 ]; then
	printf "need the device name"
	exit 1
fi

SDCARD=$1
dd if=/dev/$SDCARD bs=1M conv=fsync status=progress | gzip > $SDCARD.img.gz
