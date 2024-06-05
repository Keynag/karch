#!/bin/bash

mkdir tools && cd tools;

git clone https://aur.archlinux.org/alhp-keyring.git && git clone https://aur.archlinux.org/alhp-mirrorlist.git;
git clone https://aur.archlinux.org/upd72020x-fw.git && git clone https://aur.archlinux.org/paru.git;
git clone https://aur.archlinux.org/ananicy-cpp.git && git clone https://aur.archlinux.org/cachyos-ananicy-rules-git.git
git clone https://aur.archlinux.org/xpadneo-dkms.git && gpg --import ~/karch/system/anonfunc.asc;

sudo pacman-key --init && sudo pacman-key --populate;

sudo pacman -S llvm clang lld mold openmp --needed;

sudo cp -r ~/karch/system/makepkg.conf /etc/makepkg.conf;

cd ~/tools/alhp-keyring && makepkg -sric;

cd ~/tools/alhp-mirrorlist && makepkg -sric;

cd ~/tools/upd72020x-fw && makepkg -sric;

cd ~/tools/paru && makepkg -sric;

cd ~/tools/xpadneo-dkms && makepkg -sric;

cd ~/tools/ananicy-cpp && makepkg -sric;

cd ~/tools/cachyos-ananicy-rules-git && makepkg -sric;

sudo systemctl enable --now ananicy-cpp;

sudo cp -r ~/karch/system/pacman.conf /etc/pacman.conf;

sudo cp -r ~/karch/system/environment /etc/environment;

sudo cp -r ~/karch/system/geoclue.conf /etc/geoclue/geoclue.conf;

sudo systemctl mask NetworkManager-wait-online.service;

sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/bobafetthotmail/refind-theme-regular/master/install.sh)"

cd ~ && sudo rm -r ~/tools/ && sudo pacman -Syyuu;

echo "ALL GOOD KEYN73 :)" && shutdown -r




