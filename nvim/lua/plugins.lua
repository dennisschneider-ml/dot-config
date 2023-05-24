return require('packer').startup(function()
    -- packer can manage itself
    use 'wbthomason/packer.nvim'

    -- vim-surround
    use 'tpope/vim-surround'

    -- vim-commentary
    use 'tpope/vim-commentary'

    -- git
    use 'tpope/vim-fugitive'

    -- coc
    use {'neoclide/coc.nvim', branch='release'}

    -- fzf
    -- telescope
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
    use 'AckslD/nvim-neoclip.lua'
    use 'cljoly/telescope-repo.nvim'
    use 'nanotee/zoxide.vim'
    use {'nvim-telescope/telescope.nvim',
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

    -- nerdtree-alternative (not maintained anymore)
    use {'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons'}, tag = 'nightly'}

    -- goyo-alternative
    use 'pocco81/true-zen.nvim'

    -- dim inactive portions of code
    use 'folke/twilight.nvim'

    -- lualine
    use {'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}

    -- colorscheme
    use 'sainnhe/everforest'

    -- markdown preview
    use {'iamcco/markdown-preview.nvim',
        run = function() vim.fn["mkdp#util#install"]() end,
    }

    -- Latex plugin
    use {
        'lervag/vimtex',
    }

    -- Snippets
    use {
        "L3MON4D3/LuaSnip",
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

    use {'akinsho/toggleterm.nvim'}

end)

