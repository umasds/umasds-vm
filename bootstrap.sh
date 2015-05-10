#!/usr/bin/env bash

echo "Copy new apt sources list to VM ..."
cp /vagrant/conf/sources.list /etc/apt/sources.list

echo "Install key for CRAN repository ..."
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9

echo "Install recent Ubuntu upgrades ..."
apt-get update
apt-get upgrade -y

echo "Install basic GUI ..."
apt-get install -y joe aptitude htop mc lxde virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11 firefox firefox-locale-de libreoffice libreoffice-l10n-de gimp

echo "Install German language and set as default ..."
apt-get install -y language-pack-de language-pack-de-base language-pack-gnome-de wngerman wogerman wswiss 
dpkg-reconfigure locales
setxkbmap -model pc105 -layout de -variant basic
timedatectl set-timezone Europe/Berlin
locale-gen de_DE.UTF-8
update-locale LANG=de_DE.UTF-8

echo "Fix dictionaries bug ..."
/usr/share/debconf/fix_db.pl

echo "Install R from cran repository ..."
apt-get install -y r-base r-base-dev libjpeg62 r-base-core r-base-html r-recommended libgomp1 r-cran-mgcv libjpeg-dev libpng12-dev libgstreamer0.10-0 libgstreamer-plugins-base0.10-0

echo "Install RStudio ..."
wget --quiet http://download1.rstudio.org/rstudio-0.98.1103-amd64.deb
dpkg -i rstudio-0.98.1103-amd64.deb

echo "Install git ..."
apt-get install -y git gitk git-gui gitg

echo "Install spyder ..."
apt-get install -y spyder spyder3

echo "Install LaTeX ..."
apt-get install -y texmaker jabref texlive-base texlive-latex-base texlive-lang-german

echo "Fix lxdm shutdown bug ..."
echo "session required pam_systemd.so" >> /etc/pam.d/lxdm

echo "Copy UMASDS specific config files ..."
cp /vagrant/conf/xorg.conf /etc/X11/xorg.conf
cp /vagrant/conf/sds.png /home/vagrant/sds.png
mkdir -p /home/vagrant/.config/lxterminal
cp /vagrant/conf/lxterminal.conf /home/vagrant/.config/lxterminal/
cp /vagrant/conf/lxdm.conf /etc/lxdm/default.conf
cp /vagrant/conf/firefox.js /etc/firefox
mkdir -p /home/vagrant/.config/pcmanfm/LXDE
cp /vagrant/conf/desktop-items-0.conf /home/vagrant/.config/pcmanfm/LXDE/desktop-items-0.conf
chown -R vagrant:vagrant /home/vagrant/.config

echo "Set some convience links ..."
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
