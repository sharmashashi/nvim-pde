local home = os.getenv('HOME')
package.path = package.path .. ';' .. home .. '/.config/nvim/?.lua'

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- Setup lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system(
        {"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
         lazypath})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({{'mfussenegger/nvim-dap'}, {
    'projekt0n/github-nvim-theme',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000 -- make sure to load this before all the other start plugins
}, {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.x',
    dependencies = {'nvim-lua/plenary.nvim'}
}, {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {"nvim-tree/nvim-web-devicons"}

}, {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {'nvim-lua/plenary.nvim', 'stevearc/dressing.nvim' -- optional for vim.ui.select
    },
    config = true
}}, {})

require('utils')
require('keymapping')
require('linenumber').setup()
require('autosave').setup()
require('shell')
require('flutter')
require('githubnvimtheme')
require('nvimtree')
