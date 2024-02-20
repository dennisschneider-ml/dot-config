vim.api.nvim_buf_set_keymap(0, 'n', '<leader>ll', '<Plug>(vimtex-compile)', {desc="Toggle compile", silent=true})
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>lt', '<Plug>(vimtex-toc-toggle)', {desc="Toggle toc", silent=true})
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>ly', '<Plug>(vimtex-labels-toggle)', {desc="Toggle labels", silent=true})

function find_title_in_paragraph()
    local start_line = vim.fn.search('^\\s*\\S', 'bnW') or 1
    local end_line = vim.fn.search('^\\s*$', 'nW') - 1 or vim.fn.line('$')

    for line_number = start_line, end_line do
        local line_content = vim.fn.getline(line_number)
        local title_match = line_content:match('%s*title%s*{(.*)}')

        if title_match then
            local title_variable = title_match:gsub("^%s*(.-)%s*$", "%1")
            local transformed_title = title_variable:gsub(' ', '_')
            local path = '../notes/' .. transformed_title .. '.md'

            vim.cmd('e ' .. path)
            return
        end
    end

    vim.api.nvim_err_writeln('Title not found in the current paragraph.')
end

vim.api.nvim_set_keymap('n', '<leader>a', [[:lua find_title_in_paragraph()<CR>]], { noremap = true, silent = true })
