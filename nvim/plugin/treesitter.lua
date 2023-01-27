require('nvim-treesitter.configs').setup {
    ensure_installed = {"bash", "python", "lua", 
        "rust",
        "gitcommit", "gitignore", "markdown", "regex", 
        "dockerfile", "yaml", "toml", "json"},
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },
    indent = {
        enable = true, 
        disable = {} 
    },
}

