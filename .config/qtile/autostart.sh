#!/bin/sh

# restore previous wallpaper
nitrogen --restore &


# start compositor (for transparency and other effects)
picom -f &

# start network manager applet
nm-applet &

# start clipboard manager
launchxfceclipboard &

# start notification daemon
/usr/lib/xfce4/notifyd/xfce4-notifyd &

# for polkit
# lxsession &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# turn on numlock at startup
numlockx on

# automatic sleep after 10 min
locker &

#hide mouse when not in use
unclutter &

# pamac tray icon
pamac-tray &

# start mailspring mailclient
mailspring --background &

# start jgmenu in background
jgmenu_run &
xcape -e 'Super_L=Super_L|Shift_L|space'
