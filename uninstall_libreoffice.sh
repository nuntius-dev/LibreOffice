#!/bin/bash
set -e

# Purge LibreOffice
apt-get remove --purge -y libreoffice* 
apt-get autoremove -y
apt-get autoclean

# Revert Theme
rm -rf ~/libreoffice-ms-theme
git clone --depth=1 https://github.com/Botspot/libreoffice-ms-theme ~/libreoffice-ms-theme
~/libreoffice-ms-theme/revert.sh
rm -rf ~/libreoffice-ms-theme

# Clean up Desktop Shortcut
rm -f $HOME/Desktop/libreoffice-startcenter.desktop

echo "LibreOffice and its configurations have been removed successfully."
