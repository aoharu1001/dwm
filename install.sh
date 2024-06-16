#! /usr/bin/bash
mkdir ~/.dwm
cp -r ./* ~/.dwm
cd ~/.dwm
sudo make clean install
mv xinitrc ~/.xinitrc
sudo mv ./xinitrcsession-helper /usr/bin/xinitrcsession-helper
sudo mv ./xinitrc.desktop /usr/share/xsessions/xinitrc.desktop
