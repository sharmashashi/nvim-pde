vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- Setup lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system(
        {"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
         lazypath})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({{'mfussenegger/nvim-dap'}, {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {'nvim-lua/plenary.nvim', 'stevearc/dressing.nvim' -- optional for vim.ui.select
    },
    config = function()
        -- alternatively you can override the default configs
        require("flutter-tools").setup {
            ui = {
                -- the border type to use for all floating windows, the same options/formats
                -- used for ":h nvim_open_win" e.g. "single" | "shadow" | {<table-of-eight-chars>}
                border = "rounded",
                -- This determines whether notifications are show with `vim.notify` or with the plugin's custom UI
                -- please note that this option is eventually going to be deprecated and users will need to
                -- depend on plugins like `nvim-notify` instead.
                notification_style = 'native'
            },
            decorations = {
                statusline = {
                    -- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
                    -- this will show the current version of the flutter app from the pubspec.yaml file
                    app_version = false,
                    -- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
                    -- this will show the currently running device if an application was started with a specific
                    -- device
                    device = true,
                    -- set to true to be able use the 'flutter_tools_decorations.project_config' in your statusline
                    -- this will show the currently selected project configuration
                    project_config = false
                }
            },
            debugger = { -- integrate with nvim dap + install dart code debugger
                enabled = true,
                run_via_dap = true, -- use dap instead of a plenary job to run flutter apps
                -- if empty dap will not stop on any exceptions, otherwise it will stop on those specified
                -- see |:help dap.set_exception_breakpoints()| for more info
                exception_breakpoints = {}
                --   register_configurations = function(paths)
                --     require("dap").configurations.dart = {
                --     }
                --   end,
            },
            -- flutter_path = "<full/path/if/needed>", -- <-- this takes priority over the lookup
            -- flutter_lookup_cmd = nil, -- example "dirname $(which flutter)" or "asdf where flutter"
            root_patterns = {".git", "pubspec.yaml"}, -- patterns to find the root of your flutter project
            fvm = false, -- takes priority over path, uses <workspace>/.fvm/flutter_sdk if enabled
            widget_guides = {
                enabled = true
            },
            closing_tags = {
                highlight = "comment", -- highlight for the closing tag
                prefix = "//", -- character to use for close tag e.g. > Widget
                enabled = true -- set to false to disable
            },
            dev_log = {
                enabled = true,
                notify_errors = true, -- if there is an error whilst running then notify the user
                open_cmd = "tabedit" -- command to use to open the log buffer
            },
            dev_tools = {
                autostart = false, -- autostart devtools server if not detected
                auto_open_browser = false -- Automatically opens devtools in the browser
            },
            outline = {
                open_cmd = "30vnew", -- command to use to open the outline buffer
                auto_open = false -- if true this will open the outline automatically when it is first populated
            },
            lsp = {
                color = { -- show the derived colours for dart variables
                    enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
                    background = true, -- highlight the background
                    background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
                    foreground = true, -- highlight the foreground
                    virtual_text = true, -- show the highlight using virtual text
                    virtual_text_str = "■" -- the virtual text character to highlight
                },
                --   on_attach = my_custom_on_attach,
                --   capabilities = my_custom_capabilities -- e.g. lsp_status capabilities
                --   --- OR you can specify a function to deactivate or change or control how the config is created
                --   capabilities = function(config)
                --     config.specificThingIDontWant = false
                --     return config
                --   end,
                -- see the link below for details on each option:
                -- https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/tool/lsp_spec/README.md#client-workspace-configuration
                settings = {
                    showTodos = true,
                    completeFunctionCalls = true,
                    -- analysisExcludedFolders = {"<path-to-flutter-sdk-packages>"},
                    renameFilesWithClasses = "prompt", -- "always"
                    enableSnippets = true,
                    updateImportsOnRename = true -- Whether to update imports and other directives when files are renamed. Required for `FlutterRename` command.
                }
            }
        }
    end
}, {
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
        require("nvim-tree").setup {}
    end
}}, {})

-- Configure keymaps for telescope
local builtin = require('telescope.builtin')
require("telescope").load_extension("flutter")
vim.keymap.set('n', '<C-p>', builtin.find_files, {})

-- Define the AutoSave function
function AutoSave()

    vim.cmd([[silent! wall]])

end

-- Autosave on CursorHold and InsertLeave events
vim.cmd([[
        autocmd CursorHold,CursorHoldI * lua AutoSave()
      ]])
vim.cmd([[
        autocmd InsertLeave * lua AutoSave()
      ]])

-- Show absolute line numbers
vim.cmd([[set number]])
