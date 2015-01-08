# ------------------------------------------------------------------------------------------------

export APP_ROOT=$HOME

apache_conf_file=$APP_ROOT/apache2/conf/httpd.conf
if [ -f $APP_ROOT/public/httpd.conf ]
then
  apache_conf_file=$APP_ROOT/public/httpd.conf
fi

mv $apache_conf_file $APP_ROOT/apache2/conf/orig.conf
erb $APP_ROOT/apache2/conf/orig.conf > $APP_ROOT/apache2/conf/httpd.conf

# ------------------------------------------------------------------------------------------------
echo "----> list of files and directory:$(ls -l)" 

for i in $(ls -d  $HOME/*/); do echo ${i%%/}; done

#export PATH=$PATH:$APP_ROOT/apache2/lib
#ldd $APP_ROOT/apache2/bin/httpd
cat $APP_ROOT/apache2/conf/httpd.conf

#ldconfig
grep -i "Listen" $APP_ROOT/apache2/conf/httpd.conf
#(tail -f -n 0 $APP_ROOT/apache2/logs/*.log &)
exec  $APP_ROOT/apache2/bin/httpd -k start -f $APP_ROOT/apache2/conf/httpd.conf
#exec $APP_ROOT/apache2/bin/apachectl start
# ------------------------------------------------------------------------------------------------
