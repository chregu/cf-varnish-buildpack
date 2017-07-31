set -e #halt on any error
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR

./install_packages_supervisor.sh
#./cleanup.sh

exit 0;






