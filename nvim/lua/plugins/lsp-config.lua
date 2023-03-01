-- require('lspconfig').solargraph.setup()
require('mason').setup()

local servers = { 'solargraph', 'lua_ls', 'tailwindcss', 'eslint' }

local mason_lspconfig = require('mason-lspconfig')
mason_lspconfig.setup({
  ensure_installed = servers,
  automatic_installation = true,
})

for _, server_name in ipairs(servers) do
  require('lspconfig')[server_name].setup {}
end

local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    }
  }
}
