#!/usr/bin/env bash

## Copy new apt sources list to VM
cp /vagrant/conf/sources.list /etc/apt/sources.list

## install key for CRAN repository
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9

## install recent basic ubuntu upgrades
apt-get update
apt-get upgrade -y

## install basic GUI
apt-get install -y joe aptitude htop mc lxde virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11 firefox firefox-locale-de libreoffice libreoffice-l10n-de gimp

## install German language and set as default
apt-get install -y language-pack-de language-pack-de-base language-pack-gnome-de wngerman wogerman wswiss 
dpkg-reconfigure locales
setxkbmap -model pc105 -layout de -variant basic
timedatectl set-timezone Europe/Berlin
locale-gen de_DE.UTF-8
update-locale LANG=de_DE.UTF-8

## fix bug
/usr/share/debconf/fix_db.pl

## install R from cran repository
apt-get install -y r-base r-base-dev libjpeg62 r-base-core r-base-html r-recommended libgomp1 r-cran-mgcv libjpeg-dev libpng12-dev libgstreamer0.10-0 libgstreamer-plugins-base0.10-0

## install RStudio
wget --quiet http://download1.rstudio.org/rstudio-0.98.1103-amd64.deb
dpkg -i rstudio-0.98.1103-amd64.deb

## install git
apt-get install -y git gitk git-gui gitg

## install spyder - just in case ;)
apt-get install -y spyder spyder3

## install LaTeX
apt-get install -y texmaker jabref texlive-base texlive-latex-base texlive-lang-german

## fix lxdm shutdown bug
echo "session required pam_systemd.so" >> /etc/pam.d/lxdm

## copy UMASDS specific config files
cp /vagrant/conf/xorg.conf /etc/X11/xorg.conf
cp /vagrant/conf/sds.png /home/vagrant/sds.png
mkdir -p /home/vagrant/.config/lxterminal
cp /vagrant/conf/lxterminal.conf /home/vagrant/.config/lxterminal/
chown -R vagrant:vagrant /home/vagrant/.config
cp /vagrant/conf/lxdm.conf /etc/lxdm/default.conf
cp /vagrant/conf/firefox.js /etc/firefox

## set some convience links
ln -sf /vagrant /home/vagrant/Dokumente
mkdir -p /home/vagrant/Desktop
chown -R vagrant:vagrant /home/vagrant/Desktop
ln -sf /vagrant /home/vagrant/Desktop/Dokumente
cp /usr/share/applications/rstudio.desktop /home/vagrant/Desktop/
cp /usr/share/applications/galculator.desktop /home/vagrant/Desktop/
cp /usr/share/applications/spyder.desktop /home/vagrant/Desktop/
cp /usr/share/applications/spyder3.desktop /home/vagrant/Desktop/
cp /usr/share/applications/leafpad.desktop /home/vagrant/Desktop/
cp /usr/share/applications/lxterminal.desktop /home/vagrant/Desktop/
cp /usr/share/applications/gitg.desktop /home/vagrant/Desktop/
cp /usr/share/applications/firefox.desktop /home/vagrant/Desktop/
cp /usr/share/applications/texmaker.desktop /home/vagrant/Desktop/
cp /usr/share/applications/jabref.desktop /home/vagrant/Desktop/
cp /usr/share/applications/libreoffice-writer.desktop /home/vagrant/Desktop/
cp /usr/share/applications/libreoffice-calc.desktop /home/vagrant/Desktop/
cp /usr/share/applications/gimp.desktop /home/vagrant/Desktop/

## start LXDE
/etc/init.d/lxdm start
