-- vim:fileencoding=utf-8:foldmethod=marker

-- Plugins {{{
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
end

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use { 'catppuccin/nvim', as = 'catppuccin' } -- colorscheme
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'kyazdani42/nvim-web-devicons' -- lua `fork` of vim-web-devicons for neovim
  use { 'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end }
  -- Language highlighting for languages not supported by treesitter
  use 'slim-template/vim-slim'
  use 'kchmck/vim-coffee-script'
  use 'fladson/vim-kitty'

  use 'glepnir/dashboard-nvim'
  use 'lukas-reineke/indent-blankline.nvim' -- A vim plugin to display the indention levels with thin vertical lines
  use 'editorconfig/editorconfig-vim'

  use({ 'mrjones2014/dash.nvim', run = 'make install' }) -- 🏃💨 Search Dash.app from your Neovim fuzzy finder. Built with Rust 🦀 and Lua

  use 'janko-m/vim-test'                                 -- A Vim wrapper for running tests on different granularities.
  use 'hovsater/vim-test-neovim-error-only'              -- A custom Neovim strategy for test.vim that reuses the terminal buffer for running tests and automatically close buffer on success.

  use 'lewis6991/gitsigns.nvim'
  use {
    'ruifm/gitlinker.nvim',
    requires = 'nvim-lua/plenary.nvim',
  }
  use 'rhysd/git-messenger.vim'

  use 'tpope/vim-vinegar'       -- Combine with netrw to create a delicious salad dressing
  use 'tpope/vim-projectionist' -- Projectionist provides granular project configuration using "projections"
  use 'tpope/vim-fugitive'      -- A Git wrapper so awesome, it should be illegal

  use 'norcalli/nvim-colorizer.lua'
  use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/plenary.nvim' } } }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- LSP
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  }
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'         -- Snippets plugin
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'rafamadriz/friendly-snippets'
  use 'onsails/lspkind-nvim'

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  }
  use({
    'jose-elias-alvarez/null-ls.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  })
  use 'jayp0521/mason-null-ls.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
-- }}}

-- General {{{
-- Set neovim to use 2 spaces as indentations
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2

vim.g.mapleader = ' '

vim.cmd [[set number]]                                                            -- Show line numbers
vim.cmd [[set termguicolors]]                                                     -- Enable termgui colors
vim.cmd [[set colorcolumn=80" highlight ColorColumn ctermbg=0 guibg='#4E557980']] -- Editor ruler at 80
vim.cmd [[set laststatus=3]]
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
vim.keymap.set('n', '<Leader>d', ':Dash<CR>')          -- Search and Replace
vim.cmd([[
nnoremap <leader>g :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
]])                                                                      -- Search for word under cursor with telescope
vim.keymap.set('n', '<Leader>fr', ':source ~/.config/nvim/init.lua<CR>') -- Source config

vim.keymap.set('n', '<Leader>r', ':lua vim.lsp.buf.format()<CR>')        -- Format file
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
require 'plugins.dashboard-nvim'
require 'plugins.projectionist'
require 'plugins.telescope'
require 'plugins.treesitter'
require 'plugins.luasnip'
--- }}}
