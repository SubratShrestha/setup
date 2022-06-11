from libqtile import bar
from .widgets import *
from libqtile.config import Screen
from modules.keys import terminal
import os

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Sep(padding=3, linewidth=0, background="#2f343f"),
                widget.Image(
                    filename="~/.config/qtile/eos-c.png",
                    margin=3,
                    background="#2f343f",
                    mouse_callbacks={
                        "Button1": lambda: qtile.cmd_spawn("rofi -show combi")
                    },
                ),
                widget.Sep(padding=4, linewidth=0, background="#2f343f"),
                widget.GroupBox(
                    highlight_method="line",
                    this_screen_border="#5294e2",
                    this_current_screen_border="#5294e2",
                    active="#ffffff",
                    inactive="#848e96",
                    background="#2f343f",
                ),
                widget.TextBox(text="", padding=0, fontsize=28, foreground="#2f343f"),
                widget.Prompt(),
                widget.Spacer(length=5),
                widget.WindowName(fontsize=16, foreground="#99c0de", fmt="{}"),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.CheckUpdates(
                    update_interval=1800,
                    distro="Arch_yay",
                    display_format="{updates} Updates",
                    foreground="#ffffff",
                    mouse_callbacks={
                        "Button1": lambda: qtile.cmd_spawn(terminal + " -e yay -Syu")
                    },
                    background="#2f343f",
                ),
                widget.Systray(icon_size=20),
                widget.Battery(
                    format=" {char} {percent:2.0%} {hour:d}h {min:02d}m",
                    charge_char="",
                    full_char="",
                    empty_char="",
                    discharge_char="",
                ),
                widget.Sep(padding=5, linewidth=0),
                widget.TextBox(text="", padding=0, fontsize=28, foreground="#2f343f"),
                volume,
                widget.TextBox(
                    text="",
                    padding=0,
                    fontsize=28,
                    foreground="#2f343f",
                ),
                widget.TextBox(text="", padding=0, fontsize=28, foreground="#2f343f"),
                widget.Clock(
                    format=" %a %d %b %I:%M %p",
                    background="#2f343f",
                    foreground="#99c0de",
                    fontsize=16,
                    padding=18,
                ),
                widget.TextBox(
                    text="",
                    padding=0,
                    fontsize=28,
                    foreground="#2f343f",
                ),
                widget.TextBox(
                    text="",
                    fontsize=16,
                    mouse_callbacks={
                        "Button1": lambda: qtile.cmd_spawn(
                            os.path.expanduser("~/.config/rofi/powermenu.sh")
                        )
                    },
                    foreground="#e39378",
                ),
            ],
            30,  # height in px
            background="#404552",  # background color
        ),
    ),
]
