return require('packer').startup(function()

    -- Package manager
    use 'wbthomason/packer.nvim'

    -- Greeter
    use 'goolord/alpha-nvim'

    -- Treesiter
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
}
    -- Commentary
    use 'numToStr/Comment.nvim'

    -- Closing tags
    use 'windwp/nvim-autopairs'

    -- LSP & completitions
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
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
    use 'machakann/vim-sandwich'

    -- VimTex
    use 'lervag/vimtex'
    -- Status line
    use 'nvim-lualine/lualine.nvim'
    use 'kyazdani42/nvim-web-devicons'

    -- Snippets
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'

    -- Vim wiki
    use 'vimwiki/vimwiki'

    -- File explorer
    use 'kyazdani42/nvim-tree.lua'

    -- Buffer line
    use 'noib3/nvim-cokeline'

    -- Colorizer
    use 'norcalli/nvim-colorizer.lua'

    -- Colorscheme
    use 'Mofiqul/dracula.nvim'

    -- Emmet
    use 'mattn/emmet-vim'

    -- Terminal
    use 'akinsho/toggleterm.nvim'

    -- Arduino
    use 'stevearc/vim-arduino'

    -- Trouble (error checking)
    use 'folke/trouble.nvim'

    -- Transparent neovim
    use 'xiyaowong/nvim-transparent'

    -- Faster startup time
    use 'lewis6991/impatient.nvim'

    -- LSP colors
    use 'folke/lsp-colors.nvim'

   -- Formatter
   use 'jose-elias-alvarez/null-ls.nvim'

end)
