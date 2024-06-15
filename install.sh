#! /usr/bin/bash
mkdir ~/.dwm
cp -r ./* ~/.dwm
cd ~/.dwm
sudo make clean install
mv .xinitrc ~/.xinitrc
