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
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
        -- Default options
        require('github-theme').setup({
            options = {
                -- Compiled file's destination location
                compile_path = vim.fn.stdpath('cache') .. '/github-theme',
                compile_file_suffix = '_compiled', -- Compiled file suffix
                hide_end_of_buffer = true, -- Hide the '~' character at the end of the buffer for a cleaner look
                hide_nc_statusline = true, -- Override the underline style for non-active statuslines
                transparent = false, -- Disable setting background
                terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
                dim_inactive = false, -- Non focused panes set to alternative background
                module_default = true, -- Default enable value for modules
                styles = { -- Style to be applied to different syntax groups
                    comments = 'italic', -- Value is any valid attr-list value `:help attr-list`
                    functions = 'NONE',
                    keywords = 'NONE',
                    variables = 'NONE',
                    conditionals = 'NONE',
                    constants = 'NONE',
                    numbers = 'NONE',
                    operators = 'NONE',
                    strings = 'NONE',
                    types = 'NONE'
                },
                inverse = { -- Inverse highlight for different types
                    match_paren = false,
                    visual = false,
                    search = false
                },
                darken = { -- Darken floating windows and sidebar-like windows
                    floats = false,
                    sidebars = {
                        enabled = true,
                        list = {} -- Apply dark background to specific windows
                    }
                },
                modules = { -- List of various plugins and additional options
                    -- ...
                }
            },
            palettes = {},
            specs = {},
            groups = {}
        })

        -- setup must be called before loading
        vim.cmd('colorscheme github_dark')

        vim.cmd('colorscheme github_dark_dimmed')
    end
}, {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.x',
    dependencies = {'nvim-lua/plenary.nvim'}
}, {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
        require("nvim-tree").setup({
            sort = {
                sorter = "case_sensitive"
            },
            view = {
                width = 30
            },
            renderer = {
                group_empty = true
            },
            filters = {
                dotfiles = false
            }
        })
    end
}}, {})

-- change split window focus
vim.api.nvim_set_keymap('n', '<leader>w', '<C-w>w', {
    noremap = true,
    silent = true
})
-- command mode on esc on shell
vim.cmd([[tnoremap <Esc> <C-\><C-n>]])

require('keymapping')
require('linenumber').setup()
require('autosave').setup()
require('shell')
