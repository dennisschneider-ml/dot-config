local expr_opts = { noremap = true, silent = true, expr = true }

-- Extensions to install if not already installed
vim.g.coc_global_extensions = {
	'coc-pyright', -- python language-support
    'coc-vimtex', -- latex language-support
    'coc-sh', -- sh language-support
    'coc-lua', -- lua language-support
    'coc-rust-analyzer', -- rust language support
	'coc-fzf-preview', -- fzf-integration in coc
	'coc-prettier',
}

-- I miss python!!!
function bool(number)
    return number == 1
end

-- 'coc#vim#visible' ensures the mapping being plugin-local
--
-- Use <Ctrl-J> and <Ctrl-K> to navigate the completion list
-- 	"in insert mode", "on Ctrl-J", "if visible, next(), else Ctrl-J"
vim.keymap.set(
    'i', 
    '<C-J>', 
    function()
        if bool(vim.call('coc#pum#visible')) then
            return vim.call('coc#pum#next', 1)
        elseif bool(vim.call('coc#jumpable')) then
            return '<C-R>=coc#rpc#request("snippetNext", [])<CR>'
        else
            return '<C-J>'
        end
    end,
    expr_opts)

vim.keymap.set(
    'i', 
    '<C-K>',
    function()
        if bool(vim.call('coc#pum#visible')) then
            return vim.call('coc#pum#prev', 1)
        elseif bool(vim.call('coc#jumpable')) then
            return '<C-R>=coc#rpc#request("snippetPrev", [])<CR>'
        else
            return '<C-K>'
        end
    end,
    expr_opts)

-- Open suggestions on Ctrl-Space
vim.keymap.set('i', '<C-Space>', 'coc#refresh()', expr_opts)

-- Rename variable under cursor
vim.keymap.set('n', '<leader>rn', '<Plug>(coc-rename)', {desc = "Rename variable"})

-- Reformat file
vim.keymap.set('n', '<leader>rf', ':CocCommand prettier.formatFile<CR>', {desc = "Reformat file"})

vim.o.completeopt = 'menuone,noinsert,noselect'
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.g.updatetime = 300
