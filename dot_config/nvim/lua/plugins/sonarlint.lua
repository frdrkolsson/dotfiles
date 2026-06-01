local mason_share = vim.fn.stdpath("data") .. "/mason/share/sonarlint-analyzers"

return {
  "https://gitlab.com/schrieveslaach/sonarlint.nvim",
  main = "sonarlint",
  ft = {
    "dockerfile",
    "java",
    "javascript",
    "typescript",
    "vue",
    "html",
    "xml",
  },
  opts = {
    connected = {
      get_credentials = function()
        return vim.fn.getenv("SONAR_TOKEN")
      end
    },
    server = {
      cmd = {
        "sonarlint-language-server",
        "-stdio",
        "-analyzers",
        mason_share .. "/sonarjava.jar",
        mason_share .. "/sonarjs.jar",
        mason_share .. "/sonarhtml.jar",
        mason_share .. "/sonarxml.jar",
      },
      handlers = {
        ["sonarlint/hasJoinedIdeLabs"] = function()
          return false
        end,
      },
      settings = {
        sonarlint = {
          connectedMode = {
            connections = {
              sonarqube = {
                {
                  connectionId = "ehalsomyndigheten-sonarqube",
                  -- this is the url that will go into get_credentials
                  serverUrl = "http://ehdstlsoqb01.ehitd.ehalsomyndigheten.se:19200",
                  disableNotifications = false,
                },
              },
            },
          },
        },
      },

      before_init = function(params, config)
        -- Your personal configuration needs to provide a mapping of root folders and project keys
        --
        -- In the future a integration with https://github.com/folke/neoconf.nvim or some similar
        -- plugin, might be worthwhile.
        local project_root_and_ids = {
          ["/home/fredrik/Code/uppgiftslamning"] = "se.ehalsomyndigheten.uppgiftslamning:uppgiftslamning-branch",
          ["/home/fredrik/Code/ndi-tokenservice"] = "se.ehalsomyndigheten.ndi-tokenservice:ndi-tokenservice",
          -- … further mappings …
        }

        config.settings.sonarlint.connectedMode.project = {
          connectionId = "ehalsomyndigheten-sonarqube",
          projectKey = project_root_and_ids[params.rootPath],
        }
      end,
    },
    filetypes = {
      "dockerfile",
      "javascript",
      "typescript",
      "vue",
      "java",
      "html",
      "xml",
    },
  },
  config = function(_, opts)
    require("sonarlint").setup(opts)
  end
}
