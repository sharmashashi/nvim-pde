local dap = require('dap')

  dap.adapters.dart = {
    type = "executable",
    command = "flutter",
    args = {"debug_adapter"}
  }
  dap.configurations.dart = {
    {
      type = "dart",
      request = "launch",
      name = "Launch Flutter Program",
      -- The nvim-dap plugin populates this variable with the filename of the current buffer
      program = "${file}",
      -- The nvim-dap plugin populates this variable with the editor's current working directory
      cwd = "${workspaceFolder}",
      -- This gets forwarded to the Flutter CLI tool, substitute `linux` for whatever device you wish to launch
      --toolArgs = {"-d", "macos"}
      --toolArgs = {"-d", "chrome"}
      toolArgs = {"-d", "43A7BCC1-E050-4BD7-9A2F-FB3EDAAB9B85"}
      --toolArgs = {"-d", "emulator-5554"}
      
    }
  }
