vim.api.nvim_buf_set_keymap(0, 'n', '<leader>ll', '<Plug>(vimtex-compile)', {desc="Toggle compile", silent=true})
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>lt', '<Plug>(vimtex-toc-toggle)', {desc="Toggle toc", silent=true})
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>ly', '<Plug>(vimtex-labels-toggle)', {desc="Toggle labels", silent=true})
