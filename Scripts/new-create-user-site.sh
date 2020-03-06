#!/bin/bash
  
#To run this script use command: sh create-prod-user.sh -u username -p password -t devcopyORproduction -r port -d devORprod

while getopts u:p:s:t: option
do
case "${option}"
in
u) USER=${OPTARG};;
p) PASSWORD=${OPTARG};;
s) SITE=${OPTARG};;
t) TYPE=${OPTARG};;
r) PORT=${OPTARG};;
d) DIR=${OPTARG};;

esac
done

web_dir=/var/www/$TYPE/$SITE/
user_dir=/home/$USER

adduser $USER --quiet --disabled-password --ingroup www-data --shell /bin/false
echo "$USER:$PASSWORD" | chpasswd
chown root:www-data /home/$USER/

mkdir $web_dir
chmod 750 $web_dir
chown $USER:www-data $web_dir

mkdir $user_dir/$SITE
mount --bind $web_dir $user_dir/$SITE
echo "$web_dir $user_dir/$SITE none bind 0 0" >> /etc/fstab

#Create apache conf for site
echo "<VirtualHost 127.0.0.1:$PORT>
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
" >> /etc/apache2/site-available/$DIR-$SITE.conf

#Enable site in apache
a2ensite /etc/apache2/sites-available/$DIR-$SITE.conf

#Remove last line in file
cp /etc/nginx/site-available/$DIR-logaster_pro.conf /etc/nginx/site-available/$DIR-logaster_pro.conf.tmp
sed '$ d' /etc/nginx/site-available/$DIR-logaster_pro.conf.tmp > /etc/nginx/site-available/$DIR-logaster_pro.conf
rm -f /etc/nginx/site-available/$DIR-logaster_pro.conf.tmp

#Add site to nginx conf
echo "        location /$SITE/ {
                proxy_set_header X-Real-IP  $remote_addr;
                proxy_set_header X-Forwarded-For $remote_addr;
                proxy_set_header Host $host;
                proxy_pass  'http://127.0.0.1:$PORT/';
        }
}" >> /etc/nginx/site-available/$DIR-logaster_pro.conf

# Reload Apahce and Nginx
service nginx reload
service apache2 reload
