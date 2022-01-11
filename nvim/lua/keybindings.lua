--░█▀▀░█▀▄░█▀█░▀▀█░█░█░█▀▀░█░█░▀█▀
--░█░░░█▀▄░█▀█░▄▀░░░█░░█░░░░▀█░░█░
--░▀▀▀░▀░▀░▀░▀░▀▀▀░░▀░░▀▀▀░░░▀░░▀░
-----https://saidneder.tech-------
---https://github.com/crazyc4t----
------- keybindings.lua ----------

-- vim.api.nvim_set_keymap({[mode]}, {keymap}, {mapped to}, {options})
local keymap = vim.api.nvim_set_keymap

-- Save with ctrl+s
keymap('n', '<c-s>', ':w<CR>', {})
keymap('i', '<c-s>', '<Esc>:w<CR>a', {})

-- Navigate through splits
local opts = { noremap = true }
keymap('n', '<c-j>', '<c-w>j', opts)
keymap('n', '<c-h>', '<c-w>h', opts)
keymap('n', '<c-k>', '<c-w>k', opts)
keymap('n', '<c-l>', '<c-w>l', opts)

