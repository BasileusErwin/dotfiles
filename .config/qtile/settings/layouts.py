from libqtile import layout
from libqtile.config import Match
from .theme import colors
from .rules import rules

layout_conf = {
    'border_focus': colors['focus'][0],
    'border_width': 1,
    'margin': 8
}

layouts = [
    layout.Columns(**layout_conf),
    # layout.Max(margin = 8),
    # Try more layouts by unleashing below layouts.
    layout.Stack(num_stacks=1, **layout_conf),
    # layout.Bsp(**layout_conf),
    # layout.Matrix(),
    # layout.MonadTall(**layout_conf),
    layout.MonadWide(**layout_conf),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

floating_layout = layout.Floating(
    float_rules = rules(floating = True, layout_floating = layout.Floating.default_float_rules),
    border_focus = colors["color4"][0]
)

