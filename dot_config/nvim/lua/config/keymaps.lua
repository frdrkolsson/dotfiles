local keymap = vim.keymap
local opts = { noremap = true, silent = true }
---
--- @param diagnostic? vim.Diagnostic
--- @param bufnr integer
local function on_jump(diagnostic, bufnr)
  if not diagnostic then return end

  vim.diagnostic.show(
    diagnostic.namespace,
    bufnr,
    { diagnostic },
    { virtual_lines = { current_line = true }, virtual_text = false }
  )
end

keymap.set("n", "<Leader>w", "<CMD>:w!<CR>", opts)
keymap.set("n", "<Leader><Leader>", "<c-^>", opts)
keymap.set("n", "<Leader>r", vim.lsp.buf.format, { noremap = true, silent = true, desc = "Format file" })
keymap.set("n", "<Leader>s", ":%s//g<Left><Left>", { noremap = true, silent = false }) -- Search and Replace
keymap.set("n", "<C-j>", function() vim.diagnostic.jump({ count = 1, on_jump = on_jump }) end, opts)
keymap.set("n", "<C-k>", function() vim.diagnostic.jump({ count = -1, on_jump = on_jump }) end, opts)
keymap.set("n", "grt", vim.lsp.buf.type_definition, opts)

return {}
