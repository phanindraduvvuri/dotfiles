declare options=("aliases
bash
bspwm
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
zsh"
)

choice=$(echo -e "${options[@]}" | rofi -dmenu -p "Edit config files: ")

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
    *)
        exit 0
        ;;
esac

termite -e "nvim '$choice'"
