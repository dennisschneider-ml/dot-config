require('harpoon').setup({
    global_settings = {
        -- set marks specific to each git branch inside git repository
        mark_branch = true,
    }
})

-- List harpooned buffers
mark = require('harpoon.mark')
vim.keymap.set('n', '<leader>fm', mark.toggle_file, {noremap = true, silent = true, desc = "Harpoon (Mark) file"})
