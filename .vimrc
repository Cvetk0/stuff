set laststatus=2
set background=dark
set t_Co=256
set paste

" Disable beeps
set visualbell

" Spaces not tabs and auto indent 2 spaces
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent

" Search stuff
set incsearch
set hlsearch

" Have Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Vundle start "
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle plugins go here "
Plugin 'glench/vim-jinja2-syntax'
Plugin 'leafgarland/typescript-vim'

" Bundles
Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

call vundle#end()            " required
filetype plugin indent on    " required
" Vundle end "
