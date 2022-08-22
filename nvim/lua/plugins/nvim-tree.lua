require("nvim-tree").setup({
  disable_netrw = false,
  hijack_netrw = false,
  sort_by = "case_sensitive",
  view = {
    adaptive_size = false,
  },
  renderer = {
    group_empty = true,
  },
  diagnostics = {
    enable = true
  },
  filters = {
    dotfiles = true,
  },
})
