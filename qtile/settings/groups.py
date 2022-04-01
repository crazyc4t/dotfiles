from libqtile.config import Key, Group
from libqtile.command import lazy
from libqtile import layout
from .keymaps import keys
from .vars import *

groups = [
    Group("www", layout="monadtall"),
    Group("term", layout="monadtall"),
    Group("code", layout="monadtall"),
    Group("file", layout="monadtall"),
    Group("spot", layout="monadtall"),
    Group("cord", layout="monadtall"),
    Group("virt", layout="monadtall"),
    Group("game", layout="monadtall"),
    Group("zoom", layout="monadtall"),
]


for i, group in enumerate(groups):
    actual_key = str(i + 1)
    keys.extend(
        [
            # Switch to workspace N
            Key([mod], actual_key, lazy.group[group.name].toscreen()),
            # Send window to workspace N
            Key([mod, "shift"], actual_key, lazy.window.togroup(group.name)),
        ]
    )
