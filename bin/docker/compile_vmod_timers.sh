set -e

. config.sh

cd $src

ls -l $build

git clone https://github.com/jib/libvmod-timers.git
cd libvmod-timers
./autogen.sh
./configure VARNISHSRC=$src/varnish-$varnish_version --prefix=$build  VMODDIR=$build/lib/varnish/vmods/
make
make install
libtool --finish /app/varnish/lib/varnish/vmods/