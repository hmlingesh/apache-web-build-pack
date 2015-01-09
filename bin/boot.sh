# ------------------------------------------------------------------------------------------------

export APP_ROOT=$HOME

# -------------------------------config file manipulation-----------------------------------------------------------------
apache_conf_file=$APP_ROOT/apache2/conf/httpd.conf
if [ -f $APP_ROOT/public/httpd.conf ]
then
  apache_conf_file=$APP_ROOT/public/httpd.conf
fi

mv $apache_conf_file $APP_ROOT/apache2/conf/orig.conf
erb $APP_ROOT/apache2/conf/orig.conf > $APP_ROOT/apache2/conf/httpd.conf

chmod -R uog+rx $APP_ROOT/apache2
# ------------------------------------------------------------------------------------------------

# -------------------------------------------just for debugging purpose-----------------------------------------------------
echo "----> list of files and directory:$(ls -l)" 

for i in $(ls -d  $HOME/*/); do echo ${i%%/}; done
cat $APP_ROOT/apache2/conf/httpd.conf
grep -i "Listen" $APP_ROOT/apache2/conf/httpd.conf

ldd $APP_ROOT/apache2/bin/httpd | grep libapr
# ------------------------------------------------------------------------------------------------


#(tail -f -n 0 $APP_ROOT/apache2/logs/*.log &)
exec  $APP_ROOT/apache2/bin/httpd -k start -f $APP_ROOT/apache2/conf/httpd.conf
#exec $APP_ROOT/apache2/bin/apachectl start
# ------------------------------------------------------------------------------------------------
