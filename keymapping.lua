-- Telescope
-- Configure keymaps for telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>p', builtin.find_files, {})
vim.keymap.set('n', '<leader>ws', builtin.live_grep, {})
vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})
vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})

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

-- Flutter

-- Command to trigger running all Flutter tools
vim.api.nvim_set_keymap("n", "<leader>far", ":lua run_flutter_tools()<CR>", {
    noremap = true,
    silent = true
})
vim.api.nvim_set_keymap('n', '<leader>fr', ':lua flutter_hot_reload()<CR>', {
    noremap = true,
    silent = true
})
vim.api.nvim_set_keymap('n', '<leader>ffr', ':lua flutter_hot_restart()<CR>', {
    noremap = true,
    silent = true
})
vim.api.nvim_set_keymap('n', '<leader>faq', ':lua flutter_quit_app()<CR>', {
    noremap = true,
    silent = true
})
vim.api.nvim_set_keymap("n", "<leader>fe", ":lua show_flutter_emulators()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>e', ':TodoTelescope<CR>', {
    noremap = true,
    silent = true
})

-- Clear search
vim.api.nvim_set_keymap('n', '<leader>cs', ':nohlsearch<CR>', {})
