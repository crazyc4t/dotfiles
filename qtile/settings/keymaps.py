from libqtile.command import lazy
from libqtile.config import Key
from .vars import *

keys = [
    # ------ Window Managment ------ #
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key(
        [mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"
    ),
    Key(
        [mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key(
        [mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"
    ),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    # -------- Apps Hotkeys -------- #
    # Launch Terminal
    Key([mod], "Return", lazy.spawn(terminal)),
    # Menu
    Key([mod], "r", lazy.spawn("rofi -show drun")),
    Key([mod, "shift"], "r", lazy.spawn("rofi -show")),
    # Volume
    Key(
        [],
        "XF86AudioLowerVolume",
        lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -10%"),
    ),
    Key(
        [],
        "XF86AudioRaiseVolume",
        lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +10%"),
    ),
    Key([], "XF86AudioMute", lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle")),
    # Brightness
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-")),
    # Screenshot
    Key([], "Print", lazy.spawn("gscreenshot")),
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
