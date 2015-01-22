set -e

. config.sh

apt-get install -y libreadline6-dev

cd $src
wget --no-check-certificate https://repo.varnish-cache.org/source/varnish-$varnish_version.tar.gz
tar -xvzf varnish-$varnish_version.tar.gz
cd varnish-$varnish_version


export PCRE_CFLAGS=-I$build/include
export PCRE_LIBS="-lpcre -L$build/lib"


./configure --prefix=$build --with-pcre-config=$build/pcre-config
make
make install
