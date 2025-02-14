require('mason').setup()

local servers = { 'lua_ls', 'tailwindcss', 'eslint', 'ts_ls', 'sourcekit', 'cssls', 'ruby_lsp', 'stylelint_lsp' }
local mason_servers = { 'lua_ls', 'tailwindcss', 'eslint', 'ts_ls', 'cssls', 'ruby_lsp', 'stylelint_lsp'}

local mason_lspconfig = require('mason-lspconfig')
mason_lspconfig.setup({
  ensure_installed = mason_servers,
  automatic_installation = true,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lspconfig = require('lspconfig')

mason_lspconfig.setup_handlers {
  function(server_name)
    lspconfig[server_name].setup {
      capabilities = capabilities,
      settings = servers[server_name],
    }
  end
}


lspconfig.lua_ls.setup {
  settings = {
    capabilities = capabilities,
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      },
    },
  }, servers = {
    ruby_lsp = {
      mason = false,
      cmd = { vim.fn.expand("~/.asdf/shims/ruby-lsp") },
    },
  },
}

lspconfig.cssls.setup {
  capabilities = capabilities,
  init_options = {
    provideFormatter = true
  },
}

lspconfig.jdtls.setup({})

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', 'td', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>r', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
