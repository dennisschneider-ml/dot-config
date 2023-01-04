--[[ nvim autoenables incsearch, hlsearch
--]]
local expr_opts = {noremap = true}

-- Enable use of mouse in all vim-modes
vim.opt.mouse = 'a'

-- window-split navigation
vim.keymap.set('n', '<C-H>', '<C-W>h', expr_opts)
vim.keymap.set('n', '<C-J>', '<C-W>j', expr_opts)
vim.keymap.set('n', '<C-K>', '<C-W>k', expr_opts)
vim.keymap.set('n', '<C-L>', '<C-W>l', expr_opts)

-- window-split resize
vim.keymap.set(
    'n', 
    '<C-S-H>', 
    function()
        local curr_width = vim.api.nvim_win_get_width(0)
        vim.api.nvim_win_set_width(0, curr_width+2)
    end,
    expr_opts)

vim.keymap.set(
    'n', 
    '<C-S-J>', 
    function()
        local curr_height = vim.api.nvim_win_get_height(0)
        vim.api.nvim_win_set_height(0, curr_height-2)
    end,
    expr_opts)

vim.keymap.set(
    'n', 
    '<C-S-K>', 
    function()
        local curr_height = vim.api.nvim_win_get_height(0)
        vim.api.nvim_win_set_height(0, curr_height+2)
    end,
    expr_opts)

vim.keymap.set(
    'n', 
    '<C-S-L>', 
    function()
        local curr_width = vim.api.nvim_win_get_width(0)
        vim.api.nvim_win_set_width(0, curr_width-2)
    end,
    expr_opts)

-- window-tab conversion
-- window to tab
vim.keymap.set(
    'n', 
    '<C-T>', 
    '<C-W>T',
    expr_opts)

