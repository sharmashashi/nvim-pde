-- change split buff focus
vim.api.nvim_set_keymap('n', '<leader>bc', '<C-w>w', {
    noremap = true,
    silent = true
})
-- command mode on esc on shell
vim.cmd([[tnoremap <Esc> <C-\><C-n>]])

-- command to save, format and re load the current dart file
function FormatCurrentFile()
    vim.cmd(":!dart format %")
    --vim.fn.feedkeys("<CR>", "n")
end

-- Map <Leader>df to call the format function
vim.api.nvim_set_keymap('n', '<Leader>df', [[:lua FormatCurrentFile()<CR>]], { noremap = true, silent = true })

