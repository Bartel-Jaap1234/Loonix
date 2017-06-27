#!/bin/bash

sudo useradd nagios
sudo groupadd nagcmd
sudo usermod -a -G nagcmd nagios
sudo usermod -G nagcmd www-data
sudo apt-get install build-essential libgd2-xpm-dev openssl libssl-dev xinetc apache2-utils unzip
sudo apt-get install libssl-dev
sudo apt-get install zip unzip

cd ~
curl -L -O https://assets.nagios.com/downloads/nagioscore/releases/nagios-4.3.2.tar.gz
tar xvf nagios-*.tar.gz

cd nagios-*
./configure --with-nagios-group=nagios --with-command-group=nagcmd
make all
sudo make install
sudo make install-commandmode
sudo make install-init
sudo make install-config
sudo /usr/bin/install -c -m 644 sample-config/httpd.conf /etc/apache2/sites-available/nagios.conf

#cd ~
#curl -L -O http://nagios-plugins.org/download/nagios-plugins-2.2.1.tar.gz
#tar xvf nagios-plugins-*.tar.gz

#cd nagios-plugins-*
#./configure --with-nagios-user=nagios --with-nagios-group=nagios --with-openssl
#make
#sudo make install

#cd ~
#curl -L -O http://downloads.sourceforge.net/project/nagios/nrpe-2.x/nrpe-2.15/nrpe-2.15.tar.gz
#tar xvf nrpe-*.tar.gz

#cd nrpe-*
#./configure --enable-command-args --with-nagios-user=nagios --with-nagios-group=nagios --with-ssl=/usr/bin/openssl --with-ssl-lib=/usr/lib/x86_64-linux-gnu
#make all
#sudo make install
#sudo make install-xinetd
#sudo make install-daemon-config
