#!/bin/sh

set -e

FWUP_CONFIG=$NERVES_DEFCONFIG_DIR/fwup.conf

# Make sure that the size matches fwup.conf
BOOTSIZE=31232
BOOTPART=$BINARIES_DIR/bootpart.bin

$BR2_EXTERNAL_NERVES_PATH/scripts/mksyslinuxfs.sh $BOOTPART $BOOTSIZE
cp $NERVES_DEFCONFIG_DIR/syslinux.cfg $BINARIES_DIR

# Run the common post-image processing for nerves
$BR2_EXTERNAL_NERVES_PATH/board/nerves-common/post-createfs.sh $TARGET_DIR $FWUP_CONFIG
