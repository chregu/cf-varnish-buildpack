set -e

. config.sh

cd $src
wget --no-check-certificate https://repo.varnish-cache.org/source/varnish-$varnish_version.tar.gz
tar -xvzf varnish-$varnish_version.tar.gz
cd varnish-$varnish_version


export PCRE_CFLAGS=-I$build/include
export PCRE_LIBS="-lpcre -L$build/lib"

./configure --localstatedir=/home/vcap/tmp/ --prefix=$build --with-pcre-config=$build/pcre-config  #--enable-debugging-symbols 
make
make install
cp varnish.m4 /usr/share/aclocal/
