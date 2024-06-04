#!/bin/bash


er=alsa_output.pci-0000_00_1f.3.analog-stereo
hdmi=alsa_output.pci-0000_03_00.1.hdmi-stereo-extra2

if pactl get-default-sink | grep $er; then
    $(pactl set-default-sink $hdmi)
else
    $(pactl set-default-sink $er)
fi
