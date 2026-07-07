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
      _   _ _   _ _                                     _ _       _          _
     | | | (_) (_) |                                   | (_)     | |        | |
  ___| |_| | __ _| |___  ___  _ __ ___  _   _ _ __   __| |_  __ _| |__   ___| |_ ___ _ __
 / _ \  _  |/ _` | / __|/ _ \| '_ ` _ \| | | | '_ \ / _` | |/ _` | '_ \ / _ \ __/ _ \ '_ \
|  __/ | | | (_| | \__ \ (_) | | | | | | |_| | | | | (_| | | (_| | | | |  __/ ||  __/ | | |
 \___\_| |_/\__,_|_|___/\___/|_| |_| |_|\__, |_| |_|\__,_|_|\__, |_| |_|\___|\__\___|_| |_|
                                         __/ |               __/ |
                                        |___/               |___/
       ]],
      },
      sections = {
        { section = "header" },
        { section = "keys",  gap = 1, padding = 1 },
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
    { "<leader>fn",  function() Snacks.picker.notifications() end,                           desc = "Notification History" },
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
