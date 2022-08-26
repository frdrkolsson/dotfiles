-- vim:fileencoding=utf-8:foldmethod=marker

-- Plugins {{{
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use { 'catppuccin/nvim', as = 'catppuccin' } -- colorscheme
  use 'feline-nvim/feline.nvim'
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

  use 'janko-m/vim-test' -- A Vim wrapper for running tests on different granularities.
  use 'kevinsjoberg/vim-test-neovim-error-only' -- A custom Neovim strategy for test.vim that reuses the terminal buffer for running tests and automatically close buffer on success.

  use 'lewis6991/gitsigns.nvim'
  use 'ruifm/gitlinker.nvim'
  use 'rhysd/git-messenger.vim'

  use 'tpope/vim-vinegar' -- Combine with netrw to create a delicious salad dressing
  use 'tpope/vim-projectionist' -- Projectionist provides granular project configuration using "projections"

  use 'norcalli/nvim-colorizer.lua'
  use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/plenary.nvim' } } }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
-- }}}

-- General {{{
vim.g.mapleader = ' '

vim.cmd [[set number]] -- Show line numbers
vim.cmd [[set termguicolors]] -- Enable termgui colors
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

-- Keymaps {{{
-- Additional keymaps can be found in its respective plugins file, e.g. Telescopes <leader>ff
vim.keymap.set('n', '<Leader>w', ':w!<CR>') -- Save with leader w
vim.keymap.set('n', '<Leader><Leader>', '<c-^>') -- Switch between the last two files

vim.keymap.set('n', '<Leader>s', ':%s//g<Left><Left>') -- Search and Replace
vim.keymap.set('n', '<Leader>d', ':Dash<CR>') -- Search and Replace
vim.cmd([[
nnoremap <leader>g :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
]]) -- Search for word under cursor with telescope
vim.keymap.set('n', '<Leader>fr', ':source ~/.config/nvim/init.lua<CR>') -- Source config
-- }}}

-- Colorscheme {{{
vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha

vim.cmd [[colorscheme catppuccin]]

-- }}}

-- {{{ Requires
-- require 'plugins' -- TODO: did not get this one to work in separate plugins init file
require 'plugins.catppuccin'
require 'plugins.feline'
require 'plugins.gitsigns'
require 'plugins.gitlinker'
require 'plugins.nvim-colorizer'
require 'plugins.dashboard-nvim'
require 'plugins.projectionist'
require 'plugins.telescope'
require 'plugins.treesitter'
--- }}}
