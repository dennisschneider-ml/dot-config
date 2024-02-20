require('bufferline').setup{
    options = {
        mode = 'tabs',
        diagnostics = 'nvim_lsp',
        always_show_bufferline = false,
        offsets = {
            {
                filetype = "NvimTree", text = "", padding = 1
            }
        },
        separator_style = "thin", 
    }
}
