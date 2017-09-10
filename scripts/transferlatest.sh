#!/bin/sh

if [ $# -lt 1 ]; then
	echo "need path to btrfs partition mountpoint on external disk"
	exit 1
fi

BACKUPDIR=${1%/}

#if [ `df -T | grep $BACKUPDIR | grep "btrfs" | wc -l` -ne "1" ]; then
#	echo "invalid mount point"
#	exit 1
#fi

ROOTSNAPSHOTS=.snapshots
HOMESNAPSHOTS=home/.snapshots

max=0
for FILE in /$ROOTSNAPSHOTS/*
do
	FILE=`basename $FILE`
	if [ $FILE -ge $max ]; then
		max=$FILE
	fi
done
SELECTEDROOT=$max

max=0
for FILE in /$HOMESNAPSHOTS/*
do
	FILE=`basename $FILE`
	if [ $FILE -ge $max ]; then
		max=$FILE
	fi
done
SELECTEDHOME=$max

cd $BACKUPDIR && mkdir -p .snapshots || exit 1

rsync -aix --delete --exclude="home/" /$ROOTSNAPSHOTS/$SELECTEDROOT/snapshot/* $BACKUPDIR/
rsync -aix --delete /$HOMESNAPSHOTS/$SELECTEDHOME/snapshot/* $BACKUPDIR/home
#btrfs subvolume snapshot -r $BACKUPDIR/ $BACKUPDIR/.snapshots/`date +%y-%m-%d-%H-%M`


