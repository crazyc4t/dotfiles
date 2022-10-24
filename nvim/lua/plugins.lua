return require("packer").startup(function()
  -- Package manager
  use("wbthomason/packer.nvim")

  -- Greeter
  use("goolord/alpha-nvim")

  -- Treesiter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  -- Commentary
  use("numToStr/Comment.nvim")

  -- Closing tags
  use("windwp/nvim-autopairs")

  -- LSP
  use("neovim/nvim-lspconfig")
  use("williamboman/nvim-lsp-installer")

  -- Completitions
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-nvim-lua")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-cmdline")
  use("hrsh7th/nvim-cmp")
  use("saadparwaiz1/cmp_luasnip")

  -- Telescope
  use("nvim-lua/popup.nvim")
  use("nvim-lua/plenary.nvim")
  use("nvim-telescope/telescope.nvim")
  use("sharkdp/fd")

  -- Git
  use("lewis6991/gitsigns.nvim")

  -- VimTex
  use("lervag/vimtex")

  -- Status line
  use("nvim-lualine/lualine.nvim")
  use("kyazdani42/nvim-web-devicons")

  -- Snippets
  use("L3MON4D3/LuaSnip")
  use("rafamadriz/friendly-snippets")

  -- File explorer
  use("kyazdani42/nvim-tree.lua")

  -- Buffer line
  use("noib3/nvim-cokeline")

  -- Colorizer
  use("norcalli/nvim-colorizer.lua")

  -- Colorscheme
  use({ "catppuccin/nvim", as = "catppuccin" })

  -- Emmet
  use("mattn/emmet-vim")

  -- Terminal
  use("akinsho/toggleterm.nvim")

  -- Arduino
  use("stevearc/vim-arduino")

  -- Trouble (error checking)
  use("folke/trouble.nvim")

  -- Faster startup time
  use("lewis6991/impatient.nvim")

  -- Spellsitter
  use("lewis6991/spellsitter.nvim")

  -- LSP colors
  use("folke/lsp-colors.nvim")

  -- Formatter
  use("jose-elias-alvarez/null-ls.nvim")

  -- Discord presence
  use("andweeb/presence.nvim")

  -- Code navigation
  use({
    "stevearc/aerial.nvim",
    config = function()
      require("aerial").setup()
    end,
  })
  -- Hover
  use({
    "lewis6991/hover.nvim",
    config = function()
      require("hover").setup({
        init = function()
          -- Require providers
          require("hover.providers.lsp")
          require("hover.providers.gh")
          require("hover.providers.man")
          -- require('hover.providers.dictionary')
        end,
        preview_opts = {
          border = nil,
        },
        title = true,
      })

      -- Setup keymaps
      vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })
      vim.keymap.set("n", "gK", require("hover").hover_select, { desc = "hover.nvim (select)" })
    end,
  })

  -- install without yarn or npm
  use({
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  })

  -- LSP, formatter, linter installer
  use({ "williamboman/mason.nvim" })
  use({ "williamboman/mason-lspconfig.nvim" })

  -- Transparent background
  use("xiyaowong/nvim-transparent")
end)
