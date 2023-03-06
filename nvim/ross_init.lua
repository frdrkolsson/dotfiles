-- vim:fileencoding=utf-8:foldmethod=marker

vim.g.mapleader = ' '

-- Plugins {{{
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'Yggdroot/indentLine' -- A vim plugin to display the indention levels with thin vertical lines
  use 'bogado/file-line' -- Enabling opening a file in a given line
  use 'christoomey/vim-tmux-navigator' -- Use ^hjkl to navigate in tmux and vim panes
  use 'djoshea/vim-autoread' -- Autoreload changed files
  use 'editorconfig/editorconfig-vim'
  use 'ellisonleao/gruvbox.nvim' -- Colorscheme with treesitter support
  use 'farmergreg/vim-lastplace' -- Open file at the last place it was opened on
  use 'janko-m/vim-test' -- A Vim wrapper for running tests on different granularities.
  use 'junegunn/vim-easy-align'
  use 'junegunn/vim-peekaboo' -- Peek at register when register is used
  use 'justinmk/vim-dirvish' -- Directory viewer for Vim
  use 'kevinsjoberg/vim-test-neovim-error-only' -- A custom Neovim strategy for test.vim that reuses the terminal buffer for running tests and automatically close buffer on success.
  use 'kristijanhusak/vim-dirvish-git' -- Git support for dirvish.vim
  use 'kyazdani42/nvim-web-devicons' -- lua `fork` of vim-web-devicons for neovim
  use 'mhinz/vim-signify'
  use 'mileszs/ack.vim' -- Ack searcher
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lualine/lualine.nvim' -- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
  use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } } -- FZF as a popup window
  use 'rhysd/git-messenger.vim'
  use 'rizzatti/dash.vim'
  use 'sheerun/vim-polyglot'
  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-projectionist' -- Projectionist provides granular project configuration using "projections".
  use 'tpope/vim-surround'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- LSP and autocomplete
  use 'neovim/nvim-lspconfig' -- Quickstart configurations for the Nvim LSP client
  use 'williamboman/nvim-lsp-installer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'onsails/lspkind-nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
-- }}}

-- General {{{
vim.o.lazyredraw = true
vim.o.showcmd = true
vim.wo.linebreak = true
vim.wo.list = true
vim.wo.number = true
vim.wo.wrap = true

if vim.fn.has('multi_byte') == 1 and vim.o.encoding == 'utf-8' then
  vim.o.listchars = [[tab:▸ ,extends:❯,precedes:❮,nbsp:±,trail:…]]
else
  vim.o.listchars = [[tab:> ,extends:>,precedes:<,nbsp:.,trail:_]]
end

-- Tabs and indentations
vim.bo.autoindent = true
vim.bo.expandtab = true
vim.bo.softtabstop = 2
vim.bo.shiftwidth = 2
vim.bo.tabstop = 2
vim.bo.smartindent = true
vim.bo.modeline = false

-- No swap files
vim.bo.swapfile = false
vim.o.backup = false
vim.o.writebackup = false
-- }}}

-- Colorscheme {{{
vim.cmd([[
set t_Co=256
if $COLORTERM == "truecolor" || $COLORTERM == "24bit"
  if has("nvim")
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    if !has('nvim')
      let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
      let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif
    set termguicolors
  endif
endif
]])

function IsAppearanceLight()
  local filepath = vim.fn.expand("~/.config/appearance/current")
  return vim.fn.filereadable(filepath) and vim.fn.readfile(filepath)[1] == "Light"
end

function DarkMode()
  vim.env.BAT_THEME = 'gruvbox-dark'
  vim.o.background = "dark"
  vim.cmd([[colorscheme gruvbox]])
end

function LightMode()
  vim.env.BAT_THEME = 'gruvbox-light'
  vim.o.background = "light"
  vim.cmd([[colorscheme gruvbox]])
end

if IsAppearanceLight() then
  LightMode()
else
  DarkMode()
end
-- }}}

-- LSP {{{
vim.o.completeopt = "menu,menuone,noselect"

-- Autocomplete ---
-------------------

-- Setup nvim-cmp.
local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },

  completion = {
    completeopt = 'menu,menuone,noselect',
  },

  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
    ["<CR>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      }),
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  },

  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = lspkind.presets.default[vim_item.kind] .. " " .. vim_item.kind
      vim_item.menu = ({
          nvim_lsp = "[L]",
          emoji = "[E]",
          path = "[F]",
          calc = "[C]",
          vsnip = "[S]",
          buffer = "[B]",
        })[entry.source.name]
      vim_item.dup = ({
          buffer = 1,
          path = 1,
          nvim_lsp = 0,
        })[entry.source.name] or 0
      return vim_item
    end,
  },

  sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
    }, {
      { name = 'buffer' },
    })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

--   LSP setup   --
-------------------

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local lsp_installer = require("nvim-lsp-installer")
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local handlers = {
  ["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = true
    }
  ),
}

local enhance_server_opts = {
  -- TODO: HTML lsp is not on for html.erb files and this makes this if case
  -- below trash. We need to make it to load that one first
  ["html"] = function(opts)
    opts.filetypes = { 'html', 'eruby', 'erb' }
  end,
  ["solargraph"] = function(opts)
    opts.settings = {
      solargraph = {
        autoformat = true,
        completion = true,
        diagnostic = true,
        folding = true,
        references = true,
        rename = true,
        symbols = true,
        useBundler = true,
      }
    }
  end,
  ["sumneko_lua"] = function (opts)
    opts.settings = {
      Lua = {
        diagnostics = {
          globals = {
            "vim"
          }
        }
      }
    }
  end,
}

-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
lsp_installer.on_server_ready(function(server)
    local opts = {
      on_attach = on_attach,
      capabilities = capabilities,
      handlers = handlers,
      flags = {
        debounce_text_changes = 150,
      },
    }

    if enhance_server_opts[server.name] then
      -- Enhance the default opts with the server-specific ones
      enhance_server_opts[server.name](opts)
    end

    server:setup(opts)
end)
-- }}}

-- Ack search settings {{{
if vim.fn.executable('rg') then
  vim.g.ackprg = 'rg --vimgrep --hidden --follow --glob "!.git/*" '
elseif vim.fn.executable('ag') then
  vim.g.ackprg = "ag --vimgrep --hidden"
end
-- }}}

-- Dirvish {{{
function GetFileName(url)
  return ("mock/" .. url):match("^.+/(.+)$")
end

function GetFileExtension(url)
  return url:match("^.+%.(.+)$")
end

function GetFileTypeSymbol(path)

  return require('nvim-web-devicons').get_icon(GetFileName(path), GetFileExtension(path), { default = true })
end

vim.fn["dirvish#add_icon_fn"](GetFileTypeSymbol)
-- }}}

-- Persistent undo {{{
vim.cmd('silent !mkdir -p ~/.config/nvim/undodir > /dev/null 2>&1')
vim.o.undodir = '~/.config/nvim/undodir'
vim.bo.undofile = true
-- }}}

-- FZF/Telescope {{{
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--hidden",
      "--smart-case",
      "--trim"
    }
  },
  pickers = {
    find_files = {
      prompt_prefix = '🔍 ',
      find_command = { 'rg', '--ignore', '--hidden', '--files' }
    }
  }
}

vim.api.nvim_set_keymap("n", "<Leader>ff", "<CMD>lua require('telescope.builtin').find_files()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>fg", "<CMD>lua require('telescope.builtin').live_grep()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>fb", "<CMD>lua require('telescope.builtin').buggers()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>fh", "<CMD>lua require('telescope.builtin').help_tags()<CR>", {noremap = true, silent = true})
-- }}}

-- Ruby host {{{
if vim.fn.executable('~/.asdf/shims/ruby') then
  vim.g.ruby_host_prog = '~/.asdf/shims/ruby'
end
-- }}}

-- statusline {{{
vim.o.showmode = false
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = { {'filename', path = 1} },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
-- }}}

-- Vim test https://github.com/vim-test/vim-test {{{
vim.g['test#custom_transformations'] = {
  custom = function(cmd)
    if vim.fn.filereadable('bin/runner') then
      return 'bin/runner ' .. cmd
    end

    return cmd
  end
}
vim.g['test#transformation'] = 'custom'

-- A custom Neovim strategy for test.vim that reuses the terminal buffer for
-- running tests and automatically close buffer on success.
-- https://github.com/kevinsjoberg/vim-test-neovim-error-only
vim.g['test#strategy'] = 'neovim_error_only'
-- }}}

-- Projectionist {{{
vim.cmd([[
autocmd User ProjectionistDetect
\ call projectionist#append(getcwd(),
\ {
\    'app/jobs/*_job.rb': {
\      'alternate': [
\        'spec/jobs/{}_spec.rb',
\        'test/jobs/{}_test.rb',
\      ],
\      'template': [
\        '# frozen_string_literal: true',
\        '',
\        'class {basename|capitalize|camelcase}Job < ApplicationJob',
\        '  queue_as :default',
\        '',
\        '  def perform(attributes = \{\})',
\        '  end',
\        'end'
\      ]
\    },
\    'app/*.rb': {
\      'alternate': [
\        'spec/{}_spec.rb',
\        'test/{}_test.rb',
\      ],
\      'template': [
\        '# frozen_string_literal: true',
\        '',
\        'class {basename|capitalize|camelcase}',
\        'end'
\      ]
\    },
\    'lib/*.rb': {
\      'alternate': [
\        'spec/{}_spec.rb',
\        'test/{}_test.rb',
\      ],
\      'template': [
\        '# frozen_string_literal: true',
\        '',
\        'class {basename|capitalize|camelcase}',
\        'end'
\      ]
\    },
\    'spec/*_spec.rb': {
\      'alternate': [
\        'app/{}.rb',
\        'lib/{}.rb'
\      ],
\      'template': [
\        "# frozen_string_literal: true",
\        "",
\        "require 'rails_helper'",
\        "",
\        "RSpec.describe {basename|capitalize|camelcase} do",
\        "end"
\      ]
\    },
\    'test/*_test.rb': {
\      'alternate': 'app/{}.rb',
\      'template': [
\        "# frozen_string_literal: true",
\        "",
\        "require 'test_helper'",
\        "",
\        "describe {basename|capitalize|camelcase} do",
\        "end"
\      ]
\    },
\    'spec/factories/*.rb': {
\      'alternate': 'spec/{}_spec.rb',
\      'template': [
\        '# frozen_string_literal: true',
\        '',
\        'FactoryBot.define do',
\        '  factory :{basename|singular} do ',
\        '  end',
\        'end'
\      ]
\    },
\    'test/factories/*.rb': {
\      'alternate': 'test/{}_test.rb',
\      'template': [
\        '# frozen_string_literal: true',
\        '',
\        'FactoryBot.define do',
\        '  factory :{basename|singular} do ',
\        '  end',
\        'end'
\      ]
\    }
\ })
]])
-- }}}

-- Autocreate directory on save {{{
vim.cmd([[
autocmd BufWritePre,FileWritePre * silent! call mkdir(expand('<afile>:p:h'), 'p')
]])
-- }}}

-- Quickfix List {{{

-- When using `dd` in the quickfix list, remove the item from the quickfix list.
vim.cmd([[
function! RemoveQFItem()
  let curqfidx = line('.') - 1
  let qfall = getqflist()
  call remove(qfall, curqfidx)
  call setqflist(qfall, 'r')
  execute curqfidx + 1 . "cfirst"
  :copen
endfunction
:command! RemoveQFItem :call RemoveQFItem()
" Use map <buffer> to only map dd in the quickfix window. Requires +localmap
autocmd FileType qf map <buffer> dd :RemoveQFItem<cr>
]])
-- }}}

-- Key bindings {{{

vim.cmd([[
" space w to save file
nnoremap <Leader>w :w!<CR>

" Resource and edit .vimrc file a bit quicker
nnoremap <Leader>vs :source $HOME/.config/nvim/init.lua<CR>
nnoremap <Leader>ve :e $HOME/.config/nvim/init.lua<CR>

" Key mappings for Dash
nmap <silent> <leader>d <Plug>DashSearch

" Dirvish
function! OpenDirvish()
  try
    :Dirvish %
  catch
    :Dirvish
  endtry
endfunction
nmap <silent> - :call OpenDirvish()<CR>

" Open previous file
map <leader><leader> :e#<CR>

" For Plug janko-m/vim-test
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

" Exit to normal mode from TERM mode
tnoremap <Esc> <C-\><C-n>

" Search pwd with the silver searcher
nnoremap <leader>a :Ack!<Space>
" Search for word under the cursor
" nnoremap K :Ack! "\b<C-R><C-W>\b"<CR>
nnoremap <Leader>k :Ack! "<C-R><C-W>"<CR>

" Identify the syntax highlighting group used at the cursor
map <leader>h :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Git messages
nmap <Leader>gm <Plug>(git-messenger)
]])
-- }}}
