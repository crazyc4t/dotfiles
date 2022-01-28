require 'config'
return require('packer').startup(function()
    -- Package manager
    use 'wbthomason/packer.nvim'
    -- Theme
    use 'Mofiqul/dracula.nvim'
    -- Greeter
    use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.opts)
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
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
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
      config = texopts(),
      ft = 'tex'
    }
    -- Status line
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    -- Snippets
    use 'SirVer/ultisnips'
    use 'honza/vim-snippets'
    -- Markdown support
    use { 'godlygeek/tabular' }
    use { 'elzr/vim-json' }
    use { 'plasticboy/vim-markdown' }
    use {
      'iamcco/markdown-preview.nvim',
      run = 'cd app && yarn install',
      cmd = 'MarkdownPreview'
  }
    use { 'vim-pandoc/vim-pandoc-syntax' }
end)
