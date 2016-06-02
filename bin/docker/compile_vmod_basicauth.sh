set -e

. config.sh


cd $src


wget http://download.gnu.org.ua/release/vmod-basicauth/vmod-basicauth-1.3.tar.gz

tar -xzf vmod-basicauth-1.3.tar.gz

cd vmod-basicauth-1.3


./configure VARNISHSRC=$src/varnish-$varnish_version --prefix=$build    --enable-debugging-symbols --with-vmoddir=$build/lib/varnish/vmods/
make
make install
#libtool --finish /app/varnish/lib/varnish/vmods/