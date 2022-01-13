syntax on
set tabstop=2
set shiftwidth=2
set expandtab
set ai
set number
set hlsearch
set ruler
set autoindent
set cindent
set t_Co=256
set re=2
filetype plugin on
filetype plugin indent on 
"inoremap ( ()<Esc>i
"inoremap { {}<Esc>i
"inoremap {<CR> {<CR>}<Esc>O
"inoremap [ []<Esc>i
"inoremap < <><Esc>i
"inoremap ' ''<Esc>i
"inoremap " ""<Esc>i
nnoremap b q
nnoremap q b
imap jj <Esc>
set timeout ttimeout         " separate mapping and keycode timeouts
set timeoutlen=500           " mapping timeout 500ms  (adjust for preference)
set ttimeoutlen=20           " keycode timeout 20ms

"highlight Visual     cterm=NONE ctermbg=76  ctermfg=16  gui=NONE guibg=#5fd700 guifg=#000000
"highlight NonText    cterm=NONE ctermbg=17              gui=NONE guibg=#00005f
"highlight Normal     cterm=NONE ctermbg=17              gui=NONE guibg=#00005f
"highlight StatusLine cterm=NONE ctermbg=231 ctermfg=160 gui=NONE guibg=#ffffff guifg=#d70000


augroup SyntaxSettings
    autocmd!
    autocmd BufNewFile,BufRead *.tsx let b:tsx_ext_found = 1
    autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
    autocmd BufNewFile,BufRead *.js set filetype=typescript.tsx
    autocmd BufNewFile,BufRead *.jsx set filetype=typescript.tsx
augroup END
"""Cursor settings:

"  1 -> blinking block
"  2 -> solid block 
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar

"Gnome Terminal
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[6 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[4 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

"MacOS
"Mode Settings
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)
"""

let mapleader = "," " map leader to comma

call plug#begin()

Plug 'preservim/nerdtree' " Nerdtree
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'jparise/vim-graphql'        " GraphQL syntax
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Code completion
Plug 'morhetz/gruvbox'

call plug#end()

set termguicolors

"colorscheme desert 
set background=light
colorscheme gruvbox
"
"highlight Comment ctermfg=darkgreen
"highlight String ctermfg=1
"highlight Normal ctermfg=grey ctermbg=black
"highlight Special ctermfg=Magenta
"highlight Function ctermfg=2
"highlight Identifier ctermfg=3 cterm=none
"highlight Number ctermfg=1
"highlight JavaScriptValue ctermfg=1
"highlight Boolean ctermfg=3
"highlight Statement ctermfg=6
"highlight Conditional ctermfg=3
"highlight Repeat ctermfg=3

"Fix COC Underlining 
hi cocerrorhighlight ctermfg=red guifg=#c4384b gui=undercurl term=undercurl
hi cocwarninghighlight ctermfg=yellow guifg=#c4ab39 gui=undercurl term=undercurl

" Coc Colours for darcula theme
"hi! link CocErrorSign ErrorSign
"hi! link CocWarningSign WarningSign
"hi! link CocInfoSign InfoSign
"hi! link CocHintSign HintSign
"hi! link CocErrorFloat Pmenu
"hi! link CocWarningFloat Pmenu
"hi! link CocInfoFloat Pmenu
"hi! link CocHintFloat Pmenu
"hi! link CocHighlightText IdentifierUnderCaret
"hi! link CocHighlightRead IdentifierUnderCaret
"hi! link CocHighlightWrite IdentifierUnderCaretWrite
"hi! link CocErrorHighlight CodeError
"hi! link CocWarningHighlight CodeWarning
"hi! link CocInfoHighlight CodeInfo
"hi! link CocHintHighlight CodeHint

" CoC Extensions
let g:coc_global_extensions = ['coc-solargraph', 'coc-tsserver', 'coc-json', 'coc-tslint-plugin']

" Add CoC Prettier if prettier is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

" Add CoC ESLint if ESLint is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

""" Shortcuts for Coc
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>do <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf <Plug>(coc-fix-current)
nmap <leader>rn <Plug>(coc-rename)

" Format file
nmap <leader>f :CocCommand prettier.formatFile<CR>

" Navigate to next error
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" List diagnostics
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>

" List of workspace symbols
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>

"""

""" Code to show diagnostics and docs automatically 
" Press K to show diagnostics
nnoremap <silent>K :call CocAction('doHover')<CR>

function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(100, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()
"""

"""NerdTree
let NERDTreeQuitOnOpen=1

" Ctrl + key
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
"""

" Install plug-vim if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

