#!/bin/bash

#To run this script use command: sh create-prod-user.sh -u username -p password -t devcopyORproduction

while getopts u:p:s:t: option
do
case "${option}"
in
u) USER=${OPTARG};;
p) PASSWORD=${OPTARG};;
s) SITE=${OPTARG};;
t) TYPE=${OPTARG};;

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
echo -e "$web_dir $user_dir/$SITE none bind 0 0" >> /etc/fstab