python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
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

call vundle#end()            " required
filetype plugin indent on    " required
" Vundle end "
