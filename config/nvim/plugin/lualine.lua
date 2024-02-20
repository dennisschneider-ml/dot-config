require('lualine').setup({
    options = {
        theme = 'dracula-nvim',
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {
            {
                'diagnostics',
                sources = {'nvim_lsp'},
            }
        },
        lualine_y = {},
        lualine_z = {},
    },
    extensions = {
        'fzf',
        'nvim-tree',
    },
})
