
# Round 2...
# ubuntu 16.04.3 LTS

# https://www.youtube.com/watch?v=diQ239k7ZTE

sudo apt install apache2
sudo apt install mailutils
# osboxes.com

sudo vim /etc/postfix/main.cf
# inet_protocols = ipv4
# home_mailbox = Maildir/

sudo /etc/init.d/postfix reload

sudo apt install courier-pop -y
sudo apt install courier-imap -y

sudo apt install squirrelmail -y # it do works on ubuntu 16.04
sudo squirrelmail-configure
# D.
# courier
# 2
# 1 
# osboxes.com
# S
# Q
sudo ln -s /usr/share/squirrelmail /var/www/webmail

sudo vim /etc/apache2/sites-available/000-default.conf
# DocumentRoot /var/www
sudo /etc/init.d/apache2 restart
sudo maildirmake Maildir 

sudo adduser user1
sudo mail user1@osboxes.com  # no funciono
# usuario1
sudo systemctl enable courier-authdaemon
sudo service courier-authdaemon start
shutdown -r now

sudo adduser user2
cd /home/user2
sudo maildirmake Maildir/ -R
sudo chown user2:user2 Maildir/ -R

# OK :D
