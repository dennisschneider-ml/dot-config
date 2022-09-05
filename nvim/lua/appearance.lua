local g = vim.g
local o = vim.o

--[[
nvim autoenables showcmd, syntax
--]]

o.termguicolors = true
o.number = true
o.relativenumber = true
o.splitbelow = true
o.splitright = true
o.signcolumn = "yes"

vim.cmd([[colorscheme nord]])
