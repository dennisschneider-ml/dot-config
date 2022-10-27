bindkey -v

function vim-yank-to-clipboard {
    zle vi-yank
    echo "$CUTBUFFER" | xclip -i
}

# Add command to vim normal mode
zle -N vim-yank-to-clipboard
# Apply 'y'-command in vi command mode (normal mode)
bindkey -M vicmd 'y' vim-yank-to-clipboard

