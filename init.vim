language en_US.UTF-8
syntax on
filetype plugin indent on
set noswapfile
set ruler
set nowritebackup
set nu
set re=1
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
" 24-bit color support
set termguicolors

set grepprg=rg\ --vimgrep

call plug#begin('~/.vim/plugged')
" Plugin options
Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-vinegar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
" Work habits
Plug 'wakatime/vim-wakatime'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-ragtag'
" Git-related plugins
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tommcdo/vim-fugitive-blame-ext'
Plug 'rhysd/git-messenger.vim'
Plug 'mhinz/vim-signify'

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
Plug 'Yggdroot/indentLine'
" Icons
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'kyazdani42/nvim-tree.lua'

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
"
" IndentLine config
let g:indentLine_char = '│'
"
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

" Git related stuff -------------------------------------
" Signify config
let g:signify_sign_change = '~'
" Statusline
set laststatus=2
set statusline=%!CreateStatusline()

" Colors for ALE in statusline
hi WarningColor guibg=#E5C07B guifg=#1E1E1E ctermbg=Yellow ctermfg=Black
hi ErrorColor guibg=#DF6A63 guifg=#1E1E1E ctermbg=Red ctermfg=Black

function! CreateStatusline()
  let statusline=''
  let statusline.='%#diffadd#'
  let statusline.=' %{FugitiveHead()} '
  let statusline.='%#CursorlineNr#'
  let statusline.=' %f'                  " Show filename
  let statusline.=' %m'                  " Show modified tag
  let statusline.='%='                   " Switch elements to the right
  if get(g:, 'streamline_enable_devicons', 1) && exists('*WebDevIconsGetFileTypeSymbol')
      let statusline.=' %{WebDevIconsGetFileTypeSymbol()}'
  else
      let statusline.=' %y'              " Show filetype
  endif
  let statusline.=' ☰ %l:%c'             " Show line number and column
  let statusline.=' %p%% '               " Show percentage
  let statusline.='▏'
  let statusline.='%#WarningColor#'
  let statusline.='%{GetAleStatus()[0]}'
  let statusline.='%#ErrorColor#'
  let statusline.='%{GetAleStatus()[1]}'

  return statusline
endfunction

" Lags, use this if change to faster terminal
"function! GitBranch()
"    let l:branch = system('cd '.expand('%:p:h').' && git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d "\n"')
"    return !strlen(l:branch) || !isdirectory(expand('%:p:h')) ? '' : '▏' . l:branch . ' '
"endfunction

function GetAleStatus()
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:formated_errors = l:all_errors == 0 ? '' : '▏✗ ' . l:all_errors . ' '
    let l:all_warnings = l:counts.total - l:all_errors
    let l:formated_warnings = l:all_warnings == 0 ? '' : '▏⊖ ' . l:all_warnings . ' '
    return [l:formated_warnings, l:formated_errors]
endfunction
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
" FZF Config
" Remove fzf statusline
autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

let $FZF_DEFAULT_OPTS=' --color=dark --color=fg:#697098,bg:#282D40,hl:#B9EB80,fg+:#ffffff,bg+:0,hl+:#7AA9FF --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:#B9EB80'

" Use ripgrep for fzf
if executable('rg')
 let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
 set grepprg=rg\ --vimgrep
 command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

  " Overriding fzf.vim's default :Files command.
  " Pass zero or one args to Files command (which are then passed to Fzf_dev_icons). Support file path completion too.
  command! -nargs=? -complete=file Files call Fzf_dev_icons(<q-args>)

endif

" Display Files + devicons with fzf along with preview
function! Fzf_dev_icons(qargs)
  let l:fzf_files_options = '--preview "bat --theme="ansi" --style=numbers,changes --color always {2..-1} | head -'.&lines.'" --expect=ctrl-t,ctrl-v,ctrl-x --multi --bind=ctrl-a:select-all,ctrl-d:deselect-all'

  function! s:files(dir)
    let l:cmd = $FZF_DEFAULT_COMMAND
    if a:dir != ''
      let l:cmd .= ' ' . shellescape(a:dir)
    endif
    let l:files = split(system(l:cmd), '\n')
    return s:prepend_icon(l:files)
  endfunction

  function! s:prepend_icon(candidates)
    let l:result = []
    for l:candidate in a:candidates
      let l:filename = fnamemodify(l:candidate, ':p:t')
      let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
      call add(l:result, printf('%s %s', l:icon, l:candidate))
    endfor

    return l:result
  endfunction

  function! s:edit_file(lines)
    if len(a:lines) < 2 | return | endif

    let l:cmd = get({'ctrl-x': 'split',
                 \ 'ctrl-v': 'vertical split',
                 \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')

    for l:item in a:lines[1:]
      let l:pos = stridx(l:item, ' ')
      let l:file_path = l:item[pos+1:-1]
      execute 'silent '. l:cmd . ' ' . l:file_path
    endfor
  endfunction

  call fzf#run({
        \ 'source': <sid>files(a:qargs),
        \ 'sink*':   function('s:edit_file'),
        \ 'options': '-m ' . l:fzf_files_options,
        \ 'down':    '40%' })
endfunction

" Enable fzf fuzzy finder with <space>f binding
let mapleader = " "
nnoremap <silent> <leader>f :Files<CR>
" Lua plugins
luafile ~/.config/nvim/plug-config/nvim-tree.lua

" Set editor ruler
set colorcolumn=80" highlight ColorColumn ctermbg=0 guibg='#4E557980'

" Make sure PearTree works with endwise
imap <CR> <Plug>(PearTreeExpand)<Plug>DiscretionaryEnd
map <leader>n :NvimTreeToggle<CR>
"" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
" nnoremap <C-h> <C-w>h
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
  if filereadable("boxfile.yml")
    return a:cmd "'nanobox run '.a:cmd
  elseif filereadable("docker-compose.yml")
    if $DCSPEC
      return 'docker-compose run --rm web '.a:cmd
    else
      return a:cmd
    endif
    " return a:cmd "'nanobox run '.a:cmd
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
