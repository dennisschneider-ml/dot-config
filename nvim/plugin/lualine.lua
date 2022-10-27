require('lualine').setup({
    options = {
        theme = 'nord',
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {
            {
                'diagnostics',
                sources = {'coc'},
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
