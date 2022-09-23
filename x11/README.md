# Configuration for X11
A clean location for the ``xinitrc`` script which does not clutter the ``home``-directory.
The file-location is set in ``.config/shell/profile``.

## Custom key-mapping for typing German Umlaute
The location to the xcompose-file is set in ``.config/shell/profile``.

Output German Umlaute after predecing with <PrSc>.
In file `/etc/X11/xorg.conf.d/00-keyboard.conf`, add:
```
Option "XkbOptions" "compose:prsc"
```

Adiaeresis refers to the letter 'Ä', ...
