#!/bin/bash

sudo pacman -S gdb ninja gcc cmake meson libxcb xcb-proto xcb-util xcb-util-keysyms libxfixes libx11 libxcomposite xorg-xinput libxrender pixman wayland-protocols cairo seatd libxkbcommon xcb-util-wm xorg-xwayland libinput libliftoff libdisplay-info cpio tomlplusplus hyprlang hyprcursor hyprwayland-scanner xcb-util-errors --needed
git clone --recursive https://github.com/hyprwm/Hyprland && cd Hyprland;
make all && sudo make install;
sudo pacman -S swaybg lxsession-gtk3 sddm xdg-desktop-portal-hyprland && sudo systemctl enable sddm.service;
cp -r ~/karch/wm/hypr/hypr ~/.config/
cp -r ~/karch/wm/wal ~/.config/
sudo rm -r ~/Hyprland && echo "Hypr WoRk NiCe :)"
