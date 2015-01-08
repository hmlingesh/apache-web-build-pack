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

conf_file=$APP_ROOT/nginx/conf/nginx.conf
if [ -f $APP_ROOT/public/nginx.conf ]
then
  conf_file=$APP_ROOT/public/nginx.conf
fi

apache_conf_file=$APP_ROOT/apache2/conf/httpd.conf
if [ -f $APP_ROOT/public/httpd.conf ]
then
  apache_conf_file=$APP_ROOT/public/httpd.conf
fi

mv $conf_file $APP_ROOT/nginx/conf/orig.conf
erb $APP_ROOT/nginx/conf/orig.conf > $APP_ROOT/nginx/conf/nginx.conf

mv $apache_conf_file $APP_ROOT/apache2/conf/orig.conf
erb $APP_ROOT/apache2/conf/orig.conf > $APP_ROOT/apache2/conf/httpd.conf

# ------------------------------------------------------------------------------------------------
echo "----> list of files and directory:$(ls -l)" 

#echo "----> list of files and directory:$(ls -d $HOME)" 

for i in $(ls -d  $HOME/*/); do echo ${i%%/}; done

#export PATH=$PATH:$APP_ROOT/apache2/lib
echo "lib:$(ls -l /usr/local/lib/)"

#ldd $APP_ROOT/apache2/bin/httpd
#cat $APP_ROOT/nginx/conf/nginx.conf
cat $APP_ROOT/apache2/conf/httpd.conf
(tail -f -n 0 $APP_ROOT/nginx/logs/*.log &)
#exec $APP_ROOT/nginx/sbin/nginx -p $APP_ROOT/nginx -c $APP_ROOT/nginx/conf/nginx.conf
#exec  $APP_ROOT/apache2/bin/httpd -k start -f $APP_ROOT/apache2/conf/httpd.conf
#exec $APP_ROOT/apache2/bin/apachectl start
# ------------------------------------------------------------------------------------------------
