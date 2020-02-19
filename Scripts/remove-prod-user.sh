#!/bin/bash

#To run this script use command: sh remove-prod-user.sh -u username -s site -t devcopyORproduction

while getopts u:s:t: option
do
case "${option}"
in
u) USER=${OPTARG};;
s) SITE=${OPTARG};;
t) TYPE=${OPTARG};;

esac
done

web_dir=/var/www/$TYPE/$SITE/
user_dir=/home/$USER

umount $user_dir/$USER

sudo userdel $USER
sudo rm -rf $user_dir
sudo rm -rf $web_dir
