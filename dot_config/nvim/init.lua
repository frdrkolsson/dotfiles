-- vim:fileencoding=utf-8:foldmethod=marker

-- General {{{
-- Set neovim to use 2 spaces as indentations
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.number = true        -- Show line numbers
vim.o.termguicolors = true -- Enable termgui colors
vim.o.laststatus = 3
vim.o.cursorline = true
vim.o.cursorlineopt = 'number'

vim.g.mapleader = ' '

vim.api.nvim_create_augroup("custom_group", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  group = "custom_group",
  callback = function()
    if vim.bo.filetype == 'ruby' then
      vim.api.nvim_set_option_value("colorcolumn", "80", {})  -- Editor ruler at 80 for ruby
    else
      vim.api.nvim_set_option_value("colorcolumn", "120", {}) -- Editor ruler at 120 for everything else
    end
  end
})


-- }}}

-- Plugins {{{
require 'plugins.lazy-bootstrap'

require('lazy').setup({
  { 'catppuccin/nvim',          name = 'catppuccin' }, -- colorscheme
  {
    'echasnovski/mini.icons',
    lazy = false,
    version = false,
    config = function()
      require("mini.icons").setup()

      require("mini.icons").mock_nvim_web_devicons()
    end
  },
  { 'nvim-lualine/lualine.nvim' },
  {
    'nvim-treesitter/nvim-treesitter',
    build = function() require('nvim-treesitter.install').update({ with_sync = true }) end
  },
  'lukas-reineke/indent-blankline.nvim', -- A vim plugin to display the indention levels with thin vertical lines

  'janko-m/vim-test',                    -- A Vim wrapper for running tests on different granularities.
  'hovsater/vim-test-neovim-error-only', -- A custom Neovim strategy for test.vim that reuses the terminal buffer for running tests and automatically close buffer on success.

  'lewis6991/gitsigns.nvim',
  {
    'ruifm/gitlinker.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
  },
  'rhysd/git-messenger.vim',
  { 'NeogitOrg/neogit', dependencies = 'nvim-lua/plenary.nvim' },

  { 'stevearc/oil.nvim' },
  'tpope/vim-projectionist', -- Projectionist provides granular project configuration using "projections"
  'tpope/vim-fugitive',      -- A Git wrapper so awesome, it should be illegal

  'norcalli/nvim-colorizer.lua',
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { { "junegunn/fzf", build = "./install --bin" } }
  },

  -- LSP
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-nvim-lua',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  'L3MON4D3/LuaSnip',         -- Snippets plugin
  'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
  'rafamadriz/friendly-snippets',
  'onsails/lspkind-nvim',
  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    dependencies = {
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" }
    }
  },
  'MunifTanjim/prettier.nvim',

  {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup {}
    end
  },
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {}
    end
  },
  {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {
        backdrop = 1,
        tmux = { enabled = false }
      }
    end
  },

  { 'zbirenbaum/copilot.lua' },
  { 'zbirenbaum/copilot-cmp' },
  { 'AndreM222/copilot-lualine' },

  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end
  },
  "windwp/nvim-ts-autotag",
  'mfussenegger/nvim-dap',                                                     -- Debug Adapter Protocol client implementation for Neovim
  { "mxsdev/nvim-dap-vscode-js", dependencies = { "mfussenegger/nvim-dap" } }, -- nvim-dap adapter for vscode-js-debug
  { "rcarriga/nvim-dap-ui",      dependencies = { "mfussenegger/nvim-dap" } },
  {
    'nvim-neotest/neotest',
    lazy = true,
    dependencies = {
      'nvim-neotest/nvim-nio',
      'marilari88/neotest-vitest',
      'haydenmeade/neotest-jest',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-neotest/neotest-vim-test',
      'olimorris/neotest-rspec',
      'zidhuss/neotest-minitest',
      'nvim-treesitter/nvim-treesitter'
    }
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end
  },
  {
    "olimorris/codecompanion.nvim",
    opts = {},
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      { 'echasnovski/mini.diff', version = '*' }
    },
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- Never set this value to "*"! Never!
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "hrsh7th/nvim-cmp",       -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua",       -- for file_selector provider fzf
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          -- use_absolute_path = true,
        },
      },
    },
    },
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    opts = {
      preview = {
        filetypes = { "markdown", "codecompanion", "Avante" },
        ignore_buftypes = {},
        icon_provider = "mini",
      }
    },
    dependencies = { 'echasnovski/mini.icons' }
  },
  {
    "ravitemer/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    build = "npm install -g mcp-hub@latest", -- Installs `mcp-hub` node binary globally
    config = function()
      require("mcphub").setup()
    end
  }
})
-- }}}

-- Config {{{
-- Lighter config is placed here
vim.g['test#strategy'] = 'neovim_error_only'

-- Trailing whitespace
-- ===================================================
-- Removes trailing spaces
vim.cmd([[
function! TrimWhiteSpace()
  mark `
  %s/\s\+$//e
  normal ``
endfunction
autocmd BufWritePre * call TrimWhiteSpace()
]])
-- }}}

-- Ruby host {{{
if vim.fn.executable('~/.asdf/shims/ruby') then
  vim.g.ruby_host_prog = '~/.asdf/shims/ruby'
end
-- }}}
-- Keymaps {{{
-- Additional keymaps can be found in its respective plugins file, e.g. Telescopes <leader>ff
vim.keymap.set('n', '<Leader>w', '<cmd>:w!<CR>')       -- Save with leader w
vim.keymap.set('n', '<Leader><Leader>', '<c-^>')       -- Switch between the last two files
vim.keymap.set('n', '<Leader>s', ':%s//g<Left><Left>') -- Search and Replace
vim.keymap.set('n', '<Leader>d', ':Dash<CR>')          -- Search documentation through Dash
vim.keymap.set('n', '<Leader>z', '<cmd>:ZenMode<CR>')  -- ZenMode - Focus on current file only and center it
-- vim.keymap.set('n', '<Leader><Esc>', '<cmd>:Noice dismiss<CR>') -- Noice - Dismiss messages
-- }}}

-- {{{ Requires
-- require 'plugins' -- TODO: did not get this one to work in separate plugins init file

require 'plugins.catppuccin'
require 'plugins.copilot'
require 'plugins.nvim-java'
require 'plugins.lualine'
require 'plugins.gitsigns'
require 'plugins.gitlinker'
require 'plugins.lsp-config'
require 'plugins.nvim-cmp'
require 'plugins.nvim-colorizer'
require 'plugins.projectionist'
require 'plugins.fzf-lua'
require 'plugins.treesitter'
require 'plugins.luasnip'
require 'plugins.lspsaga'
require 'plugins.prettier'
require 'plugins.nvim-dap'
require 'plugins.nvim-dap-vscode-js'
require 'plugins.dap-ui'
require 'plugins.neotest'
require 'plugins.neogit'
require 'plugins.oil'
require 'plugins.avante'
require 'plugins.codecompanion'
--- }}}
