#!/bin/bash

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
xrandr --output HDMI-1-2 --primary --pos 0x0 --mode 1920x1080 --output eDP-1-1 --pos 1920x0 --mode 1920x1080
xrandr --dpi 100

IFS=$'\n'
FEH="feh --bg-scale '/home/berk/Pics/ravens.jpg' --bg-scale '/home/berk/Pics/ravens.jpg'"
IMPORT_XRDB="xrdb -merge ~/.Xresources"
SET_CURSOR="xsetroot -cursor_name Left_ptr"
#REDSHIFT="redshift -x && redshift -O 3500"
UDISKIE="udiskie -a"
SETWMNAME="wmname LG3D"
CLIPIT="clipit -d"

APPS=($FEH $IMPORT_XRDB $SET_CURSOR $REDSHIFT $UDISKIE $CLIPIT "lxpolkit" "dunst" "xcompmgr" "volumeicon" "numlockx" "nm-applet")

for i in ${APPS[@]}; do
	 killall $(echo $i  | head -n1 | cut -d " " -f1)
	 sh -c "$i" &
done
