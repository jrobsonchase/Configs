au BufNewFile,BufRead *.tex set ft=tex
au FileType tex setl spell spelllang=en
au FileType tex setl tw=72

syntax off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
syntax on
filetype plugin indent on
set enc=utf-8 tenc=utf-8

set autoindent
set smartindent
set modeline
set tabstop=4
set shiftwidth=4
set number

colo slate

set hlsearch
hi Search ctermbg=DarkBlue ctermfg=White

au BufWinLeave * mkview
au BufWinEnter * silent loadview

command W w ! sudo tee %
