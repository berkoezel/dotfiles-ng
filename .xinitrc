dwmblocks &
#xinput set-prop 19 "Device Enabled" 0
xset -dpms
lxpolkit &
redshift -O 3500 &
xrdb -merge ~/.Xresources 
xsetroot -cursor_name Left_ptr
bash /usr/local/bin/hdmi_sound_toggle.sh
nitrogen --restore &
volctl &
nm-applet &
numlockx &
picom &
flameshot &
clipit -d &
pipewire &
pipewire-pulse &
pipewire-media-session &
wmname LG3D
udiskie -a &
xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
xrandr --output HDMI-1-2 --primary --pos 0x0 --mode 1920x1080 --output eDP-1-1 --pos 1920x0 --mode 1920x1080
xrandr --dpi 100
exec dwm 

