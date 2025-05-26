local catppuccin = require("catppuccin")

catppuccin.setup({
  flavour = "macchiato", -- mocha, macchiato, frappe, latte
  term_colors = true,
  integrations =  {
    treesitter = true,
    markview = true,
    mason = true,
    lsp_saga = true,
    neotest = true,
    noice = true,
    notify = true,
    lsp_trouble = true,
    which_key = true,
  }
})
vim.api.nvim_command "colorscheme catppuccin"
