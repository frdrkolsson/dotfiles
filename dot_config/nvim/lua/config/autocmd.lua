-- vim:fileencoding=utf-8:foldmethod=marker

-- Ruler config {{{
local ruler_augroup = vim.api.nvim_create_augroup("RulerSettings", { clear = true })

-- Override the default only for Ruby files
vim.api.nvim_create_autocmd("FileType", {
  group = ruler_augroup,
  pattern = "ruby",
  callback = function()
    vim.o.colorcolumn = "80"
  end,
})
-- }}}
-- Trailing whitespace {{{
-- ===================================================
-- Removes trailing spaces
local whitespace_augroup = vim.api.nvim_create_augroup("Whitespace", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  group = whitespace_augroup,
  pattern = "*",
  callback = function()
    local view = vim.fn.winsaveview()
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.winrestview(view)
  end,
})
-- }}}
-- LSP Formatting {{{
local lsp_augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
  group = lsp_augroup,
  callback = function(ev)
    -- This enables omni-completion (e.g., <C-x><C-o>)
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local opts = { buffer = ev.buf }
    vim.keymap.set('n', '<Leader>r', function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})
-- }}}
-- Transparent background {{{
vim.api.nvim_create_augroup('user_colors', { clear = true })
vim.api.nvim_create_autocmd('ColorScheme', {
  group = 'user_colors',
  pattern = '*',
  callback = function()
    vim.api.nvim_set_hl(0, 'Normal', { ctermbg = 'NONE', bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'NormalNC', { ctermbg = 'NONE', bg = 'NONE' })
  end,
})
-- }}}

return {}
