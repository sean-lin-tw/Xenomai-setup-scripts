WORKSPACE=/home/bigshot/workspace_new
KERNELDIR=$WORKSPACE/linux-rpi-3.8.y

cd $KERNELDIR
make clean

#Apply ipipe core pre-patch
patch -Np1 < ../xenomai-head/ksrc/arch/arm/patches/raspberry/ipipe-core-3.8.13-raspberry-pre-2.patch
#Apply Xenomai ipipe core patch
cd $WORKSPACE
./xenomai-head/scripts/prepare-kernel.sh --arch=arm --linux=linux-rpi-3.8.y --adeos=xenomai-head/ksrc/arch/arm/patches/ipipe-core-3.8.13-arm-4.patch
#Apply ipipe core post-patch
cd $KERNELDIR
patch -Np1 < ../xenomai-head/ksrc/arch/arm/patches/raspberry/ipipe-core-3.8.13-raspberry-post-2.patch
#Create build directory
cd $WORKSPACE
mkdir linux-rpi-3.8.y/build
#Configure kernel
cp $WORKSPACE/rpi_xenomai_config linux-rpi-3.8.y/build/.config
cd $KERNELDIR 
make mrproper
make ARCH=arm O=build oldconfig
#Compile Linux Kernel
export PATH=$WORKSPACE/tools-master/arm-bcm2708/arm-bcm2708hardfp-linux-gnueabi/bin/:$PATH
make -j8 ARCH=arm O=build CROSS_COMPILE=$WORKSPACE/tools-master/arm-bcm2708/arm-bcm2708hardfp-linux-gnueabi/bin/arm-bcm2708hardfp-linux-gnueabi-
#Install modules
make -j8 ARCH=arm O=build INSTALL_MOD_PATH=dist modules_install
#Install headers
make -j8 ARCH=arm O=build INSTALL_HDR_PATH=dist headers_install
find build/dist/include \( -name .install -o -name ..install.cmd \) -delete

