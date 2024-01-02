syntax on
set background=dark
colorscheme desert
highlight Comment ctermfg=green

set ai
set number
set relativenumber
set hlsearch
set ruler
set autoindent
set cindent
set t_Co=256 
set re=2
set timeout ttimeout
set timeoutlen=500
set ttimeoutlen=20
set shiftwidth=2
set tabstop=2
set expandtab
set showtabline=2
set swapfile
set cursorline
set cursorcolumn 
set visualbell

filetype plugin on
filetype plugin indent on 

let mapleader = "," " map leader to comma

imap jj <Esc>

vmap < <gv
vmap > >gv


" Navigate buffers
noremap <Tab> :bnext<CR>
noremap <S-Tab> :bprevious<CR>

" Navigate tabs
noremap tj :tabprev<CR>
noremap tk :tabnext<CR>
noremap tn :tabnew<CR>

" noremap <C-x> :Bdelete!<CR>

" Navigate windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Split window
nnoremap vs :vs<CR>
nnoremap sp :sp<CR>

nnoremap <leader>b :ls<CR>:b<Space>

"""Cursor settings:
"  1 -> blinking block
"  2 -> solid block 
"  3 -> blinking underscore
"  4 -> solid underscore
"  ==>
"  5 -> blinking vertical bar
"  6 -> solid vertical bar

"Gnome Terminal
" if has("autocmd")
"   au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
"   au InsertEnter,InsertChange *
"     \ if v:insertmode == 'i' | 
"     \   silent execute '!echo -ne "\e[6 q"' | redraw! |
"     \ elseif v:insertmode == 'r' |
"     \   silent execute '!echo -ne "\e[4 q"' | redraw! |
"     \ endif
"   au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
" endif

"MacOS
" Cursor Mode Settings
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

set rtp+=$HOMEBREW_PREFIX/opt/fzf
noremap <leader>ff :FZF<CR>

