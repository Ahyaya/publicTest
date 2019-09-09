#!/bin/bash
sudo apt-get update
sudo apt install vim screen zip gcc g++ gfortran git libstdc++6:i386 libgcc1:i386 libcurl4-gnutls-dev:i386 default-jre default-jdk
sudo apt install fcitx octave qtiplot texlive-full texmaker libreoffice

#sudo apt install google-chrome-stable chrome-gnome-shell gnome-shell-extensions
#sudo add-apt-repository ppa:webupd8team/atom  
#sudo apt-get update

cd ~/Documents
mkdir deepin_wine
cd deepin_wine
wget https://github.com/wszqkzqk/deepin-wine-ubuntu/archive/master.zip
unzip -o master.zip
cd deepin-wine-ubuntu-master
sudo bash install.sh
cd ~/Documents/deepin_wine
wget http://mirrors.aliyun.com/deepin/pool/non-free/d/deepin.com.qq.im/deepin.com.qq.im_8.9.19983deepin23_i386.deb
sudo dpkg -i deepin.com.qq.im_8.9.19983deepin23_i386.deb
#sudo add-apt-repository multiverse
#sudo apt update
sudo apt install steam vlc
