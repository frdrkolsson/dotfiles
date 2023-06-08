-- require('lspconfig').solargraph.setup()
require('mason').setup()

local servers = { 'lua_ls', 'tailwindcss', 'eslint', 'tsserver', 'sourcekit' }
local mason_servers = { 'lua_ls', 'tailwindcss', 'eslint', 'tsserver' }

local mason_lspconfig = require('mason-lspconfig')
mason_lspconfig.setup({
  ensure_installed = mason_servers,
  automatic_installation = true,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
for _, server_name in ipairs(servers) do
  require('lspconfig')[server_name].setup {
    capabilities = capabilities
  }
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
