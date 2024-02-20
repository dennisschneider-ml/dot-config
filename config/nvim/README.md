# NeoVim Lua-Configuration

This is a NeoVim configuration written only in Lua and using alternatives to popular vim plugins written in Lua.

## Installed Plugins

- Standard-Vim Plugins for Usability: vim-surround, vim-commentary
- vim-fugitive: Vim Git-Client Interface
- himalaya: Vim Mail-Client
- coc: Completion Engine
- nvim-telescope: Alternative to fzf, written in Lua
- nvim-tree: Alternative to nerdtree, written in Lua
- true-zen: Alternative to Goyo, written in Lua
- nvim-lualine: Alternative to lightline, written in Lua

### Plugin Configuration
The used plugin-manager ``packer.nvim`` uses the ``plugin`` directory to store compiled data.
Since Lua automatically sources the files in ``plugin`` directory, plugin configuration files can be conveniently put here.

### NeoVim Configuration
The ``nvim`` directory can be uncluttered by putting the configuration files into the ``lua`` directory.

