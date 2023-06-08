local neogen = require('neogen')

neogen.setup({
    snippet_engine="snippy",
    languages = {
        python = {
            template = {
                annotation_convention = "numpydoc",
            }
        }
    }
})

vim.keymap.set('n', '<leader>cc', neogen.generate, {noremap=true, silent=true, desc="Generate comment"})

