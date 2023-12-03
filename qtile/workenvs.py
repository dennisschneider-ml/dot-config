from libqtile.log_utils import logger
from libqtile.config import Group, Key
from libqtile.lazy import lazy
from libqtile import widget


group_names = "123456789"

env_names = ["", "work_"]
env_icons = ["", "🛠"]

environment_mode = 0
group_ids = [0] * len(env_names)

mod = "mod4"
bar_color = "#222255"


def current_group_id():
    return group_ids[environment_mode]

def set_current_group_id(gid):
    global group_ids
    group_ids[environment_mode] = gid

@lazy.screen.function
def next_environment_mode(s):
    global environment_mode 
    environment_mode = (environment_mode+1)%len(env_names)
    s.toggle_group(env_group_name(current_group_id()))
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
    global current_group_ids
    if i != current_group_id():
        set_current_group_id(i)
        s.toggle_group(env_group_name(i))

@lazy.window.function
def move_to_screen(w, i):
    w.togroup(env_group_name(i))

def setup_workenvs_groups():
    groups = [Group(env_group_name(g, e), label="󰝥") 
        for e in range(len(env_names)) 
        for g in range(len(group_names))]
    return groups


def setup_workenv_keys():
    keys = []
    for i, group_name in enumerate(group_names):
        logger.warning(group_name)
        keys.extend(
            [
                # mod1 + letter of group = switch to group
                Key(
                    [mod],
                    group_name,
                    go_to_screen(i),
                    desc="Switch to group {}".format(group_name),
                ),
                # mod1 + shift + letter of group = switch to & move focused window to group
                Key(
                    [mod, "shift"],
                    group_name,
                    move_to_screen(i),
                    desc="Move focused window to group {}".format(group_name),
                ),
            ]
        )
    return keys

env_widget = widget.TextBox(env_icons[environment_mode],
                    foreground="#7777BB",
                    background=bar_color, 
                    padding=0,
                    fontshadow=bar_color,
                    fontsize=16)

gb = widget.GroupBox(highlight_method="text",
                     visible_groups=group_names,
                     center_aligned=True,
                     this_current_screen_border="#EEEEFF",
                     active="#7777BB",
                     background="#000000.0",
                     fontsize=12,
                     )


