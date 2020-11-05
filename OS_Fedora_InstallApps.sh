#!/bin/bash

#use rpmfusion as source
sudo dnf install --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install --nogpgcheck http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

#update local cache
sudo dnf clean all
sudo dnf makecache
sudo dnf upgrade

#install 3rd-part media decoder
sudo dnf install gstreamer gstreamer-ffmpeg gstreamer-plugins-bad gstreamer-plugins-bad-free gstreamer-plugins-bad-nonfree gstreamer-plugins-base gstreamer-plugins-good gstreamer-plugins-ugly gstreamer-plugin-crystalhd gstreamer1-plugins-bad-freeworld gstreamer1-plugins-bad-free gstreamer1-plugins-good gstreamer1-libav

#install generic compilers and tools
sudo dnf install vim screen gcc curl octave octave-devel python3-pip

#install generic compilers and tools
sudo dnf install ffmpeg libpng15 kolourpaint

#install LaTeX combos with CTeX toolkits
sudo dnf install texlive texlive-ctex texlive-cjk texlive-cjkpunct texlive-fandol texlive-xecjk texlive-preprint texlive-makecell texlive-multirow texlive-moreverb texlive-wrapfig texlive-revtex4 texlive-appendix texmaker

#some entertainment software
#sudo dnf install steam qtox
