return {
  "olimorris/codecompanion.nvim",
  event = "VeryLazy",
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
    memory = {
      opts = {
        chat = {
          enabled = true,
          default_memory = { "default", "tidrapport" },
        },
      },
      tidrapport = {
        description = "Tidrapport React DynamoDB project context",
        files = {
          "CLAUDE.md",
          "package.json",
          "deno.json",
          "src/app/types/types.ts",
          "src/app/api/services/dynamoDBService.ts",
          "src/app/api/services/dynamoSchemas.ts",
        },
      },
    },
    adapters = {
      http = {
        copilot = function()
          return require("codecompanion.adapters").extend("copilot", {
            schema = {
              model = {
                default = "claude-sonnet-4.5",
              },
            },
          })
        end,
        ollama = function()
          return require("codecompanion.adapters").extend("ollama", {
            name = "ollama", -- Give this adapter a different name to differentiate it from the default ollama adapter
            schema = {
              model = {
                default = "gpt-oss:latest",
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
    },
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
  keys = {
    { "<Leader>cca", "<cmd>CodeCompanionActions<cr>",     desc = "CodeCompanion Actions" },
    { "<Leader>cca", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle CodeCompanion Chat" },
  }
}
