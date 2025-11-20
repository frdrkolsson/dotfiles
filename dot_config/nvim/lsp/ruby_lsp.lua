vim.lsp.config['ruby_lsp'] = {
  cmd = { 'bundle', 'exec', 'ruby-lsp' },
  filetypes = { 'ruby' },
  root_markers = { 'Gemfile', '.git' },
}
