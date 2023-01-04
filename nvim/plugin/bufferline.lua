require('bufferline').setup{
    options = {
        mode = 'tabs',
        diagnostics = 'coc',
        always_show_bufferline = true,
        offsets = {
            {
                filetype = "NvimTree", text = "", padding = 1
            }
        },
        separator_style = "thin", 
    }
}
