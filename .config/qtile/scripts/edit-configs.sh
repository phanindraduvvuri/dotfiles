declare options=("aliases
bash
bspwm
dmenu
dunst
herbstluftwm
neofetch
nvim
picom
polybar
qtile
qutebrowser
rofi
sxhkd
termite
starship
vim
xinitrc
Xreasources
zathura
zsh"
)

# choice=$(echo -e "${options[@]}" | rofi -dmenu -p "Edit config files")
# choice=$(echo -e "${options[@]}" | dmenu -g 5 -h 32 -l 3 -p "edit configs:" -fn "mononoki Nerd Font")
choice=$(echo -e "${options[@]}" | dmenu -p "edit configs:" -h 32)

case "$choice" in
    aliases)
        choice="/home/phanindra/.aliases"
        ;;
    bash)
        choice="/home/phanindra/.bashrc"
        ;;
    bspwm)
        choice="/home/phanindra/.config/bspwm/bspwmrc"
        ;;
    dunst)
        choice="/home/phanindra/.config/dunst/dunstrc"
        ;;
    dmenu)
        choice="/home/phanindra/.config/dmenu/config.def.h"
        ;;
    herbstluftwm)
        choice="/home/phanindra/.config/herbstluftwm/autostart"
        ;;
    neofetch)
        choice="/home/phanindra/.config/neofetch/config.conf"
        ;;
    nvim)
        choice="/home/phanindra/.config/nvim/init.vim"
        ;;
    picom)
        choice="/home/phanindra/.config/picom/picom.conf"
        ;;
    polybar)
        choice="/home/phanindra/.config/polybar/config.ini"
        ;;
    qtile)
        choice="/home/phanindra/.config/qtile/config.py"
        ;;
    qutebrowser)
        choice="/home/phanindra/.config/qutebrowser/quickmarks"
        ;;
    rofi)
        choice="/home/phanindra/.config/rofi/config.rasi"
        ;;
    sxhkd)
        choice="/home/phanindra/.config/sxhkd/sxhkdrc"
        ;;
    termite)
        choice="/home/phanindra/.config/termite/config"
        ;;
    starship)
        choice="/home/phanindra/.config/starship.toml"
        ;;
    vim)
        choice="/home/phanindra/.vimrc"
        ;;
    xinitrc)
        choice="/home/phanindra/.xinitrc"
        ;;
    Xreasources)
        choice="/home/phanindra/.Xresources"
        ;;
    zsh)
        choice="/home/phanindra/.zshrc"
        ;;
    zathura)
        choice="/home/phanindra/.config/zathura/zathurarc"
        ;;
    *)
        exit 0
        ;;
esac

termite -e "nvim '$choice'"
