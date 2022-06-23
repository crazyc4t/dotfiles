local set = vim.opt
vim.cmd([[syntax on]])
vim.cmd([[filetype plugin indent on]])

-- Don't know what are you doing just seek for help!
-- :h expandtab

-- Tab configuration to use 4 spaces
set.expandtab = true
set.shiftwidth = 2
set.softtabstop = 2

-- GUI colors
set.termguicolors = true

-- Always set numbers
set.number = true

-- Enable spell checking
set.spell = true
set.spelllang = "en_us"
set.encoding = "utf-8"

-- Splits orders
set.splitbelow = true
set.splitright = true

-- Syntax highlighting
set.syntax = "on"

-- Show vim commands in the bottom line
set.showcmd = true

-- Follow indent
set.breakindent = true
