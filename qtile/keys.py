from libqtile.lazy import lazy
from libqtile.config import Key

mod = "mod4"
terminal = "alacritty"

keys = [
    # Custom keybindings
    Key([mod], "space", lazy.spawn("rofi -show drun"), desc="Open application menu"),
    Key([mod], "e", lazy.spawn("thunar"), desc="Open file explorer"),
    Key([mod], "Tab", lazy.spawn("rofi -show window"), desc="Switch windows"),
    Key([mod], "b", lazy.spawn("brave"), desc="Launch browser"),
    Key([mod, "control", "shift"], "l", lazy.spawn("~/.config/rofi/powermenu.sh"), desc="Show power menu"),
    Key([], "XF86MonBrightnessDown", lazy.spawn("xbacklight - 10"), desc="Decrease brightness"),
    Key([], "XF86MonBrightnessUp", lazy.spawn("xbacklight + 10"), desc="Increase brightness"),
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc="Toggle fullscreen"),
    Key([mod, "shift"], "s", lazy.spawn("scrot -s /home/subrat/Pictures/screenshots/screenshot.jpg"), desc="Take screenshot of a region"),
    Key([mod], "Print", lazy.spawn("scrot /home/subrat/Pictures/screenshots/screenshot.jpg"), desc="Take screenshot"),
    Key([mod], "c", lazy.spawn("rofi -show calc"), desc="Run the rofi calculator"),
    Key([mod], "p", lazy.spawn("/home/subrat/.config/rofi/powermenu.sh"), desc="Power menu"),
    Key([mod], "t", lazy.spawn(terminal), desc="Launch terminal"),
    Key(["control", "shift"], "l", lazy.spawn("dm-tool switch-to-greeter"), desc="Lock the screen"),

    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),

    Key([mod], "r", lazy.spawn("rofi -show combi"), desc="spawn rofi"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"],
        "h",
        lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"],
        "j",
        lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"],
        "h",
        lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"],
        "l",
        lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"],
        "j",
        lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),

    # Toggle between different layouts as defined below
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "shift", "control"], "h", lazy.layout.swap_column_left()),
    Key([mod, "shift", "control"], "l", lazy.layout.swap_column_right()),
    Key([mod, "shift"], "space", lazy.layout.flip()),
    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod, "shift"],
        "r",
        lazy.spawncmd(),
        desc="Spawn a command using a prompt widget"),
    Key([], "XF86AudioRaiseVolume",lazy.spawn("amixer set Master 3%+")),
    Key([], "XF86AudioLowerVolume",lazy.spawn("amixer set Master 3%-")),
    Key([], "XF86AudioMute",lazy.spawn("amixer set Master toggle")),
]
