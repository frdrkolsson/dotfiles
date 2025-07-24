return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",  -- required
    "sindrets/diffview.nvim", -- optional - Diff integration
  },
  keys = {
    { "<leader>gt", "<cmd>Neogit<cr>", desc = "Neogit" },
  }
}
