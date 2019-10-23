" my vimrc
" 
" @author weak_ptr <weak_ptr@163.com>
" @date 2019-10-11
"
" cheers. for peace and love.

" no vi compatible
set nocompatible

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Color schemes
Plug 'joshdick/onedark.vim'
Plug 'mhartington/oceanic-next'

" Visual interfaces
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'yggdroot/indentline'
Plug 'scrooloose/nerdtree'

" utils
Plug 'junegunn/fzf'

" language specific
Plug 'konfekt/fastfold'
Plug 'tmhedberg/simpylfold'

" Linting
Plug 'w0rp/ale'
Plug 'maralla/completor.vim'

" Initialize plugin system
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User Interfaces
set laststatus=2
set nu
set cc=80

" Theme
syntax enable

" for vim 7
set t_Co=256
set bg=dark

" for vim 8
if (has("termguicolors"))
    set termguicolors
endif

colorscheme OceanicNext

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Win32 GUI compatible
"
if (has('gui'))
    " set pretty font
    set guifont=consolas:h11
    " no toolbar
    set go-=T
    " no menubar
    set go-=m
end

if (has('win32'))
    " set default file encoding
    set fenc=utf-8
    " set default buffer encoding
    set enc=utf-8
end

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntax & edit
"
filetype plugin indent on
syntax enable
set modelines=1     " Modeline (allow comment contents in file set vim config)
set number          " Line number
set ruler           " Column number and row number
set showcmd         " Show command in status line
set cursorline      " highlight current line
set wildmenu        " visual autocomplete for command menu
set showmatch       " highlight matching [({})]
set noshowmode
set laststatus=2
set backspace=indent,eol,start

" Spaces & Tabs
set tabstop=4 " number of visual spaces per TAB
set softtabstop=4 " number of spaces in tab when editing
set shiftwidth=4
set expandtab " TABs are spaces
set textwidth=80
" linebreak & wrap & scroll
set nowrap
set nolinebreak
set nolist
set scrolloff=20
set sidescroll=1

" ----------------------------- Key binding ----------------------------------
let mapleader=','
nnoremap <leader>f :FZF<CR>
nnoremap <leader>t :tabnew<CR>
nnoremap <leader><tab> :tabn<CR>
nnoremap <leader>q :quit<CR>

" ----------------------------- Search ---------------------------------------
set incsearch   " search as we type
set hlsearch    " highlight matches

" ----------------------------- folding --------------------------------------
filetype plugin indent on           " makesure filetype plugin & indent on
syntax on                           " makesure syntax on
set foldlevel=0                     " close all fold by default

" ---------------------------- highlight -------------------------------------
hi Comment cterm=None ctermbg=None

