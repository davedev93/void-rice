#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "The script has to be run as root."
  exit
fi

echo "Checking directories"
mkdir -p /usr/local/bin/
mkdir -p /usr/share/themes/

pushd software/dwm
echo "Installing dwm"
make install

popd && pushd software/dmenu
echo "Installing dmenu"
make install 

popd && pushd software/slstatus
echo "Installing slstatus"
make install

popd && pushd software/st
echo "Installing st"
make install

popd && pushd software/vpm
echo "Installing vpm"
cp vpm /usr/local/bin/vpm

popd && pushd software/vsv
echo "Installing vsv"
cp vsv /usr/local/bin/vsv

popd
echo "Installing themes"
cp -r themes/Shades* /usr/share/themes/

echo "Install finished. Add software to .xinitrc to launch the DE with startx,
or copy the provided .xinitrc file to your home directory (backup the old one!)"
