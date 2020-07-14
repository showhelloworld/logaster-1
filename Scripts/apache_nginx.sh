#!/bin/bash

#To run this script use command: sh create-prod-user.sh -u username -p password -s site -t devcopyORproduction -r port -d devORprod

while getopts s:t:r:d: option
do
case "${option}"
in
s) SITE=${OPTARG};;
t) TYPE=${OPTARG};;
r) RPORT=${OPTARG};;
d) DIR=${OPTARG};;

esac
done

web_dir=/var/www/$TYPE/$SITE/

#Create apache conf for site
echo "<VirtualHost 127.0.0.1:$RPORT>
    DocumentRoot $web_dir

    ErrorLog /var/log/apache2/$DIR-$SITE.log
    CustomLog /var/log/apache2/$DIR-$SITE.log common

    <Directory $web_dir>
        AllowOverride All
        Options FollowSymLinks
        DirectoryIndex index.php

        <IfModule mod_php5.c>
            AddType application/x-httpd-php .php
        </IfModule>

    </Directory>
</VirtualHost>
" >> /etc/apache2/sites-available/$DIR-$SITE.conf


#Remove last line in file
cp /etc/nginx/sites-available/$DIR-logaster_pro.conf /etc/nginx/sites-available/$DIR-logaster_pro.conf.tmp
sed '$ d' /etc/nginx/sites-available/$DIR-logaster_pro.conf.tmp > /etc/nginx/sites-available/$DIR-logaster_pro.conf
rm -f /etc/nginx/sites-available/$DIR-logaster_pro.conf.tmp

#Add site to nginx conf
echo "        location /$SITE/ {
                proxy_set_header X-Real-IP  \$remote_addr;
                proxy_set_header X-Forwarded-For \$remote_addr;
                proxy_set_header Host \$host;
                proxy_pass  'http://127.0.0.1:$RPORT/';
        }
}" >> /etc/nginx/sites-available/$DIR-logaster_pro.conf

#Enable site in apache
a2ensite $DIR-$SITE.conf

# Reload Apahce and Nginx
service nginx reload
service apache2 reload
