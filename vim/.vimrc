filetype plugin indent on

set nocompatible
syntax enable

set t_md=
set tw=79
set tabstop=4
set shiftwidth=4                " A tab is just simply 4 spaces.
set expandtab
set number
set clipboard=unnamedplus       " Use system clipboard
set tags=tags;/                 " Allow vim to find ctags even in subdirs"

:set guioptions-=T

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

" Delete whitespace on :w
autocmd BufWritePre * %s/\s\+$//e

" Install vim-plug automatically
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Mapping to use Tagbar
nmap <F8> :TagbarToggle<CR>
nmap <F7> :UpdateTags<CR>
nmap <F5> :NERDTreeToggle<CR>


call plug#begin()

" IDE-like functions, file tree, tagbar, git, syntax checking
Plug 'scrooloose/nerdtree'                              " File tree
Plug 'majutsushi/tagbar'                                " Tags
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }     " Fuzzy search
Plug 'scrooloose/syntastic'                             " Syntax checking
"Plug 'tpope/vim-fugitive'                              " Git integration
"Plug 'ycm-core/YouCompleteMe'                          " Auto completion
"Plug 'tpope/vim-surround'


" Language/syntax hightlighting support
"Plug 'sunkarapk/vim-dasm'                              " DASM assembler syntax
"Plug 'udalov/kotlin-vim'                               " Kotlin support
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }     " Go support

" Quality of life
Plug 'yuttie/comfortable-motion.vim'                    " Smooth ctrl-D/U
Plug 'airblade/vim-gitgutter'                           " Git diff in sidebar
Plug 'junegunn/goyo.vim'                                " Reading mode
"Plug 'scrooloose/nerdcommenter'

" Colors and theming
Plug 'chriskempson/base16-vim'

call plug#end()

if has('gui_running')
    autocmd VimEnter * TagbarToggle
    autocmd VimEnter * NERDTreeCWD
    colorscheme base16-material
    set lines=50 columns=150
endif

