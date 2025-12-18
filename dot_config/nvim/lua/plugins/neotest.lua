return {
  "nvim-neotest/neotest",
  lazy = 'VeryLazy',
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "marilari88/neotest-vitest",
    "vim-test/vim-test",
    "nvim-neotest/neotest-vim-test",
    'nvim-neotest/neotest-jest',
  },
  opts = {
    adapters = {
      ["neotest-vitest"] = {},
      ["neotest-jest"] = {
        jestCommand = "npm test --",
        jestConfigFile = "custom.jest.config.ts",
        env = { CI = true },
        cwd = function()
          return vim.fn.getcwd()
        end,
      },
    },
  },
  keys = {
    { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end,      desc = "Run File (Neotest)" },
    { "<leader>tn", function() require("neotest").run.run() end,                        desc = "Run Nearest (Neotest)" },
    { "<leader>tl", function() require("neotest").run.run_last() end,                   desc = "Run Last (Neotest)" },
    { "<leader>ts", function() require("neotest").summary.toggle() end,                 desc = "Toggle Summary (Neotest)" },
    { "<leader>to", function() require("neotest").output_panel.toggle() end,            desc = "Toggle Output Panel (Neotest)" },
    { "<leader>ta", function() require("neotest").run.stop() end,                       desc = "Abort/Stop (Neotest)" },
    { "<leader>tw", function() require("neotest").watch.toggle(vim.fn.expand("%")) end, desc = "Toggle Watch (Neotest)" },
  }
}
