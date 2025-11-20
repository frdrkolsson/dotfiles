function catpuccin_old_colors(C)
  local O = require("catppuccin").options
  return {
    ["@variable.member"] = { fg = C.lavender },                                             -- For fields.
    ["@module"] = { fg = C.lavender, style = O.styles.miscs or { "italic" } },              -- For identifiers referring to modules and namespaces.
    ["@string.special.url"] = { fg = C.rosewater, style = { "italic", "underline" } },      -- urls, links and emails
    ["@type.builtin"] = { fg = C.yellow, style = O.styles.properties or { "italic" } },     -- For builtin types.
    ["@property"] = { fg = C.lavender, style = O.styles.properties or {} },                 -- Same as TSField.
    ["@constructor"] = { fg = C.sapphire },                                                 -- For constructor calls and definitions: = { } in Lua, and Java constructors.
    ["@keyword.operator"] = { link = "Operator" },                                          -- For new keyword operator
    ["@keyword.export"] = { fg = C.sky, style = O.styles.keywords },
    ["@markup.strong"] = { fg = C.maroon, style = { "bold" } },                             -- bold
    ["@markup.italic"] = { fg = C.maroon, style = { "italic" } },                           -- italic
    ["@markup.heading"] = { fg = C.blue, style = { "bold" } },                              -- titles like: # Example
    ["@markup.quote"] = { fg = C.maroon, style = { "bold" } },                              -- block quotes
    ["@markup.link"] = { link = "Tag" },                                                    -- text references, footnotes, citations, etc.
    ["@markup.link.label"] = { link = "Label" },                                            -- link, reference descriptions
    ["@markup.link.url"] = { fg = C.rosewater, style = { "italic", "underline" } },         -- urls, links and emails
    ["@markup.raw"] = { fg = C.teal },                                                      -- used for inline code in markdown and for doc in python (""")
    ["@markup.list"] = { link = "Special" },
    ["@tag"] = { fg = C.mauve },                                                            -- Tags like html tag names.
    ["@tag.attribute"] = { fg = C.teal, style = O.styles.miscs or { "italic" } },           -- Tags like html tag names.
    ["@tag.delimiter"] = { fg = C.sky },                                                    -- Tag delimiter like < > /
    ["@property.css"] = { fg = C.lavender },
    ["@property.id.css"] = { fg = C.blue },
    ["@type.tag.css"] = { fg = C.mauve },
    ["@string.plain.css"] = { fg = C.peach },
    ["@constructor.lua"] = { fg = C.flamingo },     -- For constructor calls and definitions: = { } in Lua.
    -- typescript
    ["@property.typescript"] = { fg = C.lavender, style = O.styles.properties or {} },
    ["@constructor.typescript"] = { fg = C.lavender },
    -- TSX (Typescript React)
    ["@constructor.tsx"] = { fg = C.lavender },
    ["@tag.attribute.tsx"] = { fg = C.teal, style = O.styles.miscs or { "italic" } },
    ["@type.builtin.c"] = { fg = C.yellow, style = {} },
    ["@type.builtin.cpp"] = { fg = C.yellow, style = {} },
    ["@tag.builtin"] = { fg = C.mauve },
  }
end

return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    auto_integrations = true,
    float = {
      transparent = false,
      solid = true,
    },
    integrations = {
      snacks = {
        enabled = true,
        indent_scope_color = "lavender", -- catppuccin color (eg. `lavender`) Default: text
        picker_style = "nvchad",
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
    custom_highlights = catpuccin_old_colors,
    highlight_overrides = {
      all = function(colors)
        return {
          -- Snacks.nvim picker NvChad style
          -- SnacksPicker = { bg = colors.base },
          -- SnacksPickerBorder = { fg = colors.surface0, bg = colors.base },
          -- SnacksPickerPreview = { bg = colors.base },
          -- SnacksPickerPreviewBorder = { fg = colors.base, bg = colors.base },
          -- SnacksPickerPreviewTitle = { fg = colors.base, bg = colors.green },
          -- SnacksPickerBoxBorder = { fg = colors.base, bg = colors.base },
          SnacksPickerInputBorder = { fg = colors.surface2, bg = colors.mantle },
          -- SnacksPickerInputSearch = { fg = colors.text, bg = colors.base },
          -- SnacksPickerList = { bg = colors.base },
          -- SnacksPickerListBorder = { fg = colors.base, bg = colors.base },
          -- SnacksPickerListTitle = { fg = colors.base, bg = colors.base },
        }
      end
    }
  },

  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd("colorscheme catppuccin-macchiato")
  end
}
