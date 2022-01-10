-- Configs
-- Three types of configuration options
-- 1. Global options (vim.o)
-- 2. Local to window (vim.wo)
-- 3. Local to buffer (vim.bo)

-- Variables
local set = vim.opt
local nvimo = vim.o
local nvimwo = vim.wo
local nvimbo = vim.bo
local lspin = require('nvim-lsp-installer')

-- Don't know what are you doing just seek for help!
-- :h expandtab

-- Tab configuration to use 4 spaces
nvimbo.expandtab = true	
nvimbo.shiftwidth = 2
nvimbo.softtabstop = 2

-- Always set numbers
set.number = true

-- Enable spell checking
set.spell = true
set.spelllang = "en_us"

-- Splits orders
set.splitbelow = true
set.splitright = true

-- Syntax highlighting
set.syntax = 'on'

-- Show vim commands in the bottom line
set.showcmd = true

-- Follow indent
set.breakindent = true

-- Fold
set.foldmethod = 'expr'
set.foldexpr = 'nvim_treesitter#foldexpr()'

-- Treesitter
local treesitter = require'nvim-treesitter.configs'
treesitter.setup {
  ensure_installed = "maintained", -- Only use parsers that are maintained
  highlight = { -- enable highlighting
    enable = true, 
  },
  indent = {
    enable = true, -- default is disabled anyways
  }
}
-- LSP installer
lspin.on_server_ready(function(server)
  server:setup({})
end)
