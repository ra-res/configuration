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

colorscheme desert 

augroup SyntaxSettings
    autocmd!
    autocmd BufNewFile,BufRead *.tsx set filetype=typescript
augroup END

highlight Comment ctermfg=green
highlight String ctermfg=1
highlight Special ctermfg=Magenta
highlight Function ctermfg=2
highlight Identifier ctermfg=3 cterm=none
highlight Number ctermfg=1
highlight JavaScriptValue ctermfg=1
highlight Boolean ctermfg=3
highlight Statement ctermfg=6
highlight Conditional ctermfg=3
highlight Repeat ctermfg=3

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

"Cursor settings:

"  1 -> blinking block
"  2 -> solid block 
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar

