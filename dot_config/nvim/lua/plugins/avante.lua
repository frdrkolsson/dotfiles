if true then
  return {}
end

return {
  "yetone/avante.nvim",
  build = "make",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  ---@module 'avante'
  ---@type avante.Config
  opts = {
    auto_suggestions = false,
    provider = "copilot",
    behaviour = {
      enable_cursor_planning_mode = true,
    },
    providers = {
      copilot = {
        model = "gpt-4.1-2025-04-14",
        -- model = "claude-sonnet-4"
      },
      ollama = {
        model = "gemma3:12b-it-qat",
        extra_request_body = {
          options = {
            num_ctx = 32768,
            temperature = 0,
          },
        },
        endpoint = "http://127.0.0.1:11434",
        stream = true,
        disable_tools = true
      },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    {
      "zbirenbaum/copilot.lua",
      opts = {
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = "<Tab>",
            accept_word = false,
            accept_line = false,
            next = "<C-l>",
            prev = "<C-h>",
            dismiss = "<C-k>",
          },
        },
        panel = { enabled = false },

      }
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante", "codecompanion" },
    },
  },
}
