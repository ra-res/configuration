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
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap {<CR> {<CR>}<Esc>O
inoremap [ []<Esc>i
inoremap < <><Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i
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
""highlight Normal ctermfg=white
highlight Function ctermfg=white
highlight NonText ctermfg=white
highlight Special ctermfg=Magenta
highlight Identifier ctermfg=3 cterm=none
highlight Number ctermfg=1
highlight JavaScriptValue ctermfg=1
highlight Boolean ctermfg=3
highlight Statement ctermfg=6
