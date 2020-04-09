let g:python3_host_prog = '/usr/bin/python'
set mouse=a

set clipboard=unnamedplus
let mapleader=","

call plug#begin('~/.config/nvim/plugged/')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rust-lang/rust.vim'
Plug 'vim-scripts/indentpython.vim'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'neomake/neomake'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'tfnico/vim-gradle'
Plug 'tpope/vim-fugitive'
Plug 'kassio/neoterm'
Plug 'vimlab/split-term.vim'
Plug 'lervag/vimtex'
Plug 'sheerun/vim-polyglot'
Plug 'yuqio/vim-darkspace'

call plug#end()

filetype plugin indent on
set tabstop=2 shiftwidth=2 expandtab

" Darkspace
let g:airline_theme='darkspace'

set background=dark
colorscheme darkspace
set termguicolors

set foldmethod=indent
set foldlevel=99
set nu
set cursorline
set showmatch

nnoremap <space> za
let g:SimpylFold_docstring_preview=1

" neovim-config:
call neomake#configure#automake('nrwi', 500)
" let g:neomake_open_list = 2

" nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

" racer
augroup Racer
    autocmd!
    autocmd FileType rust nmap <buffer> <leader>gd         <Plug>(rust-def)
    autocmd FileType rust nmap <buffer> gs         <Plug>(rust-def-split)
    autocmd FileType rust nmap <buffer> gx         <Plug>(rust-def-vertical)
    autocmd FileType rust nmap <buffer> gt         <Plug>(rust-def-tab)
    autocmd FileType rust nmap <buffer> gd <Plug>(rust-doc)
augroup END

" gitgutter
set updatetime=100

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 1

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Tagbar
nmap <F8> :TagbarToggle<CR>

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" emmet
let g:user_emmet_leader_key='<C-C>'


let maplocalleader = "\\"
let g:vimtex_view_method = 'zathura'


" Rust
let g:rustfmt_autosave = 1
