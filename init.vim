language en_US
syntax on
filetype plugin indent on
set noswapfile
set ruler
set nowritebackup
set nu
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
" 24-bit color support
set termguicolors
call plug#begin('~/.vim/plugged')
" The Silver Searcher (AG) for grepping
set grepprg=ag\ --vimgrep
" Plugin options
Plug 'rking/ag.vim'
Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim'
" Plug 'tpope/vim-vinegar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
" Git-related plugins
Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'
"
Plug 'christoomey/vim-tmux-navigator'
Plug 'rizzatti/dash.vim'
Plug 'dense-analysis/ale'
" Plug 'drewtempelmeyer/palenight.vim'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-projectionist'
Plug 'janko-m/vim-test'
Plug 'kevinsjoberg/vim-test-neovim-error-only'
" search faster with 'the_silver_searcher'
Plug 'mileszs/ack.vim'

" Automatically adds ends wisely
Plug 'tpope/vim-endwise'

" Directory Viewer for Vim
Plug 'justinmk/vim-dirvish'
Plug 'kristijanhusak/vim-dirvish-git'

" Elegant tatusline
" Plug 'liuchengxu/eleline.vim'

" Dark powered asynchronous completion framework for neovim
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'etordera/deoplete-rails'
" Plug 'fishbullet/deoplete-ruby'
"
" More Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}

" Show vertical lines
Plug 'Yggdroot/indentLine'
" Add plugins to &runtimepath
call plug#end()
" https://github.com/joshdick/onedark.vim#neovim
" let g:onedark_termcolors = 16
set background=dark
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

" Ale fix rubocop on save

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'ruby': ['rubocop'],
\}
let g:ale_fix_on_save = 1

" Signify config
let g:signify_sign_change = '~'
"
" Dirvish sort folders first
let g:dirvish_mode = ':sort ,^.*[\/],'
"
" Statusline
"
set laststatus=2
set statusline=\ %f%m%r%h%w\ %=(%Y)\ %(%{FugitiveStatusline()}[%l,%v][%p%%][%L]\ %)
"------------------------------------------------------------------------------

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
" Enable fzf fuzzy finder with <space>f binding"
let mapleader = " "
map <Leader>f :FZF<CR>
"
"
"
" eleline config to use powerline font
let g:eleline_powerline_fonts = 1
"
"
"
" Set editor ruler
set colorcolumn=80" highlight ColorColumn ctermbg=0 guibg='#4E557980'
"" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
" nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" Fix <C-h>
nmap <BS> <C-w>h
" Switch between the last two files
nnoremap <leader><leader> <c-^>
" Search and Replace
nmap <Leader>s :%s//g<Left><Left>
" Find all occurences
nnoremap <leader>g :exe 'Ag' expand('<cword>')<cr>
" Catch :W save typo and turn it into :w so the save works anyway
command! W  write
" Catch :Q quit typo and turn it into :q so the quit works anyway
command! Q  quit
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
autocmd FileType go,elm set list listchars=tab:\ \ ,trail:¬∑,nbsp:¬∑
" Projectionist provides granular project configuration using "projections".
" A Vim wrapper for running tests on different granularities.
" https://github.com/janko-m/vim-test
" A custom Neovim strategy for test.vim that reuses the terminal buffer for
" running tests and automatically close buffer on success.
" https://github.com/kevinsjoberg/vim-test-neovim-error-only

" Use 'the_silver_searcher' instead of Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Run testsuite in nvim with nanobox
function! NanoboxTransform(cmd) abort
  if filereadable("boxfile.yml")
    return 'nanobox run '.a:cmd
  else
    return a:cmd
  endif
endfunction
let g:test#custom_transformations = {'nanobox': function('NanoboxTransform')}
let g:test#transformation = 'nanobox'
" A custom Neovim strategy for test.vim that reuses the terminal buffer for
" running tests and automatically close buffer on success.
" https://github.com/kevinsjoberg/vim-test-neovim-error-only
if has('nvim')
  let g:test#strategy = 'neovim_error_only'
endif
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
