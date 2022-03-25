from libqtile.config import Screen
from libqtile import widget, bar, qtile
from .vars import *

# Widget vars

widget_defaults = dict(font=font, fontsize=16, padding=2, background=theme[0])

extension_defaults = widget_defaults.copy()

# Widgets

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Sep(
                    linewidth=0,
                    padding=6,
                    foreground=theme[12],
                    background=theme[0],
                ),
                widget.Image(
                    filename="~/.config/qtile/pylogo.png",
                    scale="False",
                    mouse_callbacks={"Button1": lambda: qtile.cmd_spawn(terminal)},
                ),
                widget.Sep(
                    linewidth=0,
                    padding=6,
                    foreground=theme[12],
                    background=theme[0],
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
                    active=theme[13],
                    inactive=theme[4],
                    rounded=False,
                    urgent_border=theme[0],
                    this_current_screen_border=theme[11],
                    this_screen_border=theme[0],
                    other_current_screen_border=theme[0],
                    other_screen_border=theme[0],
                    disable_drag=True,
                ),
                widget.Sep(
                    linewidth=0,
                    padding=6,
                    foreground=theme[12],
                    background=theme[0],
                ),
                widget.WindowName(fontsize=14, foreground=theme[13], padding=0),
                widget.Systray(background=theme[0], padding=5),
                widget.TextBox(
                    text="",
                    background=theme[0],
                    foreground=theme[12],
                    fontsize=37,
                    padding=-5,
                ),
                widget.KeyboardLayout(
                    configured_keyboards=["us", "es olpc"],
                    display_map={"us": "us", "es olpc": "es"},
                    fmt="{}",
                    foreground=theme[0],
                    background=theme[12],
                ),
                widget.TextBox(
                    text="",
                    background=theme[12],
                    foreground=theme[8],
                    fontsize=37,
                    padding=-5,
                ),
                widget.Volume(
                    foreground=theme[0],
                    background=theme[8],
                    padding=5,
                    mouse_callbacks={"Button1": lambda: qtile.cmd_spawn("pavucontrol")},
                ),
                widget.Backlight(
                    background=theme[8],
                    foreground=theme[0],
                    padding=5,
                    backlight_name="amdgpu_bl1",
                ),
                widget.TextBox(
                    text="",
                    background=theme[8],
                    foreground=theme[10],
                    fontsize=37,
                    padding=-5,
                ),
                widget.Battery(
                    background=theme[10],
                    foreground=theme[0],
                    format="{char}{percent:2.0%} {hour:d}:{min:02d}",
                ),
                widget.TextBox(
                    text="",
                    background=theme[10],
                    foreground=theme[14],
                    fontsize=37,
                    padding=-5,
                ),
                widget.CurrentLayout(background=theme[14], foreground=theme[0]),
                widget.TextBox(
                    text="",
                    background=theme[14],
                    foreground=theme[11],
                    fontsize=37,
                    padding=-5,
                ),
                widget.Net(
                    interface="wlp4s0",
                    format="{down} ↓↑ {up}",
                    background=theme[11],
                    foreground=theme[0],
                    padding=5,
                    mouse_callbacks={
                        "Button1": lambda: qtile.cmd_spawn(terminal + " -e speedtest")
                    },
                ),
                widget.TextBox(
                    text="",
                    background=theme[11],
                    foreground=theme[12],
                    fontsize=37,
                    padding=-5,
                ),
                widget.Memory(
                    foreground=theme[0],
                    background=theme[12],
                    mouse_callbacks={
                        "Button1": lambda: qtile.cmd_spawn(terminal + " -e htop")
                    },
                    fmt="Mem: {}",
                    padding=5,
                ),
                widget.TextBox(
                    text="",
                    background=theme[12],
                    foreground=theme[13],
                    fontsize=37,
                    padding=-5,
                ),
                widget.Clock(
                    padding=5,
                    format="%A, %B %d - %H:%M ",
                    background=theme[13],
                    foreground=theme[0],
                ),
            ],
            20,
            opacity=0.95,
        ),
    ),
]
