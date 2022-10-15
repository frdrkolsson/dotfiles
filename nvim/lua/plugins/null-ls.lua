local null_ls = require('null-ls')

null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.completion.spell,
        null_ls.builtins.completion.luasnip,
        null_ls.builtins.diagnostics.erb_lint,
        null_ls.builtins.formatting.erb_lint,
    },
})

-- Order is important to make mason-null-ls.nvim work. This file needs to be
-- loaded after mason.nvim

require('mason-null-ls').setup()
