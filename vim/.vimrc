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
set tw=79
set tabstop=4                   
set shiftwidth=4                " A tab is just simply 4 spaces.
set expandtab
set number
set clipboard=unnamedplus       " Use system clipboard 
set tags=tags;/                 " Allow vim to find ctags even in subdirs"


" Airline configuration 
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
let g:airline_solarized_dark_inactive_border = 1
let g:airline_solarized_bg='dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline_detect_paste=1

" Make swap files go away 
set nobackup
set nowritebackup
set noswapfile

" Misc. definitions 
let g:tex_conceal = ""
let base16colorspace=256
let livepreview_previewer = 'zathura' 
let g:livepreview_previewer = 'zathura'


" Use space instead of Shift-Colon!
noremap <Space> :

"Improve the way we move between panes
noremap <C-l> <C-w>l 
noremap <C-h> <C-w>h 
noremap <C-j> <C-w>j 
noremap <C-k> <C-w>k

" Better code indentation in visual mode
vnoremap < <gv 
vnoremap > >gv 

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'raimondi/delimitmate'
Plugin 'chriskempson/base16-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'

"NerdTree for file trees
Plugin 'scrooloose/nerdtree' 

"Airline with themes
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'


call vundle#end()            
