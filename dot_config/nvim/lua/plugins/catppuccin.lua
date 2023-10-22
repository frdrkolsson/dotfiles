local catppuccin = require("catppuccin")

catppuccin.setup({
  flavour = "macchiato", -- mocha, macchiato, frappe, latte
  term_colors = true,
  integrations =  {
    treesitter = true
  }
})
vim.api.nvim_command "colorscheme catppuccin"
