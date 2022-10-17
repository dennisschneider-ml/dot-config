-- Open MarkdownPreview on Markdown files
vim.api.nvim_create_autocmd(
    { "BufNewFile", "BufRead" },
    { 
        pattern = "*.md", 
        command = ":MarkdownPreview",
    }
)
