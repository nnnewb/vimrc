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
Plug 'Xuyuanp/nerdtree-git-plugin'

" code browse
Plug 'junegunn/fzf'
Plug 'jremmen/vim-ripgrep'

" python code folding
Plug 'konfekt/fastfold'

" logstash
Plug 'elastic/logstash'

" code linting
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
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4
set expandtab       " TABs are spaces
" linebreak & wrap & scroll
set nowrap
set nolinebreak
set nolist
set scrolloff=20
set sidescroll=1
" line width and ruler
set textwidth=80

" ----------------------------- Key binding ----------------------------------
let mapleader=','
nnoremap <leader>f :FZF<CR>
" tabs control
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>n :tabn<CR>
nnoremap <leader>p :tabp<CR>
nnoremap <leader>q :quit<CR>
" save file
nnoremap <leader>s :w<CR>

" ----------------------------- Search ---------------------------------------
set incsearch   " search as we type
set hlsearch    " highlight matches

" ----------------------------- folding --------------------------------------
filetype plugin indent on           " makesure filetype plugin & indent on
syntax on                           " makesure syntax on

" ----------------------- disable swap files ---------------------------------
set nobackup
set noswapfile
set noundofile

" ---------------------------- highlight -------------------------------------
hi Comment cterm=None ctermbg=None

" ---------------------------------- ale -------------------------------------
nnoremap <F7> :ALEPrevious<CR>
nnoremap <F8> :ALENext<CR>
nnoremap <F9> :ALEFix<CR>
let g:ale_fixers = {'python': ['yapf','isort']}

" Linter settings (ale)
let g:ale_set_highlights = 0
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_statusline_format = ['E•%d', 'W•%d', 'OK']
" For a more fancy ale statusline
function! ALEGetError()
let l:res = ale#statusline#Status()
if l:res ==# 'OK'
    return ''
else
    let l:e_w = split(l:res)
    if len(l:e_w) == 2 || match(l:e_w, 'E') > -1
	return ' •' . matchstr(l:e_w[0], '\d\+') .' '
    endif
endif
endfunction

function! ALEGetWarning()
let l:res = ale#statusline#Status()
if l:res ==# 'OK'
    return ''
else
    let l:e_w = split(l:res)
    if len(l:e_w) == 2
	return ' •' . matchstr(l:e_w[1], '\d\+')
    elseif match(l:e_w, 'W') > -1
	return ' •' . matchstr(l:e_w[0], '\d\+')
    endif
endif
endfunction

let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_warning_str = 'Warning'

" ---------------------------- completor -------------------------------------
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

let g:completor_complete_options = 'menuone,noselect,preview'

noremap <silent> <leader>d :call completor#do('definition')<CR>
noremap <silent> <leader>c :call completor#do('doc')<CR>

" ---------------------------- nerdtree --------------------------------------
"  shortcut
nnoremap <F10> :NERDTreeToggle<CR>

"  unicode symbol
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

let g:NERDTreeShowIgnoredStatus = 1
