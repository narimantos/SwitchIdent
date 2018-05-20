#!/bin/sh
set -e
set -x

# Build and install devkitARM + ctrulib
mkdir -p $DEVKITPRO
cd $DEVKITPRO
wget https://github.com/devkitPro/pacman/releases/download/v1.0.0/devkitpro-pacman.deb
sudo dpkg -i devkitpro-pacman.deb
sudo dkp-pacman -S devkitA64 --noconfirm
rm devkitpro-pacman.deb

# Get latest libnx and overwrite bundled one
mkdir libnx-update && cd libnx-update
git clone https://github.com/switchbrew/libnx.git
cd libnx/
make && make install
cd ../../
rm -rf libnx-update/