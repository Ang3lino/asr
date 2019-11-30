#!/bin/sh

if [ $(id -u) != 0 ]; then 
    echo "Please execute as root"
    exit 1
fi

apt update 
apt upgrade

apt install net-tools -y
apt install vim -y
apt install git -y

# https://www.youtube.com/watch?v=ErzhbUusgdI
# use ssh on virtualbox, 
apt install ssh -y
# log in by typing ssh osboxes@127.0.0.1 -p 2222

# install postfix
# https://www.youtube.com/watch?v=SPu4tW_Zo0Y
apt install apache2 -y

apt install postfix -y 
# Internet site
# System mail name:
# osboxes.com

# edit 
cd Documents
cp /etc/postfix/main.cf main.cf
vim /etc/postfix/main.cf
# change 
# inet_protocols = all 
# to 
# inet_protocols = ipv4 
# add 
# home_mailbox = Maildir/

# restart
sudo /etc/init.d/postfix restart

sudo apt install courier-pop -y
# When asked "Create directories..." set NO

sudo apt install squirrelmail -y 
# Package not found

# https://askubuntu.com/questions/1058928/unable-to-locate-package-when-i-try-to-install-squirrelmail-on-ubuntu-18-04?noredirect=1
wget https://squirrelmail.org/countdl.php?fileurl=http%3A%2F%2Fprdownloads.sourceforge.net%2Fsquirrelmail%2Fsquirrelmail-webmail-1.4.22.zip
unzip *\.zip
cd squirrelmail*
./configure

# Setup
# D. Set pre-defined settings for specific IMAP servers
# courier. 
# 2. Server settings
# 1. Domain
# [example.com]: osboxes.com
# q
# y

cd ..
mv squirrelmail* squirrelmail
cd /var/www
# Como se tuvo que instalar squirrelmail de otra forma, se cambio en enlace simbolico
# sudo ln -s /usr/share/squirrelmail webmail
sudo ln -s ~/Documents/squirrelmail squirrelmail

cd /etc/apache2/sites-available
sudo vim 000-default.conf
# cambiar
# DocumentRoot /var/www/html
# a 
# DocumentRoot /var/www/

# Reinicie el servidor apache
sudo /etc/init.d/apache2 restart