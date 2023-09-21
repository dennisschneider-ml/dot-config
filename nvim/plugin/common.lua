--[[
To ensure modularity, this file implements functions which access multiple plugins.
The plugin-specific modules still only know about themselves.
--]]

-- conditional libraries
local npairs_loaded, npairs = pcall(require, 'nvim-autopairs')
local cmp_loaded, cmp = pcall(require, 'cmp')


-- plugin-common <CR> handling
local function cr_handling()
    --if vim.call('coc#pum#visible') == 1 then
    --    return vim.call('coc#pum#confirm')
    --elseif npairs_loaded then
    if cmp.visible() then
        return cmp.mapping.confirm({select = true})
    elseif npairs_loaded then
        return npairs.autopairs_cr()
    else
        return '<CR>'
    end
end

vim.keymap.set('i', '<CR>', cr_handling, { expr = true, noremap = true })
