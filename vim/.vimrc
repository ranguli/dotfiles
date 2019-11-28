"set syntax
"set t_Co=256
filetype plugin indent on       

set nocompatible                
filetype plugin indent on
syntax enable

set t_md=
set tw=79
set tabstop=4                   
set shiftwidth=4                " A tab is just simply 4 spaces.
set expandtab
set number
set clipboard=unnamedplus       " Use system clipboard 
set tags=tags;/                 " Allow vim to find ctags even in subdirs" 

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

" Make swap files go away 
set nobackup
set nowritebackup
set noswapfile

" Use space instead of Shift-Colon
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


" Goyo
"nmap <F1> :Goyo<CR>
" Automatically run Goyo for markdown files
"au BufReadPost,BufNewFile *.md, :Goyo

" Install vim-plug automatically
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin()

"Plug 'raimondi/delimitmate'
"Plug 'tpope/vim-fugitive'
"Plug 'tpope/vim-surround'
"Plug 'junegunn/goyo.vim'
"Plug 'scrooloose/nerdcommenter'
"Plug 'scrooloose/syntastic'   " Syntax checking
Plug 'ycm-core/YouCompleteMe' " Auto completion
Plug 'scrooloose/nerdtree'    " File tree
Plug 'tpope/vim-surround'     
Plug 'majutsushi/tagbar'
Plug 'yuttie/comfortable-motion.vim'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'chriskempson/base16-vim'

call plug#end()

colorscheme base16-darktooth
