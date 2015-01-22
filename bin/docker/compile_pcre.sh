. config.sh



wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-$pcre_version.tar.gz
tar -xzvf pcre-$pcre_version.tar.gz
cd pcre-$pcre_version/

./configure --prefix=$build
make
make install
ldconfig # this is important otherwise varnish will compile but fail to load (not sure, copied from staticfile buildpack)

