set -e

. config.sh

cd $src
wget http://varnish-cache.org/_downloads/varnish-$varnish_version.tgz
tar -xvzf varnish-$varnish_version.tgz
cd varnish-$varnish_version


export PCRE_CFLAGS=-I$build/include
export PCRE_LIBS="-lpcre -L$build/lib"

./configure --localstatedir=/home/vcap/tmp/ --prefix=$build --with-pcre-config=$build/pcre-config  #--enable-debugging-symbols 
make
make install
cp varnish.m4 /usr/share/aclocal/
