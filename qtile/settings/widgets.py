from libqtile.config import Screen
from libqtile import widget, bar, qtile
from .theme import colors
from .vars import *

widget_defaults = dict(font=font, fontsize=16, padding=2, background=colors[0])

extension_defaults = widget_defaults.copy()

# Widgets

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Sep(
                    linewidth=0, padding=6, foreground=colors[12], background=colors[0]
                ),
                widget.Image(
                    filename="~/.config/qtile/pylogo.png",
                    scale="False",
                    mouse_callbacks={"Button1": lambda: qtile.cmd_spawn(terminal)},
                ),
                widget.Sep(
                    linewidth=0, padding=6, foreground=colors[12], background=colors[0]
                ),
                widget.GroupBox(
                    font=font,
                    fontsize=14,
                    margin_y=3,
                    margin_x=0,
                    padding_y=8,
                    padding_x=5,
                    borderwidth=1,
                    highlight_method="text",
                    active=colors[13],
                    inactive=colors[4],
                    rounded=False,
                    urgent_border=colors[0],
                    this_current_screen_border=colors[11],
                    this_screen_border=colors[0],
                    other_current_screen_border=colors[0],
                    other_screen_border=colors[0],
                    disable_drag=True,
                ),
                widget.Sep(
                    linewidth=0, padding=6, foreground=colors[12], background=colors[0]
                ),
                widget.WindowName(fontsize=14, foreground=colors[13], padding=0),
                widget.Systray(background=colors[0], padding=5),
                widget.TextBox(
                    text="",
                    background=colors[0],
                    foreground=colors[12],
                    fontsize=37,
                    padding=-5,
                ),
                widget.KeyboardLayout(
                    configured_keyboards=["us", "es olpc"],
                    display_map={"us": "us", "es olpc": "es"},
                    fmt="{}",
                    foreground=colors[0],
                    background=colors[12],
                ),
                widget.TextBox(
                    text="",
                    background=colors[12],
                    foreground=colors[8],
                    fontsize=37,
                    padding=-5,
                ),
                widget.Volume(foreground=colors[0], background=colors[8], padding=5),
                widget.Backlight(
                    background=colors[8],
                    foreground=colors[0],
                    padding=5,
                    backlight_name="amdgpu_bl1",
                ),
                widget.TextBox(
                    text="",
                    background=colors[8],
                    foreground=colors[10],
                    fontsize=37,
                    padding=-5,
                ),
                widget.Battery(
                    background=colors[10],
                    foreground=colors[0],
                    format="{char}{percent:2.0%} {hour:d}:{min:02d}",
                ),
                widget.TextBox(
                    text="",
                    background=colors[10],
                    foreground=colors[14],
                    fontsize=37,
                    padding=-5,
                ),
                widget.CurrentLayout(background=colors[14], foreground=colors[0]),
                widget.TextBox(
                    text="",
                    background=colors[14],
                    foreground=colors[11],
                    fontsize=37,
                    padding=-5,
                ),
                widget.Net(
                    interface="wlp4s0",
                    format="{down} ↓↑ {up}",
                    background=colors[11],
                    foreground=colors[0],
                    padding=5,
                ),
                widget.TextBox(
                    text="",
                    background=colors[11],
                    foreground=colors[12],
                    fontsize=37,
                    padding=-5,
                ),
                widget.Memory(
                    foreground=colors[0],
                    background=colors[12],
                    mouse_callbacks={
                        "Button1": lambda: qtile.cmd_spawn(terminal + " -e htop")
                    },
                    fmt="Mem: {}",
                    padding=5,
                ),
                widget.TextBox(
                    text="",
                    background=colors[12],
                    foreground=colors[13],
                    fontsize=37,
                    padding=-5,
                ),
                widget.Clock(
                    padding=5,
                    format="%A, %B %d - %H:%M ",
                    background=colors[13],
                    foreground=colors[0],
                ),
            ],
            20,
            # opacity=0.95
        ),
    ),
]
