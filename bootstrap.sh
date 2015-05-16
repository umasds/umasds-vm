#!/usr/bin/env bash

echo "Copy new apt sources list to VM ..."
cp /vagrant/conf/etc/apt/sources.list /etc/apt/sources.list

echo "Install key for CRAN repository ..."
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9

echo "Purge unused packages ..."
aptitude purge chef juju juju-core puppet -y

echo "Install recent Ubuntu upgrades ..."
aptitude update
aptitude upgrade -y

echo "Install basic tools ..."
aptitude install -y joe htop mc virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11 

echo "Install dictionaries-common and fix bug  ..."
aptitude install -y dictionaries-common
/usr/share/debconf/fix_db.pl

echo "Install LXDE ..."
aptitude install -y lxde

echo "Install Firefox, LibreOffice, and Gimp ..."
aptitude install -y firefox firefox-locale-de libreoffice libreoffice-l10n-de gimp

echo "Install English and German languages and set German as default ..."
aptitude install -y language-pack-en language-pack-en-base language-pack-gnome-en 
aptitude install -y language-pack-de language-pack-de-base language-pack-gnome-de wngerman wogerman wswiss 
dpkg-reconfigure locales
setxkbmap -model pc105 -layout de -variant basic
timedatectl set-timezone Europe/Berlin
locale-gen de_DE.UTF-8
update-locale LANG=de_DE.UTF-8
cp /vagrant/conf/etc/X11/xorg.conf /etc/X11/xorg.conf

echo "Install R from cran repository ..."
aptitude install -y r-base r-base-dev libjpeg62 r-base-core r-base-html r-recommended libgomp1 r-cran-mgcv libjpeg-dev libpng12-dev libgstreamer0.10-0 libgstreamer-plugins-base0.10-0

echo "Install RStudio ..."
wget --quiet http://download1.rstudio.org/rstudio-0.98.1103-amd64.deb
dpkg -i rstudio-0.98.1103-amd64.deb
rm rstudio-0.98.1103-amd64.deb

echo "Install git ..."
aptitude install -y git gitk git-gui gitg git-cola giggle

echo "Install spyder ..."
aptitude install -y spyder spyder3

echo "Install LaTeX ..."
aptitude install -y texmaker jabref texlive-base texlive-latex-base texlive-lang-german texlive-bibtex-extra biber texlive-fonts-recommended texlive-math-extra

echo "Clean up packages ..."
aptitude purge -y texlive-fonts-extra-doc texlive-fonts-recommended-doc texlive-latex-base-doc texlive-latex-extra-doc texlive-latex-recommended-doc texlive-pictures-doc texlive-pstricks-doc
aptitude purge -y linux-image-3.13.0-52-generic linux-headers-3.13.0-52 linux-headers-3.13.0-52-generic
apt-get clean
apt-get autoremove -y

echo "Fix lxdm shutdown bug ..."
echo "session required pam_systemd.so" >> /etc/pam.d/lxdm

echo "Enable autologin for user vagrant ..."
cp /vagrant/conf/etc/lxdm/default.conf /etc/lxdm/default.conf

echo "Copy config for mounting the /vagrant directory ..."
cp /vagrant/conf/etc/fstab /etc/fstab
cp /vagrant/conf/etc/rc.local /etc/rc.local

echo "Customize Firefox hompage ..."
cp /vagrant/conf/etc/xul-ext/ubufox.js /etc/xul-ext
cp /vagrant/conf/etc/xul-ext/homepage.properties /etc/xul-ext

echo "Customize desktop wallpaper ..."
mkdir -p /home/vagrant/.config/pcmanfm/LXDE
cp /vagrant/conf/home/vagrant/.config/pcmanfm/LXDE/desktop-items-0.conf /home/vagrant/.config/pcmanfm/LXDE/desktop-items-0.conf
cp /vagrant/conf/home/vagrant/sds.png /home/vagrant/sds.png

echo "Customize lxterminal config ..."
mkdir -p /home/vagrant/.config/lxterminal
cp /vagrant/conf/home/vagrant/.config/lxterminal/lxterminal.conf /home/vagrant/.config/lxterminal/

echo "Customize texmaker config (default to biber instead of bibtex) ..."
mkdir -p /home/vagrant/.config/xm1
cp /vagrant/conf/home/vagrant/.config/xm1/texmaker.ini /home/vagrant/.config/xm1/

echo "Set custom config ownership ..."
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
