# neovim

This is my personal config repository to keep track of what I change/add/remove in my neovim configuration files.
Feel free to use.

## Setup

### Requirements
* [neovim](https://neovim.io) - At least version 0.70
* [packer.nvim](https://github.com/wbthomason/packer.nvim)

### Installation

1. To use, put these files in `~/.config/nvim`
2. Open `nvim` and execute `:PackerInstall`
3. Profit

## Plugins

* [packer.nvim](https://github.com/wbthomason/packer.nvim) - Plugin manager
* [catppuccin](https://github.com/catppuccin/nvim) - Colorscheme
* [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - Statusline
* [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) - Icons with colors, used by lualine and other plugins
* [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Syntax highlighting using tree-sitter, a parser generator tool and an incremental parsing library written in rust.
* [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Find, Filter, Preview, Pick. All lua, all the time.

### LSP

* [mason.nvim](https://github.com/williamboman/mason.nvim) - Portable package manager for Neovim that runs everywhere Neovim runs. Easily install and manage LSP servers, DAP servers, linters, and formatters.
* [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) - Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim
* [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - Quickstart configs for Nvim LSP
* [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - A completion plugin for neovim coded in Lua.

## Keybindings

Key | Value
---|---
<Leader> | <kbd>space</kbd>
Save | <Leader>w
Search and replace | <Leader>s
Fuzzy finder (telescope) | <Leader>ff
Live grep (telescope) | <Leader>fg
Find string in project (telescope) | <Leader>g
Refresh configuration | <Leader>fr
Format file with lsp | <Leader>r
Switch to previous file <Leader><Leader>
