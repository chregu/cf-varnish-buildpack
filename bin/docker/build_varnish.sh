set -e #halt on any error
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR

./install_packages.sh
#./compile_pcre.sh
./compile_varnish.sh
#./compile_vmod_statsd.sh
#./compile_vmod_timers.sh
#./compile_vmod_basicauth.sh
./cleanup.sh

exit 0;






