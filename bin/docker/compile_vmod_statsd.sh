set -e

. config.sh

cd $src

ls -l $build

git clone https://github.com/ksperis/libvmod-statsd.git
cd libvmod-statsd
export PKG_CONFIG_PATH=/root/src/varnish-4.1.2/
./autogen.sh
./configure VARNISHSRC=$src/varnish-$varnish_version   --prefix=$build  VMODDIR=$build/lib/varnish/vmods/  #  --enable-debugging-symbols
 
make
make install
libtool --finish /app/varnish/lib/varnish/vmods/