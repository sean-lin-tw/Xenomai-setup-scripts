WORKSPACE=~/workspace_new/

cd $WORKSPACE
wget https://github.com/raspberrypi/tools/archive/master.tar.gz
tar xzfv master.tar.gz
#Download kernel
git clone -b rpi-3.8.y --depth 1 git://github.com/raspberrypi/linux.git linux-rpi-3.8.y
#Download Xenomai
git clone git://git.xenomai.org/xenomai-head.git xenomai-head
#Download minimal config
wget https://www.dropbox.com/s/dcju74md5sz45at/rpi_xenomai_config
