"
"   ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"   ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"   ██║   ██║██║██╔████╔██║██████╔╝██║     
"   ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
"    ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"     ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"
"    Author: ranguli
"    GitHub: www.github.com/ranguli/dotfiles
"    2017


filetype plugin indent on       
filetype plugin on
syntax on

set rtp+=$HOME/.vim/bundle/Vundle.vim
set nocompatible                
set t_Co=256
set tabstop=4                   " Setup so that tabs don't exist,
set shiftwidth=4                " a tab is just simply 4 spaces.
set expandtab
set number
set clipboard=unnamedplus       " Use system clipboard 
set tags=tags;/                 " Allow vim to find ctags even in subdirs"

let base16colorspace=256
let livepreview_previewer = 'zathura' 
let g:livepreview_previewer = 'zathura'

" ----- vim-airline/vim-airline ----- 
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
let g:airline_solarized_dark_inactive_border = 1
let g:airline_solarized_bg='dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline_detect_paste=1

noremap <Space> :
noremap <S-l> gt   
noremap <S-h> gT  
noremap <C-l> <C-w>l 
noremap <C-h> <C-w>h 
noremap <C-j> <C-w>j 
noremap <C-k> <C-w>k
nnoremap <leader>s :w<cr>
inoremap <leader>s <C-c>:w<cr>
nnoremap ss i<space><esc>

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tomasr/molokai'
Plugin 'raimondi/delimitmate'
Plugin 'chriskempson/base16-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mileszs/ack.vim'
Plugin 'lervag/vimtex'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'nlknguyen/papercolor-theme'
Plugin 'dracula/vim'
Plugin 'Yggdroot/indentLine'
Plugin 'junegunn/goyo.vim'
Plugin 'tpope/vim-fugitive'


call vundle#end()            
