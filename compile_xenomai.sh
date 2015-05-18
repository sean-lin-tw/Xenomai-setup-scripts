WORKSPACE=/home/bigshot/workspace_new

cd $WORKSPACE/xenomai-head
export PATH=$WORKSPACE/tools-master/arm-bcm2708/arm-bcm2708hardfp-linux-gnueabi/bin/:$PATH
./configure --host=arm-bcm2708hardfp-linux-gnueabi
cd src
mkdir dist
make install DESTDIR=`pwd`/dist
