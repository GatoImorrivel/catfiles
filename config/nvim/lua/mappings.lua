local map = vim.api.nvim_set_keymap
local options = { noremap = true }
local optionSilent = { noremap = true, silent = true }

map('n', '<Space>', '', {})
map('i', 'jk', '<ESC>', options)
map('n', '<leader>e', ':NvimTreeToggle<cr>', optionSilent)
map('n', ';', ':', options)
map('n', '<C-S>', ':update<CR>', optionSilent)
map('v', '<C-S>', '<C-C>:update<CR>', optionSilent)
map('i', '<C-S>', '<C-O>:update<CR>', optionSilent)
