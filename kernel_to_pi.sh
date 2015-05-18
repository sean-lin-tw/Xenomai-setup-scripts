WORKSPACE=/home/bigshot/workspace_new
BOOTDIR=$WORKSPACE/linux-rpi-3.8.y/arch/arm/boot
SDCARDBOOTDIR=/media/bigshot/boot
SDCARD_STORAGEDIR=/media/bigshot/13d368bf-6dbf-4751-8ba1-88bed06bef77
RTDMMODULEDIR=$WORKSPACE/GPIO_test/Raspberry_pi

# If you haven't load Raspian into Raspberry pi, uncomment the 2 lines below.
#sudo umount /dev/sdb1
#sudo dd if=2015-05-05-raspbian-wheezy.img of=/dev/mmcblk0 bs=4M

sudo cp $BOOTDIR/Image $SDCARDBOOTDIR/
mv $SDCARDBOOTDIR/Image $SDCARDBOOTDIR/kernel.img
sudo cp -r $WORKSPACE/linux-rpi-3.8.y/build/dist/lib/modules/3.8.13-core+/ $SDCARD_STORAGEDIR/lib/modules/
sudo cp -r $WORKSPACE/xenomai-head/src/dist/usr/xenomai $SDCARD_STORAGEDIR/usr/
sudo cp $RTDMMODULEDIR/irq-gpio-rtdm.ko $SDCARD_STORAGEDIR/home/

