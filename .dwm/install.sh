#! /usr/bin/bash
echo "===Create a new folder for dwm in ~/.dwm"
mkdir ~/.dwm
echo "===Move files to ~/.dwm"
cp -r ./* ~/.dwm
echo "===Change work directory"
cd ~/.dwm
echo "===Make and install dwm"
sudo make clean install
echo "===Move profile to ~/.xprofile"
mv ./xprofile ~/.xprofile
echo "===Move dwm.desktop to /usr/share/xsessions/dwm.desktop"
sudo mv ./dwm.desktop /usr/share/xsessions/dwm.desktop
echo "===Install finished"
