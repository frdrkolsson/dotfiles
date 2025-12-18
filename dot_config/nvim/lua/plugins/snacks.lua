return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      preset = {
        header = [[
           🎄
           /🌟\
          /o o o\
         /o o o o\
        /🎁 o o o o\
       /o o o o o o\
      /o o o o o o o\
     /_______________\
           | |
           |_|

  🎅 Merry Christmas! 🎁
      Happy Coding! ⛄
        ]],
      },
      sections = {
        { section = "header" },
        { section = "keys",  gap = 1, padding = 1 },
        {
          pane = 2,
          icon = " ",
          desc = "Browse Repo",
          padding = 1,
          key = "b",
          action = function()
            Snacks.gitbrowse()
          end,
        },
        function()
          local in_git = Snacks.git.get_root() ~= nil
          local cmds = {
            {
              title = "Notifications",
              cmd = "gh notify -s -a -n5",
              action = function()
                vim.ui.open("https://github.com/notifications")
              end,
              key = "n",
              icon = " ",
              height = 5,
              enabled = true,
            },
            -- {
            --   title = "Open Issues",
            --   cmd = "gh issue list -L 3",
            --   key = "i",
            --   action = function()
            --     vim.fn.jobstart("gh issue list --web", { detach = true })
            --   end,
            --   icon = " ",
            --   height = 7,
            -- },
            {
              icon = " ",
              title = "Open PRs",
              cmd = "gh pr list -L 3",
              key = "P",
              action = function()
                vim.fn.jobstart("gh pr list --web", { detach = true })
              end,
              height = 7,
            },
            {
              icon = " ",
              title = "Git Status",
              cmd = "git --no-pager diff --stat -B -M -C",
              height = 10,
            },
          }
          return vim.tbl_map(function(cmd)
            return vim.tbl_extend("force", {
              pane = 2,
              section = "terminal",
              enabled = in_git,
              padding = 1,
              ttl = 5 * 60,
              indent = 3,
            }, cmd)
          end, cmds)
        end,
        { section = "startup" },
      },
    },
    explorer = { enabled = true },
    picker = {
      enabled = true,
      sources = {
        files = { hidden = true },
      },
    },
    git = { enabled = true },
    gitbrowse = { enabled = true },
    notifier = { enabled = true },
    indent = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },
  },
  keys = {
    -- Top Pickers
    { "<leader>fs", function() Snacks.picker.smart() end,                                   desc = "Smart Find Files" },
    { "<leader>,",  function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
    { "<leader>:",  function() Snacks.picker.command_history() end,                         desc = "Command History" },
    { "<leader>n",  function() Snacks.picker.notifications() end,                           desc = "Notification History" },
    { "<leader>e",  function() Snacks.explorer() end,                                       desc = "File Explorer" },
    -- find
    { "<leader>fb", function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
    { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    { "<leader>ff", function() Snacks.picker.files() end,                                   desc = "Find Files" },
    { "<leader>fg", function() Snacks.picker.grep() end,                                    desc = "Grep in Files" },
    { "<leader>fp", function() Snacks.picker.projects() end,                                desc = "Projects" },
    { "<leader>fr", function() Snacks.picker.recent() end,                                  desc = "Recent" },
    -- git
    { "<leader>gb", function() Snacks.picker.git_branches() end,                            desc = "Git Branches" },
    { "<leader>gl", function() Snacks.picker.git_log() end,                                 desc = "Git Log" },
    { "<leader>gL", function() Snacks.picker.git_log_line() end,                            desc = "Git Log Line" },
    { "<leader>gs", function() Snacks.picker.git_status() end,                              desc = "Git Status" },
    { "<leader>gS", function() Snacks.picker.git_stash() end,                               desc = "Git Stash" },
    { "<leader>gd", function() Snacks.picker.git_diff() end,                                desc = "Git Diff (Hunks)" },
    { "<leader>gf", function() Snacks.picker.git_log_file() end,                            desc = "Git Log File" },
    { "<leader>gb", function() Snacks.git.blame_line() end,                                 desc = "Git Blame Line" },
    { "<leader>gy", function() Snacks.gitbrowse.open() end,                                 desc = "Git Browse Open" },
  }
}
