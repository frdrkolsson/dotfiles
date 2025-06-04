local status, codecompanion = pcall(require, 'codecompanion')
if (not status) then return end

codecompanion.setup({
  display = {
    diff = {
      enabled = true,
      close_chat_at = 240,
      layout = "vertical",
      opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
      provider = "mini_diff",
    },
    chat = {
      show_settings = true,
      window = {
        position = "right",
        width = 0.33,
      }
    }
  },
  adapters = {
    copilot = function()
      return require("codecompanion.adapters").extend("copilot", {
        schema = {
          model = {
            default = "claude-sonnet-4",
          },
          max_tokens = {
            default = 60000,
          },
        },
      })
    end,
    codellama = function()
      return require("codecompanion.adapters").extend("ollama", {
        name = "codellama", -- Give this adapter a different name to differentiate it from the default ollama adapter
        schema = {
          model = {
            default = "codellama:7b-code",
          },
          num_ctx = {
            default = 16384,
          },
          num_predict = {
            default = -1,
          },
        },
      })
    end,
    gemma3 = function()
      return require("codecompanion.adapters").extend("ollama", {
        name = "gemma3", -- Give this adapter a different name to differentiate it from the default ollama adapter
        schema = {
          model = {
            default = "gemma3:12b-it-qat",
          },
          num_ctx = {
            default = 16384,
          },
          num_predict = {
            default = -1,
          },
        },
      })
    end,
  },
  strategies = {
    chat = {
      adapter = "copilot",
      tools = {
        ["cmd_runner"] = {
          opts = {
            requires_approval = true,
          }
        },
        ["files"] = {
          opts = {
            requires_approval = true,
          }
        },
      },
      roles = {
        user = "fredrikolsson"
      }
    },
    inline = {
      adapter = "copilot",
    },
    opts = {
      completion_provider = "cmp",
    }
  },
})

-- require('plugins.extensions.codecompanion-noice-notifications').init()

-- vim.keymap.set({ "n", "v" }, "<Leader>ac", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
-- vim.keymap.set({ "n", "v" }, "<Leader>aa", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
-- vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])
vim.cmd([[cab ccc CodeCompanionChat]])
vim.cmd([[cab cca CodeCompanionActions]])
