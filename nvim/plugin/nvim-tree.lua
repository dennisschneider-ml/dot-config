local nvimtree = require('nvim-tree')
local api = require('nvim-tree.api')

nvimtree.setup({
    sort_by = 'case_sensitive',
    view = {
        adaptive_size = true,
        mappings = {
            list = {
                {key = 'u', action = 'dir_up'},
            },
        },
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})

-- open on <leader>tt
vim.keymap.set('n', '<leader>tt', api.tree.toggle, { noremap = true, silent = true })

