vim.o.timeout = true
vim.o.timeoutlen = 500

local wk = require("which-key")

wk.setup({
    plugins = {
        presets = {
            operators = false,
            motions = false,
            text_objects = false,
            windows = false,
            nav = false,
            z = false,
            g = false,
        }
    }
})

wk.register({
    f = { name = "File"},
    c = { name = "Comments"},
    h = { name = "Git"},
    r = { name = "Reformat"},
    t = { name = "File-Tree"},
    z = { name = "Zen"},
}, {prefix = "<leader>"})

