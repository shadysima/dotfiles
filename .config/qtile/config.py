#         _               _           _                 _     
#     ___| |__   __ _  __| |_   _ ___(_)_ __ ___   __ _( )___ 
#    / __| '_ \ / _` |/ _` | | | / __| | '_ ` _ \ / _` |// __|
#    \__ \ | | | (_| | (_| | |_| \__ \ | | | | | | (_| | \__ \
#    |___/_| |_|\__,_|\__,_|\__, |___/_|_| |_| |_|\__,_| |___/
#                           |___/                             
#           _   _ _                         __ _       
#      __ _| |_(_) | ___    ___ ___  _ __  / _(_) __ _ 
#     / _` | __| | |/ _ \  / __/ _ \| '_ \| |_| |/ _` |
#    | (_| | |_| | |  __/ | (_| (_) | | | |  _| | (_| |
#     \__, |\__|_|_|\___|  \___\___/|_| |_|_| |_|\__, |
#        |_|                                     |___/ 


import os
from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile.lazy import lazy
from libqtile import layout, bar, widget

from typing import List  # noqa: F401

mod = "mod4"


#AUTOSTART
os.system("compton &")
os.system("~/.screenlayout/double.sh &")
os.system("nitrogen --restore &")


# KEYBINDS
keys = [
    # Custom Keybinds
    # ------------------------------------------------------------
    Key(
        [mod], "Return",
        lazy.spawn("kitty"),
        desc='Launches kitty terminal'
        ),
    Key(
        [mod], "d",
        lazy.spawn("dmenu_run -l 15"),
        desc='Launches dmenu'
        ),
    Key(
        [mod], "a",
        lazy.spawn("kitty -e ranger"),
        desc='Launches ranger in the kitty terminal'
        ),
    Key(
        [mod], "c",
        lazy.spawn("/home/nick/.config/dmenu/dmenuscripts/edit_configs.sh"),
        desc='Launches dmenu script for configs'
        ),
    Key(
        [mod], "x",
        lazy.spawn("pcmanfm"),
        desc='Launches PCManFM File Manager'
        ),
#-----------------------------------------------------------------
    Key(
        [mod], "Down",
        lazy.layout.down(),
        desc='Moves window focus down in stack pane'
        ),
    Key(
        [mod], "Up",
        lazy.layout.up(),
        desc='Moves window focus up in stack pane'
        ),
#-----------------------------------------------------------------
    Key(
        [mod, "control"], "Down",
        lazy.layout.shuffle_down(),
        desc='Moves window down in stack pane'
        ),
    Key(
        [mod, "control"], "j",
        lazy.layout.shuffle_up(),
        desc='Moves window up in stack pane'
        ),
#-----------------------------------------------------------------
    Key(
        [mod], "space",
        lazy.layout.next(),
        desc='Switch window focus to other pane(s) of stack'
        ),
#-----------------------------------------------------------------
    Key(
        [mod, "shift"], "space",
        lazy.layout.rotate(),
        desc='Swap panes of split stack'
        ),
#-----------------------------------------------------------------
    Key(
        [mod, "shift"], "Return",
        lazy.layout.toggle_split(),
        desc='Toggle between split and unsplit sides of stack'
        ),
#-----------------------------------------------------------------
    Key(
        [mod], "Tab",
        lazy.next_layout(),
        desc='Toggle next active layout'
        ),
    Key(
        [mod], "w",
        lazy.window.kill(),
        desc='Kill focused window'
        ),
#-----------------------------------------------------------------
    Key(
        [mod, "control"], "r",
        lazy.restart(),
        desc='Restart Qtile'
        ),
    Key(
        [mod, "control"], "q",
        lazy.shutdown(),
        desc='Exit Qtile'
        ),
    Key(
        [mod], "r",
        lazy.spawncmd(),
        desc='Launches Qtile\'s built-in run prompt'
        ),
]

groups = [Group(i) for i in "12345678"]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key(
            [mod], i.name,
            lazy.group[i.name].toscreen()
            ),

        # mod1 + shift + letter of group = switch to & move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        Key(
            [mod, "shift"], i.name,
            lazy.window.togroup(i.name)
            ),
    ])

layouts = [
    layout.MonadTall(border_focus='#e8ecb2', border_width=1, margin=10),
    layout.Max(),
    # layout.Stack(num_stacks=2),
    # Try more layouts by unleashing below layouts.
    # layout.Bsp(),
    # layout.Columns(),
    # layout.Matrix(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font='sans',
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

### MOUSE CALLBACKS ###
def open_dmesg(qtile):
    qtile.cmd_spawn('kitty -e /home/nick/workspace/scripts/showdmesg.sh')


screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(),
                widget.Prompt(),
                widget.WindowName(),
                widget.Systray(),
                widget.Clock(format='%Y-%m-%d %a %H:%M'),
                widget.QuickExit(),
                widget.Image(filename='/home/nick/pictures/icons/archlinux-icon.png', mouse_callbacks={'Button1': open_dmesg}),
                #widget.CurrentLayout(),
            ],
            24,
            opacity=0.8,
        ),
        #wallpaper='/home/nick/pictures/wallpapers/space3.jpg',
        #wallpaper_mode='stretch',
    ),
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(),
                widget.Prompt(),
                widget.WindowName(),
                widget.Systray(),
                widget.Clock(format='%Y-%m-%d %a %H:%M'),
                widget.QuickExit(),
                #widget.CurrentLayout(),
            ],
            24,
            opacity=0.8,
        ),
        #wallpaper='~/pictures/wallpapers/space3.jpg',
        #wallpaper_mode='stretch',
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
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
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
])
auto_fullscreen = True
focus_on_window_activation = "smart"

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "Qtile"
