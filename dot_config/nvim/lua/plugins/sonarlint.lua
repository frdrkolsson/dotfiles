return {
  "https://gitlab.com/schrieveslaach/sonarlint.nvim",
  main = "sonarlint",
  ft = {
    "dockerfile",
    "java",
    "javascript",
    "typescript",
    "vue",
  },
  opts = {
    connected = {
      get_credentials = function(client_id, url)
        return vim.fn.getenv("SONAR_TOKEN")
      end
    },
    server = {
      cmd = {
        "sonarlint-language-server",
        "-stdio",
        "-analyzers",
        vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjava.jar"),
        vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjs.jar"),
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
          ["~/Code/uppgiftslamning"] = "se.ehalsomyndigheten.uppgiftslamning:uppgiftslamning-branch",
          ["~/Code/ndi-tokenservice"] = "se.ehalsomyndigheten.ndi-tokenservice:ndi-tokenservice",
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
    },
  },
  config = function(_, opts)
    require("sonarlint").setup(opts)
  end
}
