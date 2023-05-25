-- disable netrw (nvim's default file explorer) for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = ' '

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.scrolloff = 3
vim.o.showmatch = true

vim.bo.undofile = true

vim.cmd([[
    if has("clipboard")
        set clipboard=unnamed
        if has("unnamedplus")
            set clipboard+=unnamedplus
        endif
    endif
]])

-- Note: Running the check 1e6 times takes 1.1 seconds.
-- Execute current file.
vim.keymap.set('n', '<Leader>o', ':wa | !([ -x % ] || chmod +x %) & %')

