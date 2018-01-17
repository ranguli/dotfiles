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

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_mode_map = { 
    \ "mode": 'active', 
    \ 'passive_filetypes': ['python', 'javascript']}

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

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

call plug#begin()

Plug  'raimondi/delimitmate'
Plug  'chriskempson/base16-vim'
Plug  'tpope/vim-fugitive'
Plug  'tpope/vim-surround'
Plug  'lsdr/monokai'
Plug  'Valloric/YouCompleteMe'
Plug  'scrooloose/syntastic'

"NerdTree for file trees
Plug  'scrooloose/nerdtree' 

"Airline with themes
Plug  'vim-airline/vim-airline'
Plug  'vim-airline/vim-airline-themes'

call plug#end()            
