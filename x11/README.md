# Configuration for X11

The location to ``X11``-specific files is set in ``.config/shell/profile``.

## xinitrc
- The xinitrc-file starts various processes at system start.
Xwallpaper is a minimal program to set a wallpaper. I formerly used feh, but exchanged it for nsxiv and xwallpaper because there is no reason why an image-viewer should be able to set a wallpaper. \\
- Picom does not need to be put into the background using ``&``. Instead the flag ``-b`` can be used.
- ``watch-home.sh`` notifies the user on changes to the home-directory. This helps unclutter the home-directory.

## Custom key-mapping for typing German Umlaute
German Umlaute are output after being predeced by ``<PrSc>``.
In file `/etc/X11/xorg.conf.d/00-keyboard.conf`, add:
```
Option "XkbOptions" "compose:prsc"
```

The file ``xcompose`` lists the actual  cutom keybindings.
As a note: Adiaeresis refers to the letter 'Ä', etc ...

## Globally defined Nord-Theme in xresources

While not a lot of applications actually make use of the xresources-file (htop does!) it is never a bad idea to have it configured to the actual theme you are using. In my case: The popular Nord-Theme.
