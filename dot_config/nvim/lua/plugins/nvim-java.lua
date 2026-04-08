return {
  'nvim-java/nvim-java',
  config = function()
    require('java').setup({
      jdk = {
        auto_install = false
      },
      spring_boot_tools = {
        enable = false
      }
    })
    vim.lsp.config('jdtls', {
      settings = {
        java = {
          configuration = {
            runtimes = {
              {
                name = "JavaSE-21",
                path = "/home/fredrik/.local/share/mise/installs/java/temurin-21.0.10+7.0.LTS/",
                default = true,
              }
            }
          }
        }
      }
    })
    vim.lsp.enable('jdtls')
  end,
}
