set laststatus=2
set t_Co=256
set paste

" Vundle start "
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle plugins go here "
Plugin 'glench/vim-jinja2-syntax'

" Bundles
Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

call vundle#end()            " required
filetype plugin indent on    " required
" Vundle end "
