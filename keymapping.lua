-- Telescope
-- Configure keymaps for telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>p', builtin.find_files, {})

-- NvimTree
-- Toggle NvimTree
vim.api.nvim_set_keymap('n', '<leader>t', ':NvimTreeToggle<CR>', {
    noremap = true,
    silent = true
})
-- Refresh NvimTree
vim.api.nvim_set_keymap('n', '<leader>r', ':NvimTreeRefresh<CR>', {
    noremap = true,
    silent = true
})

-- Lspsaga
-- Code action
vim.api.nvim_set_keymap('n', '<leader>ca', ':Lspsaga code_action<CR>', {
    noremap = true,
    silent = true
})
-- Hover documentation
vim.api.nvim_set_keymap('n', '<leader>hd', ':Lspsaga hover_doc<CR>', {
    noremap = true,
    silent = true
})
-- Floating terminal
vim.api.nvim_set_keymap('n', '<leader>ft', ':Lspsaga term_toggle<CR>', {
    noremap = true,
    silent = true
})
-- Rename
vim.api.nvim_set_keymap('n', '<leader>rn', ':Lspsaga rename<CR>', {
    noremap = true,
    silent = true
})
