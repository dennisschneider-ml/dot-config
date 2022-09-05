--[[ nvim autoenables incsearch, hlsearch
--]]

-- Enable use of mouse in all vim-modes
vim.opt.mouse = 'a'

-- window-split navigation
vim.keymap.set('n', '<C-H>', '<C-W>h', expr_opts)
vim.keymap.set('n', '<C-J>', '<C-W>j', expr_opts)
vim.keymap.set('n', '<C-K>', '<C-W>k', expr_opts)
vim.keymap.set('n', '<C-L>', '<C-W>l', expr_opts)
