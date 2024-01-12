require("flutter-tools").setup {
    widget_guides = {
        enabled = true
    },
    debugger = { -- integrate with nvim dap + install dart code debugger
        enabled = false,
        run_via_dap = false, -- use dap instead of a plenary job to run flutter apps
        -- if empty dap will not stop on any exceptions, otherwise it will stop on those specified
        -- see |:help dap.set_exception_breakpoints()| for more info


    },
    lsp = {
        color = { -- show the derived colours for dart variables
            enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
            background = false, -- highlight the background
            background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
            foreground = false, -- highlight the foreground
            virtual_text = true, -- show the highlight using virtual text
            virtual_text_str = "■" -- the virtual text character to highlight
        },

        -- see the link below for details on each option:
        -- https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/tool/lsp_spec/README.md#client-workspace-configuration
        settings = {
            showTodos = false,
            completeFunctionCalls = true,
            renameFilesWithClasses = "prompt", -- "always"
            enableSnippets = true,
            updateImportsOnRename = true -- Whether to update imports and other directives when files are renamed. Required for `FlutterRename` command.
        }
    }
}
