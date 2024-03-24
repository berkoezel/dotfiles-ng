dwmblocks &
xset -dpms
lxpolkit &
xrdb -merge ~/.Xresources 
xset -dpms
setterm -blank 0 -powerdown 0
xset s off
xsetroot -cursor_name Left_ptr
nitrogen --restore &
nm-applet &
pasystray & 
numlockx &
picom &
flameshot &
diodon &
wmname LG3D
udiskie -a &
blueman-applet &
redshift -O 3500 &
dunst &
pipewire &
pipewire-pulse &
wireplumber &
exec dbus-launch --exit-with-session dwm
