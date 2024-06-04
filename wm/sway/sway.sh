#!/bin/bash

sudo pacman -S sway swaybg xdg-desktop-portal-gtk jq lxsession-gtk3 ly --needed && sudo systemctl enable ly;
paru -S autotiling;
cp -r ~/Karch/wm/sway/sway ~/.config/ && echo "SWAY POSTAVLEN :)"

