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
		},
	},
	integrations = {
		twilight = true, -- enable twilight (ataraxis)
		lualine = true -- hide nvim-lualine (ataraxis)
	},
})


vim.keymap.set('n', '<leader>zf', truezen.focus, expr_opts)
vim.keymap.set('n', '<leader>zm', truezen.minimalist, expr_opts)
vim.keymap.set('n', '<leader>zz', truezen.ataraxis, expr_opts)
