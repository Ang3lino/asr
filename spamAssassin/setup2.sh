
# Round 2...
# ubuntu 16.04.3 LTS

# https://www.youtube.com/watch?v=diQ239k7ZTE

# Install
sudo apt install apache2
sudo apt install mailutils
# set osboxes.com

# configure
sudo vim /etc/postfix/main.cf
# inet_protocols = ipv4
# home_mailbox = Maildir/

# reload the service
sudo /etc/init.d/postfix reload

# install courier
sudo apt install courier-pop -y
sudo apt install courier-imap -y

# install squirrelmail
sudo apt install squirrelmail -y # it do works on ubuntu 16.04

# configure, change the following lines
sudo squirrelmail-configure
# D.
# courier
# 2
# 1 
# osboxes.com
# S
# Q
sudo ln -s /usr/share/squirrelmail /var/www/webmail

# Edit the following file
sudo vim /etc/apache2/sites-available/000-default.conf
# Set DocumentRoot as
# DocumentRoot /var/www

# restart the service
sudo /etc/init.d/apache2 restart
# Create the Maildir
sudo maildirmake Maildir 

# add an user
sudo adduser user1
# attempt to send a mail
sudo mail user1@osboxes.com  # it didn't work

# to solve the problem, execute
sudo systemctl enable courier-authdaemon
sudo service courier-authdaemon start

# restart the machine
shutdown -r now

# create a new user and try it again
sudo adduser user2
cd /home/user2
sudo maildirmake Maildir/ -R
sudo chown user2:user2 Maildir/ -R

# open squirrelmail

# OK :D

# boss, spamAssassin
# https://www.digitalocean.com/community/tutorials/how-to-install-and-setup-spamassassin-on-ubuntu-12-04

# Install spamassassin
sudo apt install spamassassin spamc

# Adding Spamassassin User
# To run Spamassassin you need to create a new user on your VPS.
# First add the group spams:
sudo groupadd spamd

# then add the user spamd with the home directory /var/log/spamassassin:
useradd -g spamd -s /bin/false -d /var/log/spamassassin spamd

# then create the directory /var/log/spamassassin:
mkdir /var/log/spamassassin

# and change the ownership of the directory to spams:
chown spamd:spamd /var/log/spamassassin


# setting up spamAssassin
sudo vim /etc/default/spamassassin
# To enable Spamassassin find the line
# change
# ENABLED=0
# to 
# ENABLED=1
# To enable automatic rule updates in order to get the latest spam filtering rules find the line
# CRON=0
# and change it to
# CRON=1
# Now create a variable named SAHOME with the Spamassassin home directory:

# SAHOME="/var/log/spamassassin/"
# Find and change the OPTIONS variable to

# OPTIONS="--create-prefs --max-children 2 --username spamd \
# -H ${SAHOME} -s ${SAHOME}spamd.log"

# This specifies the username Spamassassin will run under as spamd, as well as 
# add the home directory, create the log file, and limit the child processes that Spamassassin can run.
# If you have a busy server, feel free to increase the max-children value.
# Start the Spamassassin daemon by using the following code:
sudo service spamassassin restart


# configure postfix
# The emails still do not go through Spamassasin. To do that, open Postfix config file using:
sudo vim /etc/postfix/master.cf

# Find the the line
# smtp      inet  n       -       -       -       -       smtpd
# and add the following
# -o content_filter=spamassassin

# Now, Postfix will pipe the mail through Spamassassin.

# To setup after-queue content filter add the following line to the end of the file
# spamassassin unix -     n       n       -       -       pipe
#         user=spamd argv=/usr/bin/spamc -f -e  
#         /usr/sbin/sendmail -oi -f ${sender} ${recipient}
# For the changes to take effect restart postfix:
sudo service postfix restart
# Now postfix will use spamassassin as a spam filter.


# CONFIGURE SPAMASSASSIN ON YOUR VPS
# To get the maximum use of Spamassassin you have to create rules.
# Open the Spamassassin default rules file using:
sudo vim /etc/spamassassin/local.cf

# To activate a rules uncomment line remove the # symbol.
# To add a spam header to spam mail uncomment or add the line:
# rewrite_header Subject [***** SPAM _SCORE_ *****]
# Spamassassin gives a score to each mail after running different tests on it. The following line will mark the mail as spam if the score is more than the value specified in the rule.

# required_score           3.0
# To use bayes theorem to check mails, uncomment or add the line:
# use_bayes               1

# To enable bayes auto learning, uncomment or add the line:
# bayes_auto_learn        1
# After adding the above details, save the file and restart spam assassin.
service spamassassin restart

# testing 
# sudo vim /var/log/spamassassin/spamd.log
# no se creo tal archivo log


# baje el codigo fuente para usar los archivos 
# sample-spam.txt y sample-nospam.txt 
# SpamAssassin by Alan Schwartz
cd ~/Documents
git clone https://github.com/apache/spamassassin
cd spamassassin
spamassassin --test-mode < sample-spam.txt
spamassassin --test-mode < sample-nospam.txt

