# My configuration of Qtile
# TO-DO'S
# - Refactoring of the code (checked)
# - Modularization

from libqtile import qtile
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.command import lazy
from libqtile import layout, bar, widget

mod = "mod4"  # Supr key
terminal = "alacritty"
browser = "brave"
font = "hack nerd font"

# nord colors
colors = [
    ["#282c34", "#282c34"],  # 0
    ["#353b45", "#353b45"],  # 1
    ["#3e4451", "#3e4451"],  # 2
    ["#545862", "#545862"],  # 3
    ["#565c64", "#565c64"],  # 4
    ["#abb2bf", "#abb2bf"],  # 5
    ["#b6bdca", "#b6bdca"],  # 6
    ["#c8ccd4", "#c8ccd4"],  # 7
    ["#e06c75", "#e06c75"],  # 8
    ["#d19a66", "#d19a66"],  # 9
    ["#e5c07b", "#e5c07b"],  # 10
    ["#98c379", "#98c379"],  # 11
    ["#56b6c2", "#56b6c2"],  # 12
    ["#61afef", "#61afef"],  # 13
    ["#c678dd", "#c678dd"],  # 14
    ["#be5046", "#be5046"]   # 15
]

keys = [

    # ----------------------- QTILE WINDOW MANAGMENT ------------------------ #

    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),

    # ------------------ APPS HOTKEYS --------------------- #

    # Launch Terminal
    Key([mod], "Return", lazy.spawn(terminal)),

    # Menu
    Key([mod], "r", lazy.spawn("rofi -show drun")),


    Key([mod, "shift"], "r", lazy.spawn("rofi -show")),

    # Volume
    Key([], "XF86AudioLowerVolume", lazy.spawn(
        "pactl set-sink-volume @DEFAULT_SINK@ -10%"
    )),
    Key([], "XF86AudioRaiseVolume", lazy.spawn(
        "pactl set-sink-volume @DEFAULT_SINK@ +10%"
    )),
    Key([], "XF86AudioMute", lazy.spawn(
        "pactl set-sink-mute @DEFAULT_SINK@ toggle"
    )),

    # Brightness
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-")),

    # Screenshot
    Key([], "Print", lazy.spawn("xfce4-screenshooter")),

    # Web browser
    Key([mod], "b", lazy.spawn(browser)),

    # Keyboard Layouts
    Key([mod], "z", lazy.spawn("setxkbmap es olpc")),
    Key([mod], "x", lazy.spawn("setxkbmap us")),

    # Toggle Floating
    Key([mod, "shift"], "f", lazy.window.toggle_floating()),

    # Redshift
    Key([mod], "e", lazy.spawn("redshift -O 4000k")),
    Key([mod, "shift"], "e", lazy.spawn("redshift -x")),

    # Discord
    Key([mod], "d", lazy.spawn("discord")),

    # Spotify
    Key([mod], "s", lazy.spawn("spotify")),

    # Thunar
    Key([mod], "f", lazy.spawn("thunar")),

    # Lock Screen
    Key([mod, "mod1"], "l", lazy.spawn("betterlockscreen -l")),

]

groups = [
    Group("www",  layout='monadtall'),
    Group("term", layout='monadtall'),
    Group("code", layout='monadtall'),
    Group("file", layout='monadtall'),
    Group("cord", layout='monadtall'),
    Group("spot", layout='monadtall'),
    Group("vbox", layout='monadtall'),
    Group("zoom", layout='monadtall'),
    Group("game", layout='monadtall')]


for i, group in enumerate(groups):
    actual_key = str(i + 1)
    keys.extend([
        # Switch to workspace N
        Key([mod], actual_key, lazy.group[group.name].toscreen()),
        # Send window to workspace N
        Key([mod, "shift"], actual_key, lazy.window.togroup(group.name))
    ])

# Preferred Layouts = MonadTall | Matrix | Max (In order of usage)

layout_conf = {
    "border_focus": colors[12],
    "border_normal": colors[1],
    "margin": 8,
    "border_width": 2
}

layouts = [
    layout.MonadTall(**layout_conf),
    layout.Matrix(**layout_conf),
    layout.Max(**layout_conf),
    layout.Floating(**layout_conf)
    # layout.Columns(**layout_conf),
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.MonadWide(**layout_conf),
    # layout.RatioTile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font=font,
    fontsize=16,
    padding=2,
    background=colors[0]
)

extension_defaults = widget_defaults.copy()

# Widgets

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Sep(
                    linewidth = 0,
                    padding = 6,
                    foreground = colors[12],
                    background = colors[0]
                ),
                widget.Image(
                    filename = "~/.config/qtile/pylogo.png",
                    scale = "False",
                    mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(terminal)}
                ),
                widget.Sep(
                    linewidth = 0,
                    padding = 6,
                    foreground = colors[12],
                    background = colors[0]
                ),
                widget.GroupBox(
                    font=font,
                    fontsize=14,
                    margin_y=3,
                    margin_x=0,
                    padding_y=8,
                    padding_x=5,
                    borderwidth=1,
                    highlight_method = 'text',
                    active=colors[13],
                    inactive=colors[4],
                    rounded=False,
                    urgent_border=colors[0],
                    this_current_screen_border=colors[11],
                    this_screen_border=colors[0],
                    other_current_screen_border=colors[0],
                    other_screen_border=colors[0],
                    disable_drag=True
                ),

                widget.Sep(
                    linewidth = 0,
                    padding = 6,
                    foreground = colors[12],
                    background = colors[0]
                ),
 
                widget.WindowName(
                    fontsize=14,
                    foreground=colors[13],
                    padding = 0
                ),

                widget.Systray(
                    background = colors[0],
                    padding = 5
                ),

                widget.TextBox(
                    text = "",
                    background = colors[0],
                    foreground = colors[12],
                    fontsize = 37,
                    padding = -5,
                ),
 

                widget.KeyboardLayout(
                    configured_keyboards=["us", "es olpc"],
                    display_map={"us": "us", "es olpc": "es"},
                    fmt = "{}",
                    foreground = colors[0],
                    background= colors[12]
                ),

                widget.TextBox(
                    text = "",
                    background = colors[12],
                    foreground = colors[8],
                    fontsize = 37,
                    padding = -5,
                ),

                widget.Volume(
                    foreground = colors[0],
                    background = colors[8],
                    padding = 5
                ),

                widget.Backlight(
                    background = colors[8],
                    foreground = colors[0],
                    padding = 5,
                    backlight_name = 'amdgpu_bl1'
                ),
                widget.TextBox(
                    text = "",
                    background = colors[8],
                    foreground = colors[10],
                    fontsize = 37,
                    padding = -5,
                ),

                widget.Battery(
                    background = colors[10],
                    foreground = colors[0],
                    format = "{char}{percent:2.0%} {hour:d}:{min:02d}"
                ),

                widget.TextBox(
                    text = "",
                    background = colors[10],
                    foreground = colors[14],
                    fontsize = 37,
                    padding = -5,
                ),

                widget.CurrentLayout(
                    background = colors[14],
                    foreground = colors[0]
                ),
 
                widget.TextBox(
                    text = "",
                    background = colors[14],
                    foreground = colors[11],
                    fontsize = 37,
                    padding = -5,
                ),

                widget.Net(
                    interface = "wlp4s0",
                    format = "{down} ↓↑ {up}",
                    background = colors[11],
                    foreground = colors[0],
                    padding = 5
                ),

                widget.TextBox(
                    text = "",
                    background = colors[11],
                    foreground = colors[12],
                    fontsize = 37,
                    padding = -5,
                ),

                widget.Memory(
                    foreground = colors[0],
                    background = colors[12],
                    mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(terminal + ' -e htop')},
                     fmt = 'Mem: {}',
                    padding = 5
                ),

                widget.TextBox(
                    text = "",
                    background = colors[12],
                    foreground = colors[13],
                    fontsize = 37,
                    padding = -5,
                ),

                widget.Clock(
                    padding = 5,
                    format = "%A, %B %d - %H:%M ",
                    background = colors[13],
                    foreground = colors[0]
                ),

            ],
            20,
            # opacity=0.95
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

dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    # gitk
    Match(
        wm_class='confirmreset'),
    # gitk
    Match(
        wm_class='makebranch'),
    # gitk
    Match(
        wm_class='maketag'),
    # ssh-askpass
    Match(
        wm_class='ssh-askpass'),
    # gitk
    Match(
        title='branchdialog'),
    # GPG key password entry
    Match(
        title='pinentry'),
], **layout_conf)

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True


# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
