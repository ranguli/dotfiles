"
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

set t_Co=256
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

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

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

" Mapping to use Tagbar
nmap <F8> :TagbarToggle<CR>
nmap <F7> :UpdateTags<CR>
nmap <F5> :NERDTreeToggle<CR>

" Focus mode with Goyo
nmap <F1> :Goyo<CR>


"Ensure that vim-plug is installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug  'raimondi/delimitmate'
Plug  'chriskempson/base16-vim'
Plug  'tpope/vim-fugitive'
Plug  'tpope/vim-surround'
Plug  'lsdr/monokai'
Plug  'Valloric/YouCompleteMe' " Code completion
Plug  'scrooloose/syntastic'   " Syntax checking
Plug  'scrooloose/nerdtree'    " File tree
Plug  'tpope/vim-surround'     
Plug  'majutsushi/tagbar'
Plug  'vim-airline/vim-airline'
Plug  'vim-airline/vim-airline-themes'
Plug  'xolox/vim-easytags'
Plug  'xolox/vim-misc'
Plug 'scrooloose/nerdcommenter'
Plug 'yuttie/comfortable-motion.vim'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/goyo.vim'
call plug#end()            
