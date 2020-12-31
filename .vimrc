"
" vim-plug
"
set nocompatible
filetype plugin on
syntax on
set encoding=utf8

call plug#begin('~/.vim/plugged')

"
" Utility
"

" Tab completion
Plug 'ervandew/supertab'

" Snippet engine
Plug 'SirVer/ultisnips'

" Auto insert enclosing brackets
Plug 'Raimondi/delimitMate'

" Auto insert fi/done in bash scripts
Plug 'tpope/vim-endwise'

"
" Tools integration
"

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Tmux
Plug 'christoomey/vim-tmux-navigator'

" FZF and the_sealver_searcher
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

"
" Languages support
"

" LaTeX
Plug 'lervag/vimtex'

" Python
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'vim-python/python-syntax'

"
" Looks
"

" Dracula colorscheme
Plug 'dracula/vim', { 'as': 'dracula' }

" Airline status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

"
" Plugin Settings
"

" UltiSnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories=['~/.vim/UltiSnips']

" delimitMate
let g:delimitMate_expand_cr=1
let g:delimitMate_expand_space=1
let g:delimitMate_balance_matchpairs=1

" vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='skim'
let g:vimtex_quickfix_mode=0
let g:vimtex_imaps_enabled=0

" Python syntax
let g:python_highlight_all=1

" Airline
let g:airline_powerline_fonts=0
let g:airline_theme='dracula'

" Dracula colorscheme
set termguicolors
colorscheme dracula

"
" Mappings
"

" noh
nnoremap <silent> <esc><esc> :nohlsearch<CR>

" the_silver_searcher
nnoremap <silent> <c-f> :Ag<CR>

" fzf
nnoremap <silent> <c-p> :Files<CR>

" Jump visual lines, not physical
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j
nnoremap 0 g0
nnoremap $ g$

" Resize splits with Meta-Arrow
nnoremap <silent> <M-Up> :resize +2<CR>
nnoremap <silent> <M-Down> :resize -2<CR>
nnoremap <silent> <M-Left> :vertical resize +2<CR>
nnoremap <silent> <M-Right> :vertical resize -2<CR>

"
" Commands
"

" Saving files with root priveledges without opening vim as root.
command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!

"
" General Settings
"

" Lines
set number
set ruler

" Text wrap
set wrap
set linebreak
set breakindent
set breakindentopt=shift:2,min:40,sbr
set showbreak=⤥

" Tabulation
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab

" Search
set incsearch
set hlsearch
set ignorecase
set smartcase

" Status line
set showcmd
set ch=1
set wildmenu
set wcm=<TAB>

" Mouse
set mousehide
set mouse=a

" Buffers
set hidden
set autoread

" Make backspace work like in most other apps
set backspace=2

" Paste toggle
set pastetoggle=<F2>

" Russian keymap
if has('mac')
  set keymap=russian-jcukenmac
else
  set keymap=russian-jcukenwin
endif
set iminsert=0
set imsearch=0

" Update time
set updatetime=300

" Always show sign column
set signcolumn=yes

" Disable 'Pattern not found' messages
set shortmess+=c

" Render tabs and spaces
set listchars=space:•,tab:-->
set list
