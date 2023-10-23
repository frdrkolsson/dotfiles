-- vim:fileencoding=utf-8:foldmethod=marker

-- General {{{
-- Set neovim to use 2 spaces as indentations
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2

vim.g.mapleader = ' '

vim.cmd [[set number]]        -- Show line numbers
vim.cmd [[set termguicolors]] -- Enable termgui colors
vim.cmd [[set colorcolumn=80" highlight ColorColumn ctermbg=0 guibg='#4E557980']] -- Editor ruler at 80
vim.cmd [[set laststatus=3]]
-- }}}

-- Plugins {{{
require 'plugins.lazy-bootstrap'

require('lazy').setup({
  { 'catppuccin/nvim', name = 'catppuccin' }, -- colorscheme
  {
    'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }
  },
  'nvim-tree/nvim-web-devicons', -- lua `fork` of vim-web-devicons for neovim
  { 'nvim-treesitter/nvim-treesitter',
    build = function() require('nvim-treesitter.install').update({ with_sync = true }) end },
  -- Language highlighting for languages not supported by treesitter
  'slim-template/vim-slim',
  'kchmck/vim-coffee-script',
  'fladson/vim-kitty',

  'lukas-reineke/indent-blankline.nvim',              -- A vim plugin to display the indention levels with thin vertical lines

  'janko-m/vim-test',                                 -- A Vim wrapper for running tests on different granularities.
  'hovsater/vim-test-neovim-error-only',              -- A custom Neovim strategy for test.vim that reuses the terminal buffer for running tests and automatically close buffer on success.

  'lewis6991/gitsigns.nvim',
  {
    'ruifm/gitlinker.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
  },
  'rhysd/git-messenger.vim',
  { 'NeogitOrg/neogit', dependencies = 'nvim-lua/plenary.nvim' },

  'tpope/vim-vinegar',       -- Combine with netrw to create a delicious salad dressing
  'tpope/vim-projectionist', -- Projectionist provides granular project configuration using "projections"
  'tpope/vim-fugitive',      -- A Git wrapper so awesome, it should be illegal

  'norcalli/nvim-colorizer.lua',
  { 'nvim-telescope/telescope.nvim', dependencies = { { 'nvim-lua/plenary.nvim' } } },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

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
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" }
    }
  },
  'MunifTanjim/prettier.nvim',

  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
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

  {
    'jose-elias-alvarez/null-ls.nvim', dependencies = { 'nvim-lua/plenary.nvim' },
  },
  'jayp0521/mason-null-ls.nvim',

  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end
  },
  "windwp/nvim-ts-autotag",
  'mfussenegger/nvim-dap',                                                -- Debug Adapter Protocol client implementation for Neovim
  { "mxsdev/nvim-dap-vscode-js", dependencies = { "mfussenegger/nvim-dap" } }, -- nvim-dap adapter for vscode-js-debug
  { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },

  {
    'rcarriga/neotest',
    dependencies = {
      'marilari88/neotest-vitest',
      'haydenmeade/neotest-jest',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-neotest/neotest-vim-test',
      'olimorris/neotest-rspec',
    }
  },
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
vim.keymap.set('n', '<Leader>w', ':w!<CR>')            -- Save with leader w
vim.keymap.set('n', '<Leader><Leader>', '<c-^>')       -- Switch between the last two files

vim.keymap.set('n', '<Leader>s', ':%s//g<Left><Left>') -- Search and Replace
vim.keymap.set('n', '<Leader>d', ':Dash<CR>')          -- Search documentation through Dash
vim.cmd([[
nnoremap <leader>g :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
]])                                                                      -- Search for word under cursor with telescope
vim.keymap.set('n', '<Leader>fr', ':source ~/.config/nvim/init.lua<CR>') -- Source config

vim.keymap.set('n', '<Leader>r', ':lua vim.lsp.buf.format()<CR>')        -- Format file
vim.keymap.set('n', '<Leader>z', ':ZenMode<CR>')                         -- ZenMode - Focus on current file only and center it
-- }}}

-- {{{ Requires
-- require 'plugins' -- TODO: did not get this one to work in separate plugins init file

require 'plugins.catppuccin'
require 'plugins.lualine'
require 'plugins.gitsigns'
require 'plugins.gitlinker'
require 'plugins.lsp-config'
require 'plugins.nvim-cmp'
require 'plugins.null-ls'
require 'plugins.nvim-colorizer'
require 'plugins.projectionist'
require 'plugins.telescope'
require 'plugins.treesitter'
require 'plugins.luasnip'
require 'plugins.lspsaga'
require 'plugins.prettier'
require 'plugins.nvim-dap'
require 'plugins.nvim-dap-vscode-js'
require 'plugins.dap-ui'
require 'plugins.neotest'
require 'plugins.neogit'
--- }}}
