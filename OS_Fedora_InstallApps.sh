#!/bin/bash

sudo dnf install vim screen gcc g++ gfortran curl octave texmaker

#use rpmfusion as source
sudo dnf install --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install --nogpgcheck http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

#update local cache
sudo dnf clean all
sudo dnf makecache
sudo dnf upgrade

#install 3rd-part media decoder
sudo dnf install gstreamer gstreamer-ffmpeg gstreamer-plugins-bad gstreamer-plugins-bad-free gstreamer-plugins-bad-nonfree gstreamer-plugins-base gstreamer-plugins-good gstreamer-plugins-ugly gstreamer-plugin-crystalhd gstreamer1-plugins-bad-freeworld gstreamer1-plugins-bad-free gstreamer1-plugins-good gstreamer1-libav ffmpeg

sudo dnf install steam qtox

