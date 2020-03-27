set nocompatible              " required
filetype off                  " required
:let mapleader = ","

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'


" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-eunuch'
Plugin 'mattn/emmet-vim'
Plugin 'w0rp/ale'
Plugin 'tpope/vim-surround'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'majutsushi/tagbar'
Plugin 'jiangmiao/auto-pairs'
Plugin 'rust-lang/rust.vim'
Plugin 'airblade/vim-gitgutter'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Enable folding
set foldmethod=indent
set foldlevel=99

nnoremap <space> za

let g:SimpylFold_docstring_preview=1

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>



let python_highlight_all=1
syntax on

set nu
set clipboard=unnamedplus
set go+=a



autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

set cursorline
set showmatch
set updatetime=100


let g:multi_cursor_prev_key            = '<C-w>'

let g:user_emmet_leader_key='<C-C>'

map <C-b> :NERDTreeToggle<CR>


let g:Powerline_symbols = "fancy"
set t_Co=256

nmap <F8> :TagbarToggle<CR>

set mouse=a
set tabstop=2 shiftwidth=2 expandtab


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%{FugitiveStatusline()}

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ['prospector']
let g:syntastic_rust_checkers = ['cargo']

let g:ycm_rust_src_path = '/home/sandro/.local/lib/rust/src'

let g:rustfmt_autosave = 1


