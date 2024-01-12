local dap = require('dap')

dap.adapters.dart = {
  type = 'dart',
  request = 'launch',
  name = 'Dart-Flutter'
}

dap.configurations.dart = {
  {
    type = 'dart',
    request = 'launch',
    name = 'Flutter'
  }
}