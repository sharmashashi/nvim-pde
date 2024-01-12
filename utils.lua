-- change split window focus
vim.api.nvim_set_keymap('n', '<leader>w', '<C-w>w', {
    noremap = true,
    silent = true
})
-- command mode on esc on shell
vim.cmd([[tnoremap <Esc> <C-\><C-n>]])

-- command to save, format and re load the current dart file
function FormatCurrentFile()
    vim.cmd(":!dart format %")
    vim.fn.feedkeys("<CR>", "n")
    vim.cmd(":FlutterReload")
end

-- Map <Leader>df to call the format function
vim.api.nvim_set_keymap('n', '<Leader>df', [[:lua FormatCurrentFile()<CR>]], { noremap = true, silent = true })

