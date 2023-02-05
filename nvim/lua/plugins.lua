-- Bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- vim-surround
    'tpope/vim-surround',

    -- vim-commentary
    'tpope/vim-commentary',

    -- git
    'tpope/vim-fugitive',

    -- coc
    {'neoclide/coc.nvim', 
        branch='release'
    },

    -- fzf
    -- telescope
    {'nvim-telescope/telescope-fzf-native.nvim', 
        build='make'
    },
    'AckslD/nvim-neoclip.lua',
    'cljoly/telescope-repo.nvim',
    'nanotee/zoxide.vim',
    {'nvim-telescope/telescope.nvim',
        dependencies={
            'nvim-lua/plenary.nvim'
        },
    },

    -- auto-generate bracket-pairs
    'windwp/nvim-autopairs',

    -- treesitter
    'nvim-treesitter/nvim-treesitter',

    -- nerdtree-alternative (not maintained anymore)
    {'kyazdani42/nvim-tree.lua', 
        dependencies={
            'kyazdani42/nvim-web-devicons'
        }, 
        version='nightly'
    },

    -- goyo-alternative
    'pocco81/true-zen.nvim',

    -- dim inactive portions of code
    'folke/twilight.nvim',

    -- lualine
    {'nvim-lualine/lualine.nvim', 
        dependencies={
            'kyazdani42/nvim-web-devicons' 
        }
    },

    -- colorscheme
    {'sainnhe/everforest', 
        priority=1000,
        config=function()
            vim.cmd([[colorscheme everforest]])
        end,
    },

    -- markdown preview
    {'iamcco/markdown-preview.nvim',
        run = function() vim.fn["mkdp#util#install"]() end,
    },

    -- Latex plugin
    'lervag/vimtex',

    -- Show colors
    'norcalli/nvim-colorizer.lua',

    ---- EXPERIMENTAL
    -- bufferline
    {'akinsho/bufferline.nvim', 
        version='v3.*', 
    },

    'lewis6991/gitsigns.nvim', 

    'lewis6991/impatient.nvim',

    'akinsho/toggleterm.nvim',
})
