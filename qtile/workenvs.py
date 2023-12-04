from libqtile.log_utils import logger
from libqtile.config import Group, Key
from libqtile.lazy import lazy
from libqtile import widget


class Environment:

    def __init__(self, name, icon):
        self.name = name
        self.icon = icon
        self._active_group = 0

    def group_name(self, group_index=None):
        if group_index is None:
            group_index = self._active_group
        return f"{self.name}{group_index+1}"

    @property
    def group(self):
        return self._active_group

    @group.setter
    def group(self, group_id):
        self._active_group = group_id


class WorkenvManager:

    def __init__(self, n_groups, envs=None):
        self.n_groups = n_groups
        if envs is None:
            envs = {"": "", "work_": "🛠"}
        self.envs = [Environment(env_name, env_icon) 
            for env_name, env_icon in envs.items()]
        self._active_env_id = 0

    @property
    def active_env(self):
        return self.envs[self._active_env_id]

    def cycle_env(self, rot=1):
        self._active_env_id = (self._active_env_id+rot)%len(self.envs)

    def setup_groups(self):
        groups = [Group(self.envs[e].group_name(g), label="󰝥") 
            for e in range(len(self.envs)) 
            for g in range(self.n_groups)]
        return groups

    def setup_workenv_keys(self):
        mod = "mod4"
        keys = []
        for i in range(self.n_groups):
            group_name = str(i+1)
            keys.extend(
                [
                    Key(
                        [mod],
                        group_name,
                        go_to_screen(i),
                        desc="Switch to group {}".format(group_name),
                    ),
                    Key(
                        [mod, "shift"],
                        group_name,
                        move_to_screen(i),
                        desc="Move focused window to group {}".format(group_name),
                    ),
                ]
            )
        return keys


wenvs = WorkenvManager(9)

@lazy.screen.function
def cycle_env(s):
    wenvs.cycle_env()
    s.toggle_group(wenvs.active_env.group_name())
    gb.visible_groups=[wenvs.active_env.group_name(g) for g in range(wenvs.n_groups)]
    env_widget.update(wenvs.active_env.icon)

@lazy.screen.function
def go_to_screen(s, i):
    if i != wenvs.active_env.group:
        wenvs.active_env.group = i
        s.toggle_group(wenvs.active_env.group_name())

@lazy.window.function
def move_to_screen(w, i):
    w.togroup(wenvs.active_env.group_name(i))


bar_color = "#222255"
env_widget = widget.TextBox(wenvs.envs[0].icon,
                    foreground="#7777BB",
                    fontshadow=bar_color,
                    fontsize=16)

gb = widget.GroupBox(highlight_method="text",
                     visible_groups=[str(i+1) for i in range(wenvs.n_groups)],
                     center_aligned=True,
                     this_current_screen_border="#EEEEFF",
                     active="#7777BB",
                     background="#000000.0",
                     fontsize=12,
                     )

