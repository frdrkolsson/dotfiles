local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "<Leader>w", "<CMD>:w!<CR>", opts)
keymap.set("n", "<Leader><Leader>", "<c-^>", opts)
keymap.set("n", "<Leader>s", ":%s//g<Left><Left>", { noremap = true, silent = false }) -- Search and Replace
keymap.set("n", "<C-j>", vim.diagnostic.goto_next, opts)
keymap.set("n", "<C-k>", vim.diagnostic.goto_prev, opts)
keymap.set("n", "grt", vim.lsp.buf.type_definition, opts)

return {}
