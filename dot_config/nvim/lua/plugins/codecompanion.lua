local status, codecompanion = pcall(require, 'codecompanion')
if (not status) then return end

codecompanion.setup({
  display = {
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
            default = "claude-3.7-sonnet",
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
    qwen3 = function()
      return require("codecompanion.adapters").extend("ollama", {
        name = "qwen3", -- Give this adapter a different name to differentiate it from the default ollama adapter
        schema = {
          model = {
            default = "qwen3:4b",
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
            requires_approval = false,
          }
        },
        ["files"] = {
          opts = {
            requires_approval = false,
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
  },
})

require('plugins.extensions.codecompanion-noice-notifications').init()

vim.keymap.set({ "n", "v" }, "<Leader>ac", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<Leader>aa", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])
vim.cmd([[cab ccc CodeCompanionChat]])
