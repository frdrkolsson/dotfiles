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
  },
  pickers = {
    find_files = {
      find_command = { "fd", "--type", "f", "--strip-cwd-prefix", "--hidden", "--no-ignore" }
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
-- require('telescope').load_extension('fzf')
