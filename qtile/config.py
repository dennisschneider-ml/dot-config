from libqtile.log_utils import logger
from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen, ScratchPad, DropDown, Bar
from libqtile.lazy import lazy
from libqtile import hook
from libqtile import qtile

# wifi
# sound
mod = "mod4"
terminal = "kitty"

group_names = "123456789"

environment_mode = 0
env_names = ["", "work_"]
env_icons = ["", "🛠"]
current_group_id = 0


@lazy.screen.function
def next_environment_mode(s):
    global environment_mode 
    environment_mode = (environment_mode+1)%len(env_names)
    s.toggle_group(env_group_name(current_group_id))
    gb.visible_groups=[env_group_name(g) for g in range(len(group_names))]
    env_widget.update(env_icons[environment_mode])

def env_group_name(i, env_mode=None):
    if env_mode is not None:
        curr_env_name = env_names[env_mode]
    else:
        curr_env_name = env_names[environment_mode]
    return curr_env_name + group_names[i]

@lazy.screen.function
def go_to_screen(s, i):
    global current_group_id
    if i != current_group_id:
        current_group_id = i
        s.toggle_group(env_group_name(i))

@lazy.window.function
def move_to_screen(w, i):
    w.togroup(env_group_name(i))

groups = [Group(env_group_name(g, e), label="󰝥") 
    for e in range(len(env_names)) 
    for g in range(len(group_names))]

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    #Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    #Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    #Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "shift"], "h", lazy.layout.shrink(), desc="Grow window to the right"),
    Key([mod, "shift"], "l", lazy.layout.grow(), desc="Grow window to the left"),
    #Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    #Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod, "shift"], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod], "n", lazy.spawn("sh .config/spectrwm/scripts/toggle_wifi.sh"), desc="Reset all window sizes"),
    Key([mod], "r", lazy.spawn("sh .config/spectrwm/scripts/toggle_bluetooth.sh"), desc="Reset all window sizes"),
    Key([mod], "c", lazy.spawn("sh .config/spectrwm/scripts/toggle_battery_mode.sh"), desc="Reset all window sizes"),
    Key([mod], "p", lazy.spawn("sh .config/spectrwm/scripts/pass_menu.sh"), desc="Reset all window sizes"),
    Key([mod], "f", lazy.window.toggle_floating(), desc="Toggle floating"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "b", lazy.spawn("qutebrowser"), desc="Launch browser"),
    Key([mod, "shift"], "t", lazy.spawn("sh .config/spectrwm/scripts/toggle_mousepad.sh"), desc="Launch mails"),
    Key([mod, "control"], "delete", lazy.spawn("betterlockscreen --lock"), desc="Launch mails"),
    Key([mod], "space", lazy.spawn("rofi -show run"), desc="Launch browser"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.window.toggle_fullscreen(), desc="Toggle fullscreen"),
    Key([mod, "shift"], "Tab", lazy.next_layout(), desc="Toggle fullscreen"),
    Key([mod, "shift"], "b", lazy.hide_show_bar("top"), desc="Launch browser"),
    Key([mod], "w", lazy.spawn("Qminimize -m"), desc="Minimize focused window"),
    Key([mod, "shift"], "w", lazy.spawn("Qminimize -u"), desc="Minimize focused window"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),


    Key([mod], "i", lazy.spawn("sh .config/spectrwm/scripts/invert_colors.sh"), desc="Reload the config"),
    Key([], "XF86MonBrightnessUp", lazy.spawn("sh /home/dns/.config/spectrwm/scripts/inc_brightness.sh")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("sh /home/dns/.config/spectrwm/scripts/dec_brightness.sh")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("sh /home/dns/.config/spectrwm/scripts/inc_volume.sh")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("sh /home/dns/.config/spectrwm/scripts/dec_volume.sh")),
    Key([], "XF86AudioMute", lazy.spawn("sh /home/dns/.config/spectrwm/scripts/mute_volume.sh")),
    Key([mod], "s", lazy.spawn("flameshot gui")),
    Key([mod, "shift"], "s", lazy.spawn("flameshot screen")),
   Key([mod], 'm', lazy.group['scratchpads'].dropdown_toggle('mails'),),
    Key([mod], 'a', lazy.group['scratchpads'].dropdown_toggle('music'),),
    Key([mod], 'u', lazy.group['scratchpads'].dropdown_toggle('math'),),
    Key([mod], 't', lazy.group['scratchpads'].dropdown_toggle('add_task')),
    Key([mod], "escape", next_environment_mode()),
]

for i, g in enumerate(groups):
    if "work_" in g.name:
        continue
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                g.name,
                go_to_screen(i),
                desc="Switch to group {}".format(g.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                g.name,
                move_to_screen(i),
                desc="Move focused window to group {}".format(g.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )


groups.extend([
    ScratchPad('scratchpads', [
        DropDown(
            'music',
            [terminal, '-e', 'ncmpcpp'],
            height = 0.8,
            width = 0.8,
            x = 0.1,
            y = 0.1,
            on_focus_lost_hide = True,
            warp_pointer = False,
        ),
        DropDown(
            'mails',
            [terminal, '-e', 'neomutt'],
            height = 0.8,
            width = 0.8,
            x = 0.1,
            y = 0.1,
            on_focus_lost_hide = True,
            warp_pointer = True,
        ),
        DropDown(
            'math',
            [terminal, '-e', 'genius'],
            height = 0.8,
            width = 0.4,
            x = 0.5,
            y = 0.1,
            on_focus_lost_hide = True,
            warp_pointer = True,
        ),
        DropDown(
            'add_task',
            # [terminal, '-e', 'genius'],
            [terminal, '-e', 'sh', '/home/dns/.config/spectrwm/scripts/add_task.sh'],
            height = 0.8,
            width = 0.4,
            x = 0.5,
            y = 0.1,
            on_focus_lost_hide = True,
            warp_pointer = True,
        ),
    ]),
])

layouts = [
    layout.MonadTall(
        border_focus="#EEEEFF",
        border_width=1,
        new_client_position="bottom",
        single_border_width=0,
    ),
    layout.MonadWide(
        border_focus="#EEEEFF",
        border_width=1,
        new_client_position="bottom",
        single_border_width=0,
    ),
    layout.Max(),
    layout.TreeTab(),
]

bar_color = "#222255"
widget_defaults = dict(
    font="sans",
    fontsize=14,
    rounded=True,
    padding=4,
    background=bar_color
)
extension_defaults = widget_defaults.copy()

gb = widget.GroupBox(highlight_method="text",
                     visible_groups=group_names,
                     center_aligned=True,
                     this_current_screen_border="#EEEEFF",
                     active="#7777BB",
                     background="#000000.0",
                     fontsize=12,
                     )
env_widget = widget.TextBox(env_icons[environment_mode],
                    foreground="#7777BB",
                    background=bar_color, 
                    padding=0,
                    fontshadow=bar_color,
                    fontsize=16)
screens = [
    Screen(
        top=bar.Bar(
            [
                env_widget,
                widget.Memory(format='{MemUsed: .0f} {mm}'),
                widget.Sep(),
                widget.ThermalSensor(),
                widget.TextBox("", 
                               foreground=bar_color, 
                               background="#000000.0",
                               padding=0,
                               fontshadow=bar_color,
                               fontsize=16),
                widget.Spacer(background="#000000.0"),
                gb,
                widget.Spacer(background="#000000.0"),
                widget.TextBox("", 
                               foreground=bar_color, 
                               background="#000000.0",
                               fontshadow=bar_color,
                               padding=0,
                               fontsize=16),
                widget.Battery(unknown_char=""),
                widget.Sep(),
                widget.Clock(format="%Y-%m-%d %a %I:%M %p"),
            ],
            20,
            background="#000000.0",
            opacity=1,
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(wm_class="pinentry-gtk-2"),  # GPG key password entry
        Match(wm_class="com.cisco.anyconnect.gui"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

#@hook.subscribe.setgroup
# def change_group():
#    screens[0].bottom.show(False)

