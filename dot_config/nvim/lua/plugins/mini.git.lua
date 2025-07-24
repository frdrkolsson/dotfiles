return {
  'echasnovski/mini-git',
  version = false,
  opts = {},
  config = function(_, opts)
    require("mini.git").setup(opts)
  end,
  keys = {
    { "<leader>gd", function() MiniGit.show_diff_source() end, desc = "Show diff" },
    { "<leader>ga", ":Git add %<CR>",                          desc = "Git add" }
  },
}
