# ------------------------------------------------------------------------------------------------
# Copyright 2013 Jordon Bedwell.
# Apache License.
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file
# except  in compliance with the License. You may obtain a copy of the License at:
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed under the
# License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
# either express or implied. See the License for the specific language governing permissions
# and  limitations under the License.
# ------------------------------------------------------------------------------------------------

export APP_ROOT=$HOME
export LD_LIBRARY_PATH=$APP_ROOT/varnish/lib:$LD_LIBRARY_PATH


if [ -z "$VARNISH_MEMORY_LIMIT" ]; then
    VARNISH_MEMORY_LIMIT=$MEMORY_LIMIT
fi

# TODO, Make MEMORY_LIMIT adjustable, this now comes from CF itself
exec $APP_ROOT/varnish/sbin/varnishd -n /home/vcap/tmp/varnish -F -f $APP_ROOT/varnish/etc/varnish/default.vcl -a 0.0.0.0:$VCAP_APP_PORT -t 120 -w 50,1000,120 -s malloc,$VARNISH_MEMORY_LIMIT -T 127.0.0.1:6082 -p http_resp_hdr_len=32768 2>&1
# ------------------------------------------------------------------------------------------------
