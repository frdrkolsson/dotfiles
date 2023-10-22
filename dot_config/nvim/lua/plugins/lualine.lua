local lualine = require('lualine')
lualine.setup {
  options = {
    component_separators = '',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      {
        'mode',
        -- separator = { left = '' },
        right_padding = 2
      }
    },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = {
      {
        'filename',
        file_status = true, -- displays file status (readonly status, modified status)
        path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path},
        colored = true
      },
    },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress', { separator = { right = '' }}},
    lualine_z = {
    --   { 'diagnostics',
    --     -- Table of diagnostic sources, available sources are:
    --     --   'nvim_lsp', 'nvim_diagnostic', 'coc', 'ale', 'vim_lsp'.
    --     -- or a function that returns a table as such:
    --     --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
    --     -- sources = { 'nvim_diagnostic', 'nvim_lsp', 'nvim_workspace_diagnostic'  },

    --     -- Displays diagnostics for the defined severity types
    --     sections = { 'error', 'warn', 'info', 'hint' },

    --     diagnostics_color = {
    --       -- Same values as the general color option can be used here.
    --       error = 'DiagnosticError', -- Changes diagnostics' error color.
    --       warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
    --       info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
    --       hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
    --     },
    --     -- symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'},
    --     colored = true,           -- Displays diagnostics status in color if set to true.
    --     update_in_insert = false, -- Update diagnostics in insert mode.
    --     always_visible = false,  -- Show diagnostics even if there are none.
    --     separator = { right = '', left = '' },
    --   },
      { 'location' },
    }
  }
}
