-- Configs
-- Three types of configuration options
-- 1. Global options (vim.o)
-- 2. Local to window (vim.wo)
-- 3. Local to buffer (vim.bo)

-- But if you use vim.opt it can adjust to the use.

-- Variables
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
vim.opt.termguicolors = true

-- Always set numbers
set.number = true

-- Enable spell checking
set.spell = true
set.spelllang = 'en_us'
set.encoding = 'utf-8'
-- Splits orders
set.splitbelow = true
set.splitright = true

-- Syntax highlighting
set.syntax = 'on'

-- Show vim commands in the bottom line
set.showcmd = true

-- Follow indent
set.breakindent = true

-- Status line
require('lualine').setup()

-- Markdown
vim.g.vim_markdown_folding_disabled = 1
vim.g.vim_markdown_conceal = 0
vim.g.vim_markdown_json_frontmatter = 1


-- Autocommands
-- vim.cmd [[
-- augroup nvimtree_open
-- autocmd!
-- autocmd VimEnter * NvimTreeOpen
-- autocmd VimEnter * wincmd p
-- augroup end
-- ]]
-- Cokeline

