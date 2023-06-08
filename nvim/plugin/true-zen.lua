local truezen = require('true-zen')
local expr_opts = { noremap = true, silent = true }

truezen.setup({
    modes = { -- configurations per mode
        ataraxis = {
            minimum_writing_area = { -- minimum size of main window
                width = 80,
                height = 44,
            },
            padding = { -- padding windows
                left = 52,
                right = 52,
                top = 0,
                bottom = 0,
            },
            callbacks = {
                -- Make bufferline disappear when entering Zen-Mode.
                open_pos = function()
                    vim.cmd("set showtabline=0")
                end,
                close_pos = function()
                    vim.cmd("set showtabline=2")
                end
            }
        },
    },
    integrations = {
        lualine = true -- hide nvim-lualine (ataraxis)
    },
})


local wk = require("which-key")

wk.register({
    z = {
        name = "zen",
        f = { truezen.focus, "Focus Window", expr_opts },
        m = { truezen.minimalist, "Minimalist Mode", expr_opts },
        z = { truezen.ataraxis, "Zen Mode", expr_opts },
    }
}, { prefix = "<leader>" })
