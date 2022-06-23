-- Keybindings
-- keymap({[mode]}, {keymap}, {mapped to}, {options})
local keymap = vim.api.nvim_set_keymap

-- Options
local opts = { noremap = false, silent = true }

-- Normal Mode Keymaps
local function normap(key, map)
	keymap("n", key, map, opts)
end

-- Call alpha
keymap("n", "<c-a>", ":Alpha<CR>", opts)

-- Save with ctrl+s
keymap("n", "<c-s>", ":w<CR>", opts)
keymap("i", "<c-s>", "<Esc>:w<CR>a", opts)

-- Quit
keymap("n", "<c-q>", ":q<CR>", opts)

-- Navigate through splits
keymap("n", "<c-j>", "<c-w>j", opts)
keymap("n", "<c-h>", "<c-w>h", opts)
keymap("n", "<c-k>", "<c-w>k", opts)
keymap("n", "<c-l>", "<c-w>l", opts)

-- No arrow keys
-- Remove newbie crutches in Normal Mode
-- keymap('n', '<Up>', '<Nop>', opts)
-- keymap('n', '<Down>', '<Nop>', opts)
-- keymap('n', '<Left>', '<Nop>', opts)
-- keymap('n', '<Right>', '<Nop>', opts)

-- -- Remove newbie crutches in Insert Mode
-- keymap('i', '<Up>', '<Nop>', opts)
-- keymap('i', '<Down>', '<Nop>', opts)
-- keymap('i', '<Left>', '<Nop>', opts)
-- keymap('i', '<Right>', '<Nop>', opts)

-- -- Remove newbie crutches in Visual Mode
-- keymap('v', '<Up>', '<Nop>', opts)
-- keymap('v', '<Down>', '<Nop>', opts)
-- keymap('v', '<Left>', '<Nop>', opts)
-- keymap('v', '<Right>', '<Nop>', opts)

-- Telescope
normap("<leader>ff", ":lua require('telescope.builtin').find_files()<cr>")
normap("<leader>fg", ":lua require('telescope.builtin').live_grep()<cr>")
normap("<leader>fb", ":lua require('telescope.builtin').buffers()<cr>")
normap("<leader>fh", ":lua require('telescope.builtin').help_tags()<cr>")

-- Nerd Tree
normap("<c-b>", ":NvimTreeToggle<CR>")

-- Packer Sync
normap("P", ":PackerSync<CR>")

-- Buffer navigation
normap(">", ":bnext<CR>")
normap("<", ":bprevious<CR>")
normap("<c-d>", ":bdelete<CR>")

-- Diagnostics
normap("<leader>tr", ":TroubleToggle<cr>")

-- Aerial
normap("<leader>a", ":AerialToggle<cr>")
