return require('packer').startup(function()
    -- packer can manage itself
    use 'wbthomason/packer.nvim'

    -- keybindings cheatsheet
    use 'folke/which-key.nvim'

    -- ! VIMSCRIPT
    -- vim-surround
    -- use 'tpope/vim-surround'

    -- ! VIMSCRIPT
    -- same as neogen??
    -- vim-commentary
    -- use 'tpope/vim-commentary'

    -- ! VIMSCRIPT
    -- git
    -- use 'tpope/vim-fugitive'

    -- coc
    use {'neoclide/coc.nvim', branch='release'}
    
    -- coc alternative
    --use "neovim/nvim-lspconfig" -- enable LSP
    --use "williamboman/nvim-lsp-installer"
    --use "hrsh7th/cmp-nvim-lsp"
    -- use "williamboman/mason.nvim"
    -- use "williamboman/mason-lspconfig.nvim"
    -- use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
    -- use "hrsh7th/nvim-cmp"
    -- use "hrsh7th/cmp-nvim-lsp"

 --    use {'VonHeikemen/lsp-zero.nvim',
 --        branch = 'v2.x',
 --        requires = {
 --            {'neovim/nvim-lspconfig'},
 --            {
 --                'williamboman/mason.nvim',
 --                run = function()
 --                    pcall(vim.cmd, "MasonUpdate")
 --                end,
 --            },
 --            {'williamboman/mason-lspconfig.nvim'},
 --            {'hrsh7th/nvim-cmp'},
 --            {'hrsh7th/cmp-nvim-lsp'},
 --            {'L3MON4D3/LuaSnip'}
 --        }
 --    }

    -- fzf
    -- telescope
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
    use 'AckslD/nvim-neoclip.lua'
    use 'cljoly/telescope-repo.nvim'
    -- ! VIMSCRIPT
    -- use 'nanotee/zoxide.vim'
    use {'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }
    -- harpoon
    use {'ThePrimeagen/harpoon',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }

    -- auto-generate bracket-pairs
    use 'windwp/nvim-autopairs'

    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Create doc-strings.
    use {
        'danymat/neogen',
        requires = 'nvim-treesitter/nvim-treesitter'
    }

    -- Snippets.
    use 'dcampos/nvim-snippy'
    -- ! VIMSCRIPT (why needed?)
    use 'honza/vim-snippets'

    -- nerdtree-alternative (not maintained anymore)
    use {'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons'}, tag = 'nightly'}

    -- goyo-alternative
    use 'pocco81/true-zen.nvim'

    -- dim inactive portions of code
    -- ! UNUSED
    -- use 'folke/twilight.nvim'

    -- lualine
    use {'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}

    -- colorscheme
    use {
        'neanias/everforest-nvim'
    }

    -- markdown preview
    -- ! VIMSCRIPT
    -- use {'iamcco/markdown-preview.nvim',
    --     run = function() vim.fn["mkdp#util#install"]() end,
    -- }

    -- Latex plugin
    -- ! VIMSCRPIT
    use {
        'lervag/vimtex',
    }

    -- Show colors
    use {
        'norcalli/nvim-colorizer.lua',
    }

    ---- EXPERIMENTAL
    -- bufferline
    use {'akinsho/bufferline.nvim', tag='v4.*', requires='nvim-tree/nvim-web-devicons'}

    use {'lewis6991/gitsigns.nvim'}

    use {'lewis6991/impatient.nvim'}

    use {'mfussenegger/nvim-dap',
        requires = {
            'mfussenegger/nvim-dap-python',
            'theHamsta/nvim-dap-virtual-text'
        }
    }

    use {'stsewd/isort.nvim', 
        run = ':UpdateRemotePlugins'
    }

    use {'folke/todo-comments.nvim',
        requires = {'nvim-lua/plenary.nvim'}
    }

end)

