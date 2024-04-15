require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true
  },
  autotag = {
    enable = true
  }
})

vim.filetype.add({ extension = { snap = "html" } })
