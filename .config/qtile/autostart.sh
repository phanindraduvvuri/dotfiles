#!/bin/sh

# restore previous wallpaper
# nitrogen --restore &
nitrogen --set-zoom-fill --random &


# start compositor (for transparency and other effects)
picom -f &

# start network manager applet
nm-applet &

# start clipboard manager
launchxfceclipboard &

# start notification daemon
/usr/lib/xfce4/notifyd/xfce4-notifyd &

# generate new application menu file at every login
gen_menufile > /home/phanindra/xmenu/menu &

# for polkit
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# turn on numlock at startup
numlockx on

# automatic sleep after 10 min
locker &
