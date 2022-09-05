require('telescope').setup({
    pickers = {
        find_files = {
            theme = 'ivy',
        },
        live_grep = {
            theme = 'ivy',
        },
    }
})

local telescope = require('telescope.builtin')
local expr_opts = { noremap = true, silent = true }

vim.keymap.set('n', '<leader>ff', telescope.find_files, expr_opts)

vim.keymap.set('n', '<leader>fg', telescope.live_grep, expr_opts)
