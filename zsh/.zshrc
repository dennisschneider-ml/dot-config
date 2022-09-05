# By default, set rwx------ rights for newly created files
# RedHat-Linux uses the same default
umask 0077

# Use vim keys in tab complete menu:
#bindkey -M menuselect 'h' vi-backward-char
#bindkey -M menuselect 'k' vi-up-line-or-history
#bindkey -M menuselect 'l' vi-forward-char
#bindkey -M menuselect 'j' vi-down-line-or-history

# Enable tab completion
autoload -Uz compinit

# XDG-compliance
compinit -d $XDG_CACHE_HOME/zsh/zcompdump
HISTFILE=$XDG_CACHE_HOME/shell/histfile

# fzf-integration in completion-selection menu
[ ! -f $XDG_DATA_HOME/fzf-tab/fzf-tab.plugin.zsh ] || source $XDG_DATA_HOME/fzf-tab/fzf-tab.plugin.zsh

# Autosuggestions (fish-like)
[ ! -f $XDG_DATA_HOME/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh ] || source $XDG_DATA_HOME/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# History-size
HISTSIZE=1000000
SAVEHIST=1000000
# Size of directory stack for pushd/popd-functionality
DIRSTACKSIZE=8
# Append per session when using multiple sessions in parallel
setopt appendhistory
# Ignore duplicates in history
setopt histignorealldups
setopt extendedglob
# Turn off beep-sound on errors
unsetopt beep
bindkey -v

# Zsh-specific aliasrc
source $ZDOTDIR/aliasrc.zsh
# Colortheme
source $ZDOTDIR/p10k.zsh
source $XDG_DATA_HOME/powerlevel10k/powerlevel10k.zsh-theme


