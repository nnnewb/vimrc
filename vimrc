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

" theme
Plug 'https://ghproxy.com/github.com/morhetz/gruvbox'

" syntax highlight
Plug 'https://ghproxy.com/github.com/sheerun/vim-polyglot'

" UI
Plug 'https://ghproxy.com/github.com/ryanoasis/vim-devicons'
Plug 'https://ghproxy.com/github.com/vim-airline/vim-airline'
Plug 'https://ghproxy.com/github.com/airblade/vim-gitgutter'
Plug 'https://ghproxy.com/github.com/yggdroot/indentline'

" navigate
Plug 'https://ghproxy.com/github.com/scrooloose/nerdtree'
Plug 'https://ghproxy.com/github.com/Xuyuanp/nerdtree-git-plugin'

" lsp and other programming features
Plug 'https://ghproxy.com/github.com/neoclide/coc.nvim', {'branch': 'release'}
" 插件支持
" coc-json
" coc-tsserver
" coc-vimlsp
" coc-jedi
" coc-go
" coc-clang-format-style-options
" coc-yaml
" coc-lists

" Initialize plugin system
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User Interfaces
set cursorline     " 高亮当前行
set laststatus=2   " 状态栏高度
set number         " 开启行号
set cc=80          " 行宽指示

" Theme
syntax enable          " 启用语法高亮
colorscheme gruvbox    " 指定主题
set bg=dark            " 不指定 bg 会导致终端下背景颜色出问题

" for vim 8
if (has("+termguicolors"))
    set termguicolors
endif

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
set nomodeline      " 不要读 modeline
set showcmd         " Show command in status line
set wildmenu        " visual autocomplete for command menu
set showmatch       " highlight matching [({})]
set noshowmode
set laststatus=2

" editing
set backspace=indent,eol,start " 兼容 vi

" Spaces & Tabs
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4
set expandtab       " TABs are spaces

" linebreak & wrap & scroll
set nowrap
set nolinebreak
set nolist
set scrolloff=10
set sidescroll=1

" line width and ruler
set tw=0
set ruler

" file encoding
set encoding=utf-8
set fileencoding=utf-8

" search
set incsearch   " search as we type
set hlsearch    " highlight matches

" hi Comment cterm=None ctermbg=None

" swapfile
set nobackup
set noswapfile
set noundofile

" ----------------------------- Key binding ----------------------------------
let mapleader=','

" goto file
nnoremap <C-p> :CocList files<CR>

" tabs control
nnoremap <C-n> :tabnew<CR>
nnoremap <S-tab> :tabn<CR>

" ---------------------------- nerdtree --------------------------------------
"  shortcut
nnoremap <leader>t :NERDTreeToggle<CR>

"  unicode symbol
let g:NERDTreeGitStatusIndicatorMapCustom = {
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

let g:NERDTreeGitStatusShowIgnored = 1

" ============================= coc ==========================================

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

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

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

