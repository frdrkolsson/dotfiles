return {
  'nvim-java/nvim-java',
  config = function()
    local jdk21 = "/home/fredrik/.local/share/mise/installs/java/temurin-21.0.10+7.0.LTS"

    require('java').setup({
      jdk = {
        auto_install = false,
      },
      spring_boot_tools = {
        enable = false,
      },
    })

    vim.lsp.config('jdtls', {
      cmd_env = {
        JAVA_HOME = jdk21,
        PATH = jdk21 .. "/bin:" .. vim.env.PATH,
      },

      settings = {
        java = {
          configuration = {
            runtimes = {
              {
                name = "JavaSE-21",
                path = jdk21,
                default = true,
              },
            },
          },
        },
      },

      on_exit = function(code, signal, client_id)
        vim.schedule(function()
          vim.notify(
            ("jdtls exited: code=%s signal=%s client_id=%s"):format(
              tostring(code),
              tostring(signal),
              tostring(client_id)
            ),
            vim.log.levels.ERROR
          )
        end)
      end,
    })

    vim.lsp.enable('jdtls')
  end,
}
