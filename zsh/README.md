# Configuration for Zsh
A tidy configuration of Zsh in order to configure Zsh-specific stuff.

## Minimal usage of the home-dir
Since Zsh expects the configuration files to be in ``$HOME``, the amount of Zsh-related files can only be minimized in the following way:
- Create ``.zshenv`` in ``$HOME`` with the following content:
``export ZDOTDIR=$HOME/.config/zsh``

## Separation of zshrc and profile
``profile`` is read when Zsh is opened as an "interactive login shell", so on login to the machine (either in-person or via ssh). Hence, environment variables are usually loaded here since they do not change and are needed also when logging in through ssh. Also customizing the ``$PATH``-variable should only happen once.

``zshrc`` is read whenever starting a new instance of the shell, so aliases, functions etc are loaded here.
