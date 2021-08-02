# LAVENROSE QTILE CONFIGURATION

import os
import subprocess

from libqtile import bar, layout, widget, hook
from libqtile.config import Key, Drag, Group, Click, Screen
from libqtile.lazy import lazy


mod = 'mod4'
terminal = 'alacritty'

keys = [
        Key([mod], 'h', lazy.layout.left()),
        Key([mod], 'l', lazy.layout.right()),
        Key([mod], 'j', lazy.layout.down()),
        Key([mod], 'k', lazy.layout.up()),
        Key([mod], 'space', lazy.layout.next()),

        Key([mod, 'shift'], 'h', lazy.layout.shuffle_left()),
        Key([mod, 'shift'], 'l', lazy.layout.shuffle_right()),
        Key([mod, 'shift'], 'j', lazy.layout.shuffle_down()),
        Key([mod, 'shift'], 'k', lazy.layout.shuffle_up()),

        Key([mod, 'control'], 'h', lazy.layout.grow_left()),
        Key([mod, 'control'], 'l', lazy.layout.grow_right()),
        Key([mod, 'control'], 'j', lazy.layout.grow_down()),
        Key([mod, 'control'], 'k', lazy.layout.grow_up()),
        Key([mod, 'control'], 'n', lazy.layout.normalize()),

        Key([mod, 'shift'], 'Return', lazy.layout.toggle_split()),
        Key([mod], 'Return', lazy.spawn(terminal)),

        Key([mod], 'Tab', lazy.next_layout()),
        Key([mod], 'w', lazy.window.kill()),
        Key([mod, 'control'], 'r', lazy.restart()),
        Key([mod, 'control'], 'q', lazy.shutdown()),
        Key([mod], 'r', lazy.spawncmd())
]

groups = [ Group(ix) for ix in '12345' ]

for ix in groups:
    keys.extend([
        Key([mod], ix.name, lazy.group[ix.name].toscreen()),
        Key([mod, 'shift'], ix.name, lazy.window.togroup(ix.name, switch_group=True))
        ])

column_layout = layout.Columns(border_focus='#F38BA0', border_normal='#54436B', border_width=2, margin=2)
max_layout = layout.Max()

layouts = [ column_layout, max_layout ]

widget_defaults = dict( font='Fira Code', fontsize=13, padding=3 )
extension_defaults = widget_defaults.copy()

separator = widget.Sep(padding=5, foreground='#171717')
widget_list = [
    separator,
    widget.GroupBox(hide_unused=True),
    widget.Prompt(),
    widget.WindowName(format='| {name}'),
    separator,
    widget.Net(format='[{down}↓][{up}↑] |'),
    widget.Memory(format='MemUsage: {MemUsed:.0f}{mm} |'),
    widget.Clock(format='%I:%M %p | %a %d.%m.%Y'),
    widget.Systray(),
    separator
]

screen_setup = Screen(top=bar.Bar(widget_list, 24, background='#171717'))
screens = [ screen_setup ]

mouse = [
    Drag([mod], 'Button1', lazy.window.set_position_floating()),
    Drag([mod], 'Button3', lazy.window.set_size_floating()),
    Click([mod], 'Button2', lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False

float_rules = [ *layout.Floating.default_float_rules ]
floating_layout = layout.Floating(float_rules=float_rules)

auto_fullscreen = True
focus_on_window_activation = 'smart'
reconfigure_screen = True

auto_minimize = True
wmname = 'QTILE'

@hook.subscribe.startup_once
def autostart():
    home_dir = os.path.expanduser('~')
    subprocess.call([home_dir + '/.config/qtile/autostart.sh'])

