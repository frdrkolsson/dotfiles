return {
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    require('mini.nvim').setup({
      modules = {
        ['mini.surround'] = {},
        ['mini.pairs']    = {},
        ['mini.icons']    = {
          extension = {
            ['test.tsx'] = { glyph = '', hl = 'MiniIconsBlue' },
            ['test.jsx'] = { glyph = '', hl = 'MiniIconsAzure' },
          },
        },
        ['mini.git']      = {},
        ['mini.diff']     = {
          view = {
            style = "sign",
            signs = { add = '▎', change = '▎', delete = '▎' },

          }
        },
      },
    })
  end,
  keys = {
    { "<leader>gd", function() MiniGit.show_diff_source() end, desc = "Show diff" },
    { "<leader>ga", ":Git add %<CR>",                          desc = "Git add" },
    { "<leader>gdo", function() MiniDiff.toggle_overlay() end, desc = "Toggle diff overlay" },
  },
}
