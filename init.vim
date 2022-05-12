language en_US.UTF-8
syntax on
filetype plugin indent on
set noswapfile
set ruler
set nowritebackup
set nu
set re=2
set maxmempattern=2000
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
" 24-bit color support
set termguicolors

set grepprg=rg\ --vimgrep\ --hidden

call plug#begin('~/.vim/plugged')
" Plugin options
Plug 'mhinz/vim-startify'
Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-vinegar'
Plug 'jremmen/vim-ripgrep'
" Work habits
Plug 'wakatime/vim-wakatime'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-ragtag'
" Git-related plugins
Plug 'tpope/vim-fugitive'
Plug 'tommcdo/vim-fugitive-blame-ext'
Plug 'rhysd/git-messenger.vim'

" Directory Viewer for Vim
Plug 'justinmk/vim-dirvish'
Plug 'kristijanhusak/vim-dirvish-git'

Plug 'rizzatti/dash.vim'

Plug 'dense-analysis/ale'

Plug 'tpope/vim-projectionist'

Plug 'janko-m/vim-test'
Plug 'kevinsjoberg/vim-test-neovim-error-only'

Plug 'justinmk/vim-sneak'

Plug 'tmsvg/pear-tree'
" Automatically adds ends wisely
Plug 'tpope/vim-endwise'

" Dark powered asynchronous completion framework for neovim
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'etordera/deoplete-rails'
" Plug 'fishbullet/deoplete-ruby'
"
" More Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}

" Show vertical lines
Plug 'lukas-reineke/indent-blankline.nvim'
" Icons
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'drewtempelmeyer/palenight.vim'
" Minimap
Plug 'wfxr/minimap.vim'

" Lua plugins
Plug 'nvim-lua/plenary.nvim' " helper for lua plugins
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-tree.lua'

"" Git
Plug 'lewis6991/gitsigns.nvim'
Plug 'ruifm/gitlinker.nvim'

" Add plugins to &runtimepath
call plug#end()
" https://github.com/joshdick/onedark.vim#neovim
" let g:onedark_termcolors = 16
" set background=dark
" COLORSCHEME ---------------------------------------------------
let g:palenight_color_overrides = overrides#GetColors()
colorscheme palenight
" Highlight no breaking space characters
" highlight NoBreakingSpace guibg=red ctermbg=red guifg=white ctermfg=white
" syntax match NoBreakingSpace /.* .*/

" highlight NoBreakingSpace guibg=red guifg=white ctermbg=red ctermfg=white
" syntax match NoBreakingSpace / /

set listchars=nbsp:⏚
set list
syntax match NoBreakingSpace /.* .*/
highlight NoBreakingSpace guibg=red guifg=white ctermbg=red ctermfg=white

" Start autocomplete for deoplete.vim
" let g:deoplete#enable_at_startup = 1

" Fix slow ruby with polyglot
let g:ruby_path = system('echo $HOME/.rbenv/shims')
" Ale fix rubocop on save

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'ruby': ['rubocop'],
\   'markdown': ['mdl'],
\   'vue': ['prettier'],
\   'js': ['eslint', 'prettier']
\}
let g:ale_fix_on_save = 0
let g:ale_ruby_rubocop_executable = 'bundle'


" colorscheme MaterialPalenightTheme
let g:neomake_jsx_enabled_makers = ['eslint']
let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'
let g:neomake_javascript_eslint_maker = {
\ 'args': ['--no-color', '--format', 'compact'],
\ 'errorformat': '%f: line %l\, col %c\, %m'
\ }
let g:neomake_javascript_eslint_maker = { 'args': ['--no-color', '--format', 'compact'], 'errorformat': '%f: line %l\, col %c\, %m' }
let g:neomake_verbose = 0
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_fmt_command = "goimports"
" autocmd! BufWritePost * Neomake
" autocmd! BufReadPost * Neomake

let mapleader = " "

" Lua plugins
luafile ~/.config/nvim/plug-config/nvim-tree.lua
luafile ~/.config/nvim/plug-config/lualine.lua
luafile ~/.config/nvim/plug-config/indent-blankline.lua
" telescope configuration
luafile ~/.config/nvim/plug-config/telescope.lua
nnoremap <silent> <leader>ff <cmd>Telescope find_files<CR>
nnoremap <silent> <leader>fg <cmd>Telescope live_grep<CR>
" end of Lua plugins
"
" nnoremap - :NvimTreeFindFile%:h<CR>

" Set editor ruler
set colorcolumn=80" highlight ColorColumn ctermbg=0 guibg='#4E557980'

" Make sure PearTree works with endwise
imap <CR> <Plug>(PearTreeExpand)<Plug>DiscretionaryEnd
map <leader>n :NvimTreeToggle<CR>
"" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <Leader>r :ALEFix<CR>
" Fix <C-h>
nmap <BS> <C-w>h
" Switch between the last two files
nnoremap <leader><leader> <c-^>
" Search and Replace
nmap <Leader>s :%s//g<Left><Left>
" Find all occurences
nnoremap <leader>g :Rg<cr>
" Catch :W save typo and turn it into :w so the save works anyway
command! W  write
" Catch :Q quit typo and turn it into :q so the quit works anyway
command! Q  quit
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
autocmd FileType go,elm set list listchars=tab:\ \ ,trail:¬∑,nbsp:¬∑

" Run testsuite in nvim with nanobox and docker-compose
function! EnvironmentTransform(cmd) abort
  if filereadable("docker-compose.yml")
    return 'docker-compose run --rm web '.a:cmd
  else
    return a:cmd
  endif
endfunction
let g:test#custom_transformations = {'environment': function('EnvironmentTransform')}
let g:test#transformation = 'environment'
" A custom Neovim strategy for test.vim that reuses the terminal buffer for
" running tests and automatically close buffer on success.
" https://github.com/kevinsjoberg/vim-test-neovim-error-only
if has('nvim')
  let g:test#strategy = 'neovim_error_only'
endif

" Projectionist provides granular project configuration using 'projections'.
" A Vim wrapper for running tests on different granularities.
" https://github.com/janko-m/vim-test
" A custom Neovim strategy for test.vim that reuses the terminal buffer for
" running tests and automatically close buffer on success.
" https://github.com/kevinsjoberg/vim-test-neovim-error-only

" Projectionist setup
" ===================================================
autocmd User ProjectionistDetect
\ call projectionist#append(getcwd(),
\ {
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

" Trailing whitespace
" ===================================================
" Hightlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red ctermfg=white guifg=white
match ExtraWhitespace /\s\+$/
" Removes trailing spaces
function! TrimWhiteSpace()
  mark `
  %s/\s\+$//e
  normal ``
endfunction
autocmd BufWritePre * call TrimWhiteSpace()

" Identify the syntax highlighting group used at the cursor
map <leader>h :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" space w to save file
nnoremap <Leader>w :w!<CR>

" minimap config
let g:minimap_git_colors = 1
let g:minimap_highlight_search = 1
let g:minimap_highlight_range = 0
let g:minimap_block_filetypes = ['fugitive', 'nerdtree', 'tagbar', 'fzf', 'git-messenger', 'gitmessenger']
let g:minimap_block_buftypes = ['nofile', 'nowrite', 'quickfix', 'terminal', 'prompt', 'floats', 'win']
map <leader>m :MinimapToggle<CR>
