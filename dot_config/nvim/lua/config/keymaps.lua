local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "<Leader>w", "<CMD>:w!<CR>", opts)
keymap.set("n", "<Leader><Leader>", "<c-^>", opts)
keymap.set("n", "<Leader>r", vim.lsp.buf.format, { noremap = true, silent = true, desc = "Format file" })
keymap.set("n", "<Leader>s", ":%s//g<Left><Left>", { noremap = true, silent = false }) -- Search and Replace
keymap.set("n", "<C-j>", function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)
keymap.set("n", "<C-k>", function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)
keymap.set("n", "grt", vim.lsp.buf.type_definition, opts)

return {}
