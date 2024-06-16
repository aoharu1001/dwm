#! /usr/bin/bash
echo "Create a new folder for dwm in ~/.dwm\n"
mkdir ~/.dwm
echo "Move files to ~/.dwm\n"
cp -r ./* ~/.dwm
echo "Change work directory\n"
cd ~/.dwm
echo "Make and install dwm\n"
sudo make clean install
echo "Move profile to ~/.xprofile\n"
mv ./xprofile ~/.xprofile
echo "Move dwm.desktop to /usr/share/xsessions/dwm.desktop\n"
sudo mv ./dwm.desktop /usr/share/xsessions/dwm.desktop
echo "Install finished\n"
