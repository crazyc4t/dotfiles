--░█▀▀░█▀▄░█▀█░▀▀█░█░█░█▀▀░█░█░▀█▀
--░█░░░█▀▄░█▀█░▄▀░░░█░░█░░░░▀█░░█░
--░▀▀▀░▀░▀░▀░▀░▀▀▀░░▀░░▀▀▀░░░▀░░▀░
-----https://saidneder.tech-------
---https://github.com/crazyc4t----
--------- plugins.lua ------------


return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'Mofiqul/dracula.nvim'
    use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.opts)
    end
}
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
}
    use 'JoosepAlviste/nvim-ts-context-commentstring'
    use 'tpope/vim-commentary'
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'lervag/vimtex'
end)
