local null_ls = require('null-ls')

null_ls.setup({
    sources = {
        null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.completion.spell,
        null_ls.builtins.completion.luasnip,
        null_ls.builtins.diagnostics.erb_lint,
        null_ls.builtins.formatting.erb_lint,
        null_ls.builtins.diagnostics.fish,
        null_ls.builtins.formatting.swiftlint,
        null_ls.builtins.diagnostics.swiftlint
    },
})

-- Order is important to make mason-null-ls.nvim work. This file needs to be
-- loaded after mason.nvim

require('mason-null-ls').setup()
