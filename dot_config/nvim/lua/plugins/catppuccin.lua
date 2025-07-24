return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    integrations = {
      snacks = {
        enabled = true,
        indent_scope_color = "lavender", -- catppuccin color (eg. `lavender`) Default: text
      },
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
          ok = { "italic" },
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
          ok = { "underline" },
        },
        inlay_hints = {
          background = true,
        },
      },
    },
    highlight_overrides = {
      all = function(colors)
        return {
          -- Snacks.nvim picker NvChad style
          SnacksPicker = { bg = colors.base },
          SnacksPickerBorder = { fg = colors.surface0, bg = colors.base },
          SnacksPickerPreview = { bg = colors.base },
          SnacksPickerPreviewBorder = { fg = colors.base, bg = colors.base },
          SnacksPickerPreviewTitle = { fg = colors.base, bg = colors.green },
          SnacksPickerBoxBorder = { fg = colors.base, bg = colors.base },
          SnacksPickerInputBorder = { fg = colors.surface2, bg = colors.base },
          SnacksPickerInputSearch = { fg = colors.text, bg = colors.base },
          SnacksPickerList = { bg = colors.base },
          SnacksPickerListBorder = { fg = colors.base, bg = colors.base },
          SnacksPickerListTitle = { fg = colors.base, bg = colors.base },
        }
      end
    }
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd("colorscheme catppuccin-macchiato")
  end
}
