require 'settings/vimtex'
return require('packer').startup(function()
    -- Package manager
    use 'wbthomason/packer.nvim'
    -- Greeter
    use {
    'goolord/alpha-nvim',
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
}
    -- Treesiter
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
}
    -- Commentary
    use 'tpope/vim-commentary'
    -- LSP & completitions
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'David-Kunz/cmp-npm'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'saadparwaiz1/cmp_luasnip'
    -- Telescope
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'sharkdp/fd'
    -- Git
    use 'airblade/vim-gitgutter'
    use 'tpope/vim-fugitive'
    -- Auto Closing tabs
    use 'jiangmiao/auto-pairs'
    use 'machakann/vim-sandwich'
    -- VimTex
    use {
      'lervag/vimtex',
      opt = true,
      config = Texopts(),
      ft = 'tex'
    }
    -- Status line
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    -- Snippets
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'
    -- Markdown support
    use { 'godlygeek/tabular' }
    use { 'plasticboy/vim-markdown' }
    use { 'elzr/vim-json' }
    use { 'vim-pandoc/vim-pandoc-syntax' }
    use {
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn['mkdp#util#install']() end,
    ft = {'markdown'}
}
    -- Vim wiki
    use { 'vimwiki/vimwiki' }
    -- File explorer
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icon
      },
      config = function() require'nvim-tree'.setup {} end
    }
    -- Buffer line
    use({
      'noib3/nvim-cokeline',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function()
        require('cokeline').setup()
      end
    })
    -- Colorizer
    use { 'norcalli/nvim-colorizer.lua' }
    -- Oceanic Next colorscheme
    use 'mhartington/oceanic-next'
    -- Emmet
    use 'mattn/emmet-vim'
    -- Terminal
    use {"akinsho/toggleterm.nvim"}
    -- Arduino
    use {'stevearc/vim-arduino'}
    -- Trouble (error checking)
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }
    -- Transparent neovim
    use 'xiyaowong/nvim-transparent'
    -- Golang
    use 'ray-x/go.nvim'
end)
