" my vimrc
" 
" @author weak_ptr <weak_ptr@163.com>
" @date 2019-10-11
"
" cheers. for peace and love.

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/lwq/.local/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/lwq/.local/dein')
  call dein#begin('/home/lwq/.local/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/lwq/.local/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable


" dein plugin installation
call dein#add('wsdjeg/dein-ui.vim')
call dein#add('joshdick/onedark.vim')
call dein#add('sheerun/vim-polyglot')
call dein#add('itchyny/lightline.vim')
call dein#add('junegunn/fzf')
call dein#add('junegunn/fzf.vim')
call dein#add('dense-analysis/ale')
call dein#add('pseewald/vim-anyfold')
call dein#add('maralla/completor.vim')
call dein#add('nathanaelkane/vim-indent-guides')

" If you want to install not installed plugins on startup.
" if dein#check_install()
"   call dein#install()
" endif
"End dein Scripts-------------------------

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI improvement
set laststatus=2
set nu
set cc=80
colorscheme onedark

let g:onedark_terminal_italics=1
let g:lightline={
    \ 'colorscheme': 'onedark'
    \ }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
set incsearch " search as we type
set hlsearch " highlight matches

" ----------------------------- folding --------------------------------------
filetype plugin indent on           " makesure filetype plugin & indent on
syntax on                           " makesure syntax on
autocmd FileType * AnyFoldActivate  " enable anyfold by default
set foldlevel=0                     " close all fold by default

" ---------------------------- highlight -------------------------------------
hi Comment cterm=None ctermbg=None

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ale

" ------------------- Linter settings (ale) ----------------------------------
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

" -------------------- Fixer settings (ale) ----------------------------------
let g:ale_fixers = {
\   'python': ['yapf']
\ }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" completor
let g:completor_python_binary='python'

" use tab choose suggestion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

noremap <silent> <leader>d :call completor#do('definition')<CR>
noremap <silent> <leader>c :call completor#do('doc')<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indent guide
" autocmd FileType * IndentGuidesEnable
" let g:indent_guides_start_level=1

