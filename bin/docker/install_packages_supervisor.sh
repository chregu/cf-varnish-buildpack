set -e

apt-get update
apt-get install -fy wget python-setuptools

cd ~
wget --no-check-certificate https://pypi.python.org/packages/source/s/supervisor/supervisor-3.0.tar.gz

tar -xzf supervisor-3.0.tar.gz
cd ~/supervisor-3.0

mkdir -p /tmp/staged/app/supervisor//lib/python2.7/site-packages/
cp -r /usr/lib/python2.7/dist-packages/* /tmp/staged/app/supervisor//lib/python2.7/site-packages/
export PYTHONPATH=/tmp/staged/app/supervisor/lib/python2.7/site-packages/
python setup.py install --prefix=/tmp/staged/app/supervisor/
cd /tmp/staged/app/
mkdir -p supervisor/etc/conf.d
./supervisor/bin/echo_supervisord_conf > supervisor/etc/supervisord.conf
echo "[include]" >> supervisor/etc/supervisord.conf
echo "files = conf.d/*.ini" >> supervisor/etc/supervisord.conf
sed -i -e "s/loglevel=info/loglevel=debug/g" supervisor/etc/supervisord.conf
sed -i -e "s/loglevel=info/loglevel=debug/g" supervisor/etc/supervisord.conf
sed -i -e "s/logfile=\/tmp\/supervisord.log/logfile=\/dev\/stdout/g" supervisor/etc/supervisord.conf
sed -i -e "s/logfile_maxbytes=50MB/logfile_maxbytes=0/g" supervisor/etc/supervisord.conf
cd supervisor
tar -czf /root/cf/supervisor-3.0b2.tar.gz .
