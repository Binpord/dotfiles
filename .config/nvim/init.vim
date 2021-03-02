"
" NVim specific
"

" specify nvim python so that I can use vim whilst in venv
let g:python3_host_prog='/usr/local/bin/python3'

"
" Source Vim config
"

set runtimepath^=~/.vim
set runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.nvimrc
