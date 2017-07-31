set -e
. config.sh


# Remove extras (help, utilities etc)

rm -f $build/bin/varnishtest
rm -f $build/bin/pcre*
rm -rf $build/share
rm -rf $build/include
rm -rf $build/lib/pkgconfig
find $build/lib/ -name "*.a" -exec rm {} \;
find $build/lib/ -name "*.la" -exec rm {} \;

mkdir -p $build/share/doc/varnish
cp $src/varnish-$varnish_version/LICENSE $build/share/doc/varnish

# Archive it all up
mkdir -p $target
cd $build
cd ../varnish/
tar -zcvpf $target/varnish-$varnish_version.tar.gz .
