from libqtile import layout
from libqtile.config import Match
from .vars import *

# Layout vars

layout_conf = {
    "border_focus": theme[12],
    "border_normal": theme[1],
    "margin": 8,
    "border_width": 2,
}

# Preferred Layouts = MonadTall | Matrix | Max (In order of usage)

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

floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        # gitk
        Match(wm_class="confirmreset"),
        # gitk
        Match(wm_class="makebranch"),
        # gitk
        Match(wm_class="maketag"),
        # ssh-askpass
        Match(wm_class="ssh-askpass"),
        # gitk
        Match(title="branchdialog"),
        # GPG key password entry
        Match(title="pinentry"),
    ],
    **layout_conf
)
