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
vim.g.vimwiki_list = {
	{
		path = '~/Documents/vimwiki/',
		syntax = 'markdown',
		ext = '.md'
	}
}

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Colorizer
require'colorizer'.setup()

DEFAULT_OPTIONS = {
  RGB      = true;         -- #RGB hex codes
  RRGGBB   = true;         -- #RRGGBB hex codes
  names    = true;         -- "Name" codes like Blue
  RRGGBBAA = true;        -- #RRGGBBAA hex codes
  rgb_fn   = true;        -- CSS rgb() and rgba() functions
  hsl_fn   = true;        -- CSS hsl() and hsla() functions
  css      = true;        -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
  css_fn   = true;        -- Enable all CSS *functions*: rgb_fn, hsl_fn
  -- Available modes: foreground, background
  mode     = 'background'; -- Set the display mode.
}

-- Terminal
require("toggleterm").setup{
  -- size can be a number or function which is passed the current terminal
  open_mapping = [[<c-\>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = '<number>', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
  persist_size = true,
  direction = 'horizontal',
  close_on_exit = true, -- close the terminal window when the process exits
}
