local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local custom_actions = {}

require("telescope").setup {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--hidden",
      "--smart-case"
    },
    selection_strategy = "reset",
    sorting_strategy = "descending",
    file_ignore_patterns = {
      "%.git/.*",
      "%.vim/.*",
      "node_modules/.*",
      "%.idea/.*",
      "%.vscode/.*",
      "%.history/.*"
    },
    layout_config = {
      vertical = {
        mirror = false
      },
      width = 0.93,
      prompt_position = "bottom"
    },
    mappings = {
      i = {
        -- close on escape
        ["<esc>"] = actions.close,
        ["<tab>"] = actions.toggle_selection + actions.move_selection_next,
        ["<s-tab>"] = actions.toggle_selection + actions.move_selection_previous
      },
      n = {
        ["<tab>"] = actions.toggle_selection + actions.move_selection_next,
        ["<s-tab>"] = actions.toggle_selection + actions.move_selection_previous
      }
    }
  }
}
