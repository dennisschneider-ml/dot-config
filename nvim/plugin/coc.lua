local expr_opts = { noremap = true, silent = true, expr = true }

-- Extensions to install if not already installed
vim.g.coc_global_extensions = {
	'coc-pyright', -- python language-support
    'coc-vimtex', -- latex language-support
	'coc-fzf-preview', -- fzf-integration in coc
	'coc-prettier',
}

-- Use <Ctrl-J> and <Ctrl-K> to navigate the completion list
-- 	"in insert mode", "on Ctrl-J", "if visible, next(), else Ctrl-J"
vim.keymap.set(
    'i', '<C-J>', 
    function()
        if vim.call('coc#pum#visible') then
            vim.call('coc#pum#next', 1)
        end
    end
    , expr_opts)

vim.keymap.set(
    'i', '<C-K>',
    function()
        if vim.call('coc#pum#visible') then
            vim.call('coc#pum#prev', 1)
        end
    end
    , expr_opts)

-- Select first item by default
vim.keymap.set(
    "i",
    "<CR>",
    function()
        if vim.call('coc#pum#visible') then
            vim.call('coc#pum#confirm')
        end
    end,
    expr_opts)

-- Open suggestions on Ctrl-Space
vim.keymap.set('i', '<C-Space>', 'coc#refresh()', expr_opts)

-- Rename variable under cursor
vim.keymap.set('n', '<Leader>rn', '<Plug>(coc-rename)')

-- Reformat file
vim.keymap.set('n', '<Leader>rf', ':CocCommand prettier.formatFile<CR>')

vim.o.completeopt = 'menuone,noinsert,noselect'
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.g.updatetime = 300
