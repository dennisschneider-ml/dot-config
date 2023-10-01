--[[
To ensure modularity, this file implements functions which access multiple plugins.
The plugin-specific modules still only know about themselves.
--]]

-- conditional libraries
local npairs_loaded, npairs = pcall(require, 'nvim-autopairs')
local cmp_loaded, cmp = pcall(require, 'cmp')



--  vim.keymap.set('i', '<CR>', cr_handling, { expr = true, noremap = true })
