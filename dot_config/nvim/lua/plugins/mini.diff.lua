return {
  'echasnovski/mini.diff',
  version = false,
  lazy = false,
  opts = {
    view = {
      style = "sign",
      signs = { add = '▎', change = '▎', delete = '▎' },

    }
  },
  config = function(_, opts)
    local diff = require("mini.diff")
    diff.setup(opts)
  end,
  keys = {
    { "<leader>gdo", function() MiniDiff.toggle_overlay() end, desc = "Toggle diff overlay" },
  },
}
