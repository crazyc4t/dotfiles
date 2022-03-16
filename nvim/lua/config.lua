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

-- Arduino
local function arduino_status()
  local ft = vim.api.nvim_buf_get_option(0, "ft")
  if ft ~= "arduino" then
    return ""
  end
  local port = vim.fn["arduino#GetPort"]()
  local line = string.format("[%s]", vim.g.arduino_board)
  if vim.g.arduino_programmer ~= "" then
    line = line .. string.format(" [%s]", vim.g.arduino_programmer)
  end
  if port ~= 0 then
    line = line .. string.format(" (%s:%s)", port, vim.g.arduino_serial_baud)
  end
  return line
end

vim.g.arduino_use_cli = 1
vim.g.arduino_cli_args = '-v'
vim.g.arduino_board = 'arduino:avr:uno'

-- Dashboard (Alpha)
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {
 "  ▄████▄   ██▀███   ▄▄▄      ▒███████▒▓██   ██▓ ▄████▄   ▄▄▄     ▄▄▄█████▓",
 " ▒██▀ ▀█  ▓██ ▒ ██▒▒████▄    ▒ ▒ ▒ ▄▀░ ▒██  ██▒▒██▀ ▀█  ▒████▄   ▓  ██▒ ▓▒",
 " ▒▓█    ▄ ▓██ ░▄█ ▒▒██  ▀█▄  ░ ▒ ▄▀▒░   ▒██ ██░▒▓█    ▄ ▒██  ▀█▄ ▒ ▓██░ ▒░",
 " ▒▓▓▄ ▄██▒▒██▀▀█▄  ░██▄▄▄▄██   ▄▀▒   ░  ░ ▐██▓░▒▓▓▄ ▄██▒░██▄▄▄▄██░ ▓██▓ ░ ", 
 " ▒ ▓███▀ ░░██▓ ▒██▒ ▓█   ▓██▒▒███████▒  ░ ██▒▓░▒ ▓███▀ ░ ▓█   ▓██▒ ▒██▒ ░ ", 
 " ░ ░▒ ▒  ░░ ▒▓ ░▒▓░ ▒▒   ▓▒█░░▒▒ ▓░▒░▒   ██▒▒▒ ░ ░▒ ▒  ░ ▒▒   ▓▒█░ ▒ ░░   ", 
 "   ░  ▒     ░▒ ░ ▒░  ▒   ▒▒ ░░░▒ ▒ ░ ▒ ▓██ ░▒░   ░  ▒     ▒   ▒▒ ░   ░    ", 
 " ░          ░░   ░   ░   ▒   ░ ░ ░ ░ ░ ▒ ▒ ░░  ░          ░   ▒    ░      ", 
 " ░ ░         ░           ░  ░  ░ ░     ░ ░     ░ ░            ░  ░        ", 
 " ░                           ░         ░ ░     ░                          ", 
}

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "f", "  > Find file", ":Telescope find_files<CR>"),
    dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
    dashboard.button( "c", "  > Neovim Config" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
    dashboard.button( "v", "  > Vimwiki", ":VimwikiIndex<CR>" ),
    dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
}

dashboard.section.footer.val = "On my way."
-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])

-- Transparent
require("transparent").setup({
  enable = true, -- boolean: enable transparent
  extra_groups = { -- table/string: additional groups that should be clear
    -- In particular, when you set it to 'all', that means all avaliable groups

    -- example of akinsho/nvim-bufferline.lua
    "BufferLineTabClose",
    "BufferlineBufferSelected",
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineIndicatorSelected",
  },
  exclude = {}, -- table: groups you don't want to clear
})

require('go').setup()
-- require('go.format').gofmt()
