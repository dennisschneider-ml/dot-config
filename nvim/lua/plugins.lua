local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function()
    -- packer can manage itself
    use 'wbthomason/packer.nvim'

    -- keybindings cheatsheet
    use 'folke/which-key.nvim'

    -- cmp
    use "dcampos/cmp-snippy" -- Suggest Snippets.
    use "hrsh7th/cmp-path" -- Suggest file paths.
    use "hrsh7th/cmp-buffer" -- Suggest words found in current buffer.
    use "hrsh7th/cmp-nvim-lsp" -- Make suggestions based on LSP.
    use "hrsh7th/cmp-cmdline" -- Make suggestions based on LSP.
    use "hrsh7th/cmp-nvim-lsp-signature-help" -- Make suggestions based on LSP.
    use "hrsh7th/nvim-cmp"-- Code completion.

    -- lsp
    use "neovim/nvim-lspconfig"
    use {
        "ThePrimeagen/refactoring.nvim",
        requires = {
            {"nvim-lua/plenary.nvim"},
            {"nvim-treesitter/nvim-treesitter"}
        }
    }

    -- fzf
    -- telescope
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
    use 'AckslD/nvim-neoclip.lua'
    use 'cljoly/telescope-repo.nvim'
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
    use 'honza/vim-snippets'

    -- nerdtree-alternative (not maintained anymore)
    use {'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons'}, tag = 'nightly'}

    -- goyo-alternative
    use 'pocco81/true-zen.nvim'

    -- lualine
    use {'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}

    -- colorscheme
    use {
        'neanias/everforest-nvim'
    }
    use {
        'Mofiqul/dracula.nvim',
        config = function() require('dracula').setup({
            transparent_bg = true,
            italic_comment = true
        }) end
    }
    use 'drewtempelmeyer/palenight.vim'

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

    if packer_bootstrap then
      require('packer').sync()
    end
end)

