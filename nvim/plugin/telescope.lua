actions = require('telescope.actions')

require('telescope').setup({
    defaults = {
        -- Plugin-local mappings
        mappings = {
            i = {
                -- Same behaviour as coc
                ['<C-J>'] = actions.move_selection_next,
                ['<C-K>'] = actions.move_selection_previous,
                -- The following mappings are default, but are listed explicitly since I use them a lot.
                -- Same behaviour as nvim-tree
                ['<C-X>'] = actions.select_horizontal,
                ['<C-V>'] = actions.select_vertical,
                ['<C-T>'] = actions.select_tab,
            }
        },
    },
    pickers = {
        builtin = {
            theme = 'ivy',
        },
        git_commits = {
            theme = 'ivy',
        },
        find_files = {
            theme = 'ivy',
        },
        live_grep = {
            theme = 'ivy',
        },
    },
})

local telescope = require('telescope.builtin')
local expr_opts = { noremap = true, silent = true }

-- Choose from all telescope-options
vim.keymap.set('n', '<leader>fa', telescope.builtin, expr_opts)

-- Search through git commits
vim.keymap.set('n', '<leader>fc', telescope.git_commits, expr_opts)

-- Search through files in cwd
vim.keymap.set('n', '<leader>ff', telescope.find_files, expr_opts)

-- Grep from files recursively in cwd
vim.keymap.set('n', '<leader>fg', telescope.live_grep, expr_opts)
