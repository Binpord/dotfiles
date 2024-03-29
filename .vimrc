" specify nvim python so that I can use vim whilst in venv
let g:python3_host_prog='/Users/binpord/miniconda3/envs/pynvim/bin/python'  

"
" vim-plug
"
set nocompatible
filetype plugin on
syntax on
set encoding=utf8

call plug#begin('~/.vim/plugged')

" Tab completion
Plug 'ervandew/supertab'

" Auto insert enclosing brackets
Plug 'Raimondi/delimitMate'

" Auto insert fi/done in bash scripts
Plug 'tpope/vim-endwise'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Gruvbox
" Plug 'morhetz/gruvbox'

" Airline
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" Git
" Plug 'tpope/vim-fugitive'

" Tmux
Plug 'christoomey/vim-tmux-navigator'

" Python
Plug 'Vimjas/vim-python-pep8-indent'

call plug#end()

"
" Plugin Settings
"

" delimitMate
let g:delimitMate_expand_cr=1
let g:delimitMate_expand_space=1
let g:delimitMate_balance_matchpairs=1

" Airline
" let g:airline_theme='gruvbox'
" let g:airline_powerline_fonts=1

" colnr symbol is missing in Menlo
" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
" endif
" let g:airline_symbols.colnr = "\u33c7"

"
" Mappings
"

" noh
nnoremap <silent> <esc><esc> :nohlsearch<CR>

" Jump visual lines, not physical
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j
nnoremap 0 g0
nnoremap $ g$

vnoremap k gk
vnoremap j gj
vnoremap gk k
vnoremap gj j
vnoremap 0 g0
vnoremap $ g$

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

" Colorscheme
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" set termguicolors
" set background=light
" colorscheme gruvbox

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
set cmdheight=1
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

" Disable 'Pattern not found' messages
set shortmess+=c
