return {
  'echasnovski/mini.nvim',
  version = false,
  event = "VeryLazy",
  config = function()
    require('mini.surround').setup()
    require('mini.icons').setup({
      extension = {
        ['test.tsx'] = { glyph = '', hl = 'MiniIconsBlue' },
        ['test.jsx'] = { glyph = '', hl = 'MiniIconsAzure' },
      },
    })
    require('mini.git').setup()
    require('mini.diff').setup({
      view = {
        style = "sign",
        signs = { add = '▎', change = '▎', delete = '▎' },
      }
    })
  end,
  keys = {
    { "<leader>gd",  function() MiniGit.show_diff_source() end, desc = "Show diff" },
    { "<leader>ga",  ":Git add %<CR>",                          desc = "Git add" },
    { "<leader>gdo", function() MiniDiff.toggle_overlay() end,  desc = "Toggle diff overlay" },
  },
}
