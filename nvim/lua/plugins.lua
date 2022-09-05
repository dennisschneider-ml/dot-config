return require('packer').startup(function()
    -- packer can manage itself
    use 'wbthomason/packer.nvim'

    -- vim-surround
    use 'tpope/vim-surround'

    -- vim-commentary
    use 'tpope/vim-commentary'

    -- git
    use 'tpope/vim-fugitive'

    -- himalaya mail-client
    -- Due to a bug from packer, the default installation from 'soywod/himalaya' does not work
    -- In order to still get an updated Himalaya-plugin and make it usable, you have to first install it from github
    -- And then load it locally from your nvim-packer directory.
    ---- Note the /path/to/himalaya/vim
    use 'soywod/himalaya'
    use '~/.local/share/nvim/site/pack/packer/start/himalaya/vim'

    -- coc
    use {'neoclide/coc.nvim', branch='release'}

    -- telescope
    use {'nvim-telescope/telescope.nvim',
        requires = {'nvim-lua/plenary.nvim'}
    }

    -- treesitter
    use 'nvim-treesitter/nvim-treesitter'

    -- nerdtree-alternative (not maintained anymore)
    use {'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons'}, tag = 'nightly'}

    -- goyo-alternative
    use 'pocco81/true-zen.nvim'

    -- dim inactive portions of code
    use 'folke/twilight.nvim'

    -- lualine
    use {'nvim-lualine/lualine.nvim', 
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    -- colorscheme
    use 'arcticicestudio/nord-vim'

end)
