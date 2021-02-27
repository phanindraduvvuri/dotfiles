# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import os
import subprocess

from typing import List  # noqa: F401

from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Screen, Match
from libqtile.lazy import lazy
# from libqtile.utils import guess_terminal


mod = "mod4"
alt = "mod1"
terminal = "termite"
browser = "brave"
filebrowser = "nautilus"
mail = "mailspring"
launcher_cmd = "rofi -theme ~/.config/rofi/config.rasi"

keys = [

   ################
   # Change focus #
   ################

   # Switch between windows in current stack pane
   Key([mod], "j",
       lazy.layout.down(),
       desc="Move focus down in stack pane"),
   Key([mod], "k",
       lazy.layout.up(),
       desc="Move focus up in stack pane"),
   Key([alt], "Tab",
       lazy.layout.next(),
       desc="Cycle through the open windows"),
   Key([mod], "Tab",
       lazy.screen.toggle_group(),
       desc="Move to last visited workspace"),
   Key([mod], "period",
       lazy.screen.next_group(),
       desc="Move to next workspace"),
   Key([mod], "comma",
       lazy.screen.prev_group(),
       desc="Move to previous workspace"),

   ###################################
   # Change window position and size #
   ###################################

   # Move windows up in current stack
   Key([mod, "shift"], "j",
       lazy.layout.shuffle_down(),
       desc="Move window down in current stack "),
   # Move windows down in current stack
   Key([mod, "shift"], "k",
       lazy.layout.shuffle_up(),
       desc="Move window up in current stack "),

   # Toggle between different layouts
   Key([mod, "shift"], "c",
       lazy.next_layout(),
       desc="Switch to next layout"),
   Key([mod], "s",
       lazy.window.toggle_floating(),
       desc="Toggle Floating Layout"),
   Key([mod], "m",
       lazy.window.toggle_fullscreen(),
       desc="Toggle fullscreen layout"),
   # Increace the size of master window
   Key([mod, "shift"], "i",
       lazy.layout.grow(),
       desc="Increase the space for master window"),
   Key([mod, "shift"], "o",
       lazy.layout.shrink(),
       desc="Decrease the space for master window"),
   Key([mod, "shift"], "0",
       lazy.layout.reset(),
       desc="Reset all the windows to their default sizes"),

   Key([mod, "shift"], "r", lazy.restart(), desc="Restart qtile"),
   Key([mod, "shift"], "q", lazy.shutdown(), desc="Shutdown qtile"),

   #################
   # Media control #
   #################

   Key([], "XF86AudioLowerVolume",
       lazy.spawn("pactl set-sink-volume 0 -3%"),
       desc="Decrease system volume by 5%"),
   Key([], "XF86AudioRaiseVolume",
       lazy.spawn("pactl set-sink-volume 0 +3%"),
       desc="Increase system volume by 5%"),
   Key([], "XF86AudioMute",
       lazy.spawn("pactl set-sink-mute 0 toggle"),
       desc="Toggle between mute and unmute"),
   Key([], "XF86AudioPlay",
       lazy.spawn("playerctl play-pause"),
       desc="Toggle between play/pause"),
   Key([], "XF86AudioNext",
       lazy.spawn("playerctl next"),
       desc="Skip to next track"),
   Key([], "XF86AudioPrev",
       lazy.spawn("playerctl previous"),
       desc="Skip to previous track"),
   Key([], "XF86Calculator",
       lazy.spawn("/usr/bin/gnome-calculator"),
       desc="Launch calculator"),
   Key([], "XF86HomePage",
       lazy.spawn(filebrowser),
       desc="Launch Home Folder in filebrowser"),
   Key([], "XF86Mail",
        lazy.spawn(mail),
        desc="Launch Email client"),

   ##############
   # Essentials #
   ##############

   # lauch browser
   Key([mod], "b",
       lazy.spawn(browser),
       desc="Launch web browser"),
   # launch filebrowser
   Key([mod], "e",
       lazy.spawn(filebrowser),
       desc="Launch file browser"),
   # launch terminal
   Key([mod], "Return",
       lazy.spawn(terminal),
       desc="Launch terminal"),
   Key([mod], "x",
       lazy.spawn("sh -c '/home/phanindra/.local/bin/lock'"),
       desc="Lock screen"),
   Key([mod], "a",
       lazy.spawn(launcher_cmd + " -show drun"),
       desc="Launch applications menu"),
   Key([mod, "shift"], 'x',
       lazy.spawn("xkill"),
       desc="Kill the selected window"),
   Key([mod, "shift"], 'space',
       lazy.spawn("killall -SIGUSR1 jgmenu"),
       desc="Launch application menu"),
   # Close the focused window
   Key([mod], "q",
       lazy.window.kill(),
       desc="Kill focused window"),
   Key([mod], "space",
       lazy.spawn(launcher_cmd + " -show run"),
       desc="Launch run menu"),

   ####################
   # Screen shot keys #
   ####################

   Key(["control"], "Print",
       lazy.spawn("screenshot s"),
       desc="Take a screenshot of entire screen, save it and copy it to clipboard"),
   Key(["control", "shift"], "Print",
       lazy.spawn("screenshot r"),
       desc="Take a screenshot of a region, save it and copy it to clipboard"),
   Key(["control", alt], "Print",
       lazy.spawn("screenshot w"),
       desc="Take a screenshot of the focused window, save it and copy it to clipboard"),


   ######################################
   # Programs launcher (ctrl + alt + x) #
   ######################################

   Key([alt, "control"], "r",
       lazy.spawn("termite -e 'ranger'"),
       desc="Launch ranger in termite"),
   Key([alt, "control"], "h",
       lazy.spawn("termite -e 'htop'"),
       desc="Launch htop in termite"),
   Key([alt, "control"], "n",
       lazy.spawn("nitrogen"),
       desc="Launch nitrogen"),
   Key([alt, "control"], "c",
       lazy.spawn('sh -c "/home/phanindra/.config/qtile/scripts/edit-configs.sh"'),
       desc="list config file to edit in rofi"),
   Key([alt, "control"], "Delete",
       lazy.spawn('sh -c "/home/phanindra/.local/bin/powermenu"'),
       desc="list config file to edit in rofi"),
]

groups_setup = (
    ('1', {
        'matches': [Match(wm_class=["Code"])],
        'label': '',
        }),
    ('2', {
        'matches': [Match(wm_class=["Brave-browser"])],
        'label': '',
        }),
    ('3', {
        'label': '',
        }),
    ('4', {
        'layout': 'max',
        'label': '',
        }),
    ('5', {
        'matches': [Match(wm_class=["Lxappearance"])],
        'label': '',
        }),
    ('6', {
        'matches': [Match(wm_class=["vlc", 'mpv', 'Spotify'])],
        'label': '',
        }),
    ('7', {
        'matches': [Match(wm_class=["zoom"])],
        'label': '',
        'layout': 'floating'
        }),
    ('8', {
        'matches': [Match(wm_class=['Transmission-gtk', 'Gimp'])],
        'label': '',
        }),
)

groups = []
for label, config in groups_setup:

    config.setdefault('layout', 'monadtall')
    groups.append(Group(label, **config))

    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], label, lazy.group[label].toscreen(),
            desc="Switch to group {}".format(label)),

        # mod1 + shift + letter of group = switch to focused window to group
        Key([mod, "shift"], label, lazy.window.togroup(label, switch_group=True),
            desc="Switch to & move focused window to group {}".format(label)),

        # mod1 + shift + alt + letter of group = switch to & move focused window to group
        Key([mod, alt, "shift"], label, lazy.window.togroup(label, switch_group=False),
            desc="Switch to & move focused window to group {}".format(label)),

    ])

layout_config = {
        "border_focus": "#eceff4",
        "border_normal": "#2e3440",
        "border_width": 2,
        "margin": 4,
}

layouts = [
    # layout.Stack(num_stacks=2),
    # Try more layouts by unleashing below layouts.
    # layout.Bsp(),
    # layout.Columns(),
    # layout.Matrix(),
    layout.MonadTall(**layout_config),
    layout.MonadWide(**layout_config),
    layout.Max(),
    layout.Floating(**layout_config),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

colors = {
        'bg': ['#2e3440', '#2e3440'],
        'bg-alt': ['#3b4252', '#3b4252'],
        'fg': ['#eceff4', '#eceff4'],
        'fg-alt': ['#4c566a', '#4c566a'],
        'red': ['#bf616a', '#bf616a'],
        'green': ['#a3be8c', '#a3be8c'],
        'yellow': ['#ebcb8b', '#ebcb8b'],
        'blue': ['#5e81ac', '#5e81ac'],
        'purple': ['#b48ead', '#b48ead'],
        'cyan': ['#88c0c0', '#88c0c0'],
        'orange': ['#d08770', '#d08770'],
}


widget_defaults = dict(
    background=colors['bg'],
    foreground=colors['fg'],
    font='mononoki',
    fontsize=13,
    padding=5,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Spacer(
                    length=4, ),
                widget.TextBox(
                    text='',
                    fontsize=27,
                    mouse_callbacks={'Button1': lambda qtile: qtile.cmd_spawn('killall -SIGUSR1 jgmenu')},
                    ),
                widget.GroupBox(
                    inactive=colors.get('fg-alt'),
                    highlight_method='line',
                    this_current_screen_border=colors.get('blue'),
                    highlight_color=colors.get('bg-alt'),
                    fontsize=22,
                    urgent_border=colors.get("red"),
                    urgent_text=colors.get("red"),
                    urgent_alert_method="line", ),
                widget.WindowName(),
                widget.TextBox(
                    text='',
                    foreground=colors.get('orange'),
                    background=colors.get('bg'),
                    padding=5,
                    fontsize=15, ),
                widget.Net(
                    format='{down} ↓↑ {up}',
                    foreground=colors.get('orange'),
                    background=colors.get('bg'),
                    padding=5, ),
                widget.Sep(
                    linewidth=1,
                    size_percent=60, ),
                widget.TextBox(
                    text='',
                    fontsize=23,
                    foreground=colors.get('yellow'),
                    background=colors.get('bg'), ),
                widget.Memory(
                    format="{MemUsed}M",
                    foreground=colors.get('yellow'),
                    background=colors.get('bg'), ),
                widget.TextBox(
                    text='',
                    fontsize=20,
                    foreground=colors.get('green'),
                    background=colors.get('bg'), ),
                widget.CPU(
                    format="{load_percent}%",
                    foreground=colors.get('green'),
                    background=colors.get('bg'), ),
                widget.TextBox(
                    text='',
                    fontsize=20,
                    foreground=colors.get('blue'),
                    background=colors.get('bg'), ),
                widget.ThermalSensor(
                    threshold=90,
                    foreground=colors.get('blue'),
                    background=colors.get('bg'), ),
                widget.Sep(
                    linewidth=1,
                    size_percent=60, ),
                widget.TextBox(
                    text='',
                    padding=5,
                    foreground=colors.get('purple'),
                    background=colors.get('bg'),
                    fontsize=24, ),
                widget.Volume(
                    foreground=colors.get('purple'),
                    background=colors.get('bg'),
                    padding=5, ),
                widget.Sep(
                    linewidth=1,
                    size_percent=60, ),
                widget.TextBox(
                    text='',
                    padding=5,
                    foreground=colors.get('cyan'),
                    background=colors.get('bg'),
                    fontsize=25, ),
                widget.Clock(
                    format='%a, %b %-d [ %H:%M ]',
                    foreground=colors.get('cyan'),
                    background=colors.get('bg'), ),
                widget.Sep(
                    linewidth=1,
                    size_percent=60, ),
                # widget.CurrentLayoutIcon(
                #     custom_icon_paths=["/home/phanindra/.config/qtile/icons/gruvbox/"],
                #     foreground=colors.get('red'),
                #     background=colors.get('fg-alt'),
                #     scale=0.65, ),
                widget.CurrentLayout(
                    foreground=colors.get('red'),
                    background=colors.get('bg'), ),
                widget.Systray(
                    icon_size=23,
                    background=colors.get('bg'), ),
            ],
            24,  # bar height
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(**layout_config, float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
    {'wmclass': 'Gcolor2'},
    {'wmclass': 'Gimp'},
    {'wmclass': 'Sxiv'},
    {'wmclass': 'Zathura'},
    {'wmclass': 'pomotroid'},
    {'wmclass': 'Lxappearance'},
    {'wmclass': 'Mousepad'},
    {'wmclass': 'Gnome-calculator'},
    {'wmclass': 'Engrampa'},
    {'wmclass': 'Pinentry-gtk-2'},
    {'wmclass': 'balena-etcher-electron'},
    {'wmclass': 'Lxpolkit'},
    {'wmclass': 'dosbox'},
])
auto_fullscreen = True
focus_on_window_activation = "smart"


# autostart applications
@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
