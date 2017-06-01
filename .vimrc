"Sets
set t_Co=256
set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin indent on     " this dictates how tabs and spaces work.
set tabstop=4                 " it's setup so that tabs don't exist,
set shiftwidth=4              " a tab is just simply 4 spaces.
set expandtab
set number
set guioptions -=T            " Settings to hide the toolbar,
set guioptions -=m            " menubar, left and right scrollbar
set guioptions -=r            " in GUI vim.
set guioptions -=L 
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
set clipboard=unnamedplus     " use the systems clipboard, so we can copy in
                              " and out of vim easily
                              
"Remappings
nnoremap <Space> : 


"Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tomasr/molokai'
Plugin 'raimondi/delimitmate'
Plugin 'chriskempson/base16-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mileszs/ack.vim'
Plugin 'nathanaelkane/vim-indent-guides'

call vundle#end()            " required


" Startup / Runtime
let g:airline_powerline_fonts = 1
colorscheme base16-monokai 

if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window (for an alternative on Windows, see simalt below).
  set lines=999 columns=999
else
  " This is console Vim.
  if exists("+lines")
    set lines=50
  endif
  if exists("+columns")
    set columns=100
  endif
endif

autocmd vimenter * NERDTree
