return {
  "olimorris/codecompanion.nvim",
  opts = {
    display = {
      chat = {
        show_settings = true,
        window = {
          position = "right",
          width = 0.33,
          opts = {
            number = false,
          }
        }
      }
    },
    adapters = {
      copilot = function()
        return require("codecompanion.adapters").extend("copilot", {
          schema = {
            model = {
              default = "gpt-4.1-2025-04-14",
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
        roles = {
          user = "fredrikolsson"
        }
      },
      inline = {
        adapter = "copilot",
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante", "codecompanion" },
      },
    },
  },
  keys = {
    { "<Leader>ac", "<cmd>CodeCompanionActions<cr>",     desc = "CodeCompanion Actions" },
    { "<Leader>aa", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle CodeCompanion Chat" },
  }
}
