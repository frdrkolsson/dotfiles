local dap = require('dap')

require("dap-vscode-js").setup({
  debugger_path = os.getenv('HOME') .. '/Code/vscode-js-debug',
  node_path = os.getenv('HOME') .. '.asdf/shims/node',
  -- debugger_cmd = { "js-debug-adapter" },                                                                         -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
  adapters = { 'pwa-node' }
})

local js_languages = { "typescript", "javascript", "typescriptreact", "typescriptreact" }
for _, language in ipairs(js_languages) do
  dap.configurations[language] = {
    {
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch Test Program (pwa-node with vitest)",
        cwd = "${workspaceFolder}",
        program = "${workspaceFolder}/node_modules/vitest/vitest.mjs",
        args = { "--threads", "false", },
        autoAttachChildProcesses = false,
        trace = true,
        console = "integratedTerminal",
        sourceMaps = true,
        smartStep = true,
      },
    }
  }
end
