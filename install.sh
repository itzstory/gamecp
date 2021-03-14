#!/bin/bash
apt-get update -y
apt-get install apache2 mysql-server php5-mysql php5 libapache2-mod-php5 php5-mcrypt -y
apt-get install unzip wget -y

cd /var/www/html
rm -rf index.html
wget http://download1644.mediafire.com/g18ighj8ucmg/q6ixl638pt6ct2s/webroot.zip
unzip webroot.zip
rm -rf webroot.zip
cd .. 
chmod -R 777 html

mysql -uroot -p$spass -e "CREATE DATABASE gcpstory; CREATE USER 'gcpstory'@localhost IDENTIFIED BY 'gcpstory22'; GRANT ALL PRIVILEGES ON gcpstory.* TO 'gcpstory'@localhost; use gcpstory;"


/etc/init.d/apache2 restart
/etc/init.d/mysql restart

clear

echo "."
echo "."
echo "Completed"
echo "DB Details: dbuser,name: gcpstory , dbpw: gcpstory22"
echo "After installation, remove folder /installer/ manually"
