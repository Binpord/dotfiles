"
" vim-plug
"
set nocompatible
filetype plugin on
syntax on
set encoding=utf8

" specify nvim python so that I can use vim whilst in venv
let g:python3_host_prog='/usr/local/bin/python3'

" Download vim-plug if missing
if empty(glob('~/.vim/autoload/plug.vim'))
  silent! execute '!curl --create-dirs -fsSLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * silent! PlugInstall
endif

call plug#begin('~/.vim/plugged')

" YouCompleteMe
Plug 'Valloric/YouCompleteMe', { 'do': g:python3_host_prog . ' install.py --clang-completer' }

" UltiSnips
Plug 'SirVer/ultisnips'

" SuperTab for YouCompleteMe-Ultisnips compatibility
Plug 'ervandew/supertab'

" vimtex
Plug 'lervag/vimtex'

" delimitMate
Plug 'Raimondi/delimitMate'

" PEP8 indent
Plug 'Vimjas/vim-python-pep8-indent'

" Auto tags support
Plug 'ludovicchabant/vim-gutentags'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Fzf (also provides Ag command)
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' } | Plug 'junegunn/fzf.vim'

" NERDTree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Vim-Tmux integration
Plug 'christoomey/vim-tmux-navigator'

" The NERD Commenter
Plug 'scrooloose/nerdcommenter'

" Gruvbox
Plug 'morhetz/gruvbox'

" vim-endwise
Plug 'tpope/vim-endwise'

call plug#end()

"
" Settings
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

" Use system clipboard
set clipboard=unnamedplus

" Russian keymap
if has('mac')
  set keymap=russian-jcukenmac
else
  set keymap=russian-jcukenwin
endif
set iminsert=0
set imsearch=0

" Colorscheme
set background=dark
let g:gruvbox_italic=0
colorscheme gruvbox

" Update time
set updatetime=300

" Always show sign column
set signcolumn=yes

" Disable 'Pattern not found' messages
set shortmess+=c

" Render tabs and spaces
set listchars=space:•,tab:-->
set list

"
" Plugin Settings
"

" YouCompleteMe
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_add_preview_to_completeopt=0
set completeopt-=preview
nnoremap <silent> gt :YcmCompleter GoToDefinition<CR>

" YouCompleteMe-UltiSnips compatibility using SuperTab
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" UltiSnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories=['~/.vim/UltiSnips']

" vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='skim'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" delimitMate
let g:delimitMate_expand_cr=1
let g:delimitMate_expand_space=1
let g:delimitMate_balance_matchpairs=1

" PEP8 indent
let g:pymode_indent=0

" the_silver_searcher
nnoremap <silent> <c-f> :Ag<CR>

" fzf
nnoremap <silent> <c-p> :Files<CR>

" NERDTree
nnoremap <silent> <c-b> :NERDTreeToggle<CR>

" Airline
let g:airline_powerline_fonts=1
let g:airline_theme='gruvbox'

" The NERD Commenter
let g:NERDSpaceDelims=1
let g:NERDTrimTrailingWhitespace=1
let g:NERDDefaultAlign='left'

" noh
nnoremap <silent> <leader>' :noh<CR>

" Jump visual lines, not physical
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j
nnoremap 0 g0
nnoremap $ g$

" Disable arrow movement, resize splits instead.
nnoremap <silent> <M-Up> :resize +2<CR>
nnoremap <silent> <M-Down> :resize -2<CR>
nnoremap <silent> <M-Left> :vertical resize +2<CR>
nnoremap <silent> <M-Right> :vertical resize -2<CR>

" Remove trailing whitespace
nnoremap <silent> <Leader>w :let _save_pos=getpos('.') <Bar>
    \ :let _s=@/ <Bar>
    \ :%s/\s\+$//e <Bar>
    \ :let @/=_s <Bar>
    \ :nohl <Bar>
    \ :unlet _s<Bar>
    \ :call setpos('.', _save_pos)<Bar>
    \ :unlet _save_pos<CR><CR>

"
" Commands
"

" Saving files with root priveledges without opening vim as root.
command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!
