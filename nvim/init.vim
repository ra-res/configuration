" (N)Vim Configuration File
" vim  : place in $HOME/.vimrc
" nvim : place in $HOME/.config/nvim/init.vim
" $ ln -s $HOME/.config/nvim/init.vim $HOME/.vimrc
" General settings
" https://learnvimscriptthehardway.stevelosh.com/
" ---------------------------------------------------------------------------
" drop vi support - kept for vim compatibility but not needed for nvim
" Probably not needed with Vim 8+
"set nocompatible

" Search recursively downward from CWD; provides TAB completion for filenames
" e.g., `:find vim* <TAB>`
set path+=**

" Syntax highlight
syntax enable

" number of lines at the beginning and end of files checked for file-specific vars
set modelines=0

" reload files changed outside of Vim not currently modified in Vim (needs below)
set autoread

" http://stackoverflow.com/questions/2490227/how-does-vims-autoread-work#20418591
au FocusGained,BufEnter * :silent! !

" use Unicode
set encoding=utf-8

" errors flash screen rather than emit beep
set visualbell

" make Backspace work like Delete
set backspace=indent,eol,start

" don't create `filename~` backups
set nobackup

" don't create temp files
set noswapfile

" line numbers and distances
set relativenumber 
set number 

" number of lines offset when jumping
set scrolloff=5

" Tab key enters 2 spaces
" To enter a TAB character when `expandtab` is in effect,
" CTRL-v-TAB
set expandtab tabstop=2 shiftwidth=2 softtabstop=2 

" Indent new line the same as the preceding line
set autoindent

" statusline indicates insert or normal mode
set showmode showcmd

" make scrolling and painting fast
" ttyfast kept for vim compatibility but not needed for nvim
set ttyfast lazyredraw

" highlight matching parens, braces, brackets, etc
set showmatch

" http://vim.wikia.com/wiki/Searching
"set hlsearch incsearch ignorecase smartcase
set ignorecase

" As opposed to `wrap`
"set nowrap

" http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
set autochdir

" open new buffers without saving current modifications (buffer remains open)
set hidden

" http://stackoverflow.com/questions/9511253/how-to-effectively-use-vim-wildmenu
set wildmenu wildmode=list:longest,full

" StatusLine always visible, display full path
" http://learnvimscriptthehardway.stevelosh.com/chapters/17.html
set laststatus=2 statusline=%F

" Use system clipboard
" http://vim.wikia.com/wiki/Accessing_the_system_clipboard
" for linux
"set clipboard=unnamedplus
" for macOS
"set clipboard=unnamed

" Folding
" https://vim.fandom.com/wiki/Folding
" https://vim.fandom.com/wiki/All_folds_open_when_opening_a_file
" https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
set foldmethod=indent
set foldnestmax=1
set foldlevelstart=1

" Filetype on
filetype plugin on
filetype plugin indent on 

" Shows position of cursor
set cursorcolumn  
set cursorline
hi! link cursorline cursorcolumn

"
" netrw and vim-vinegar
let g:netrw_browse_split = 3

" Plugins, syntax, and colors
" ---------------------------------------------------------------------------
" vim-plug
" https://github.com/junegunn/vim-plug
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Make sure to use single quotes
" Install with `:PlugInstall`

" https://github.com/itchyny/lightline.vim
Plug 'itchyny/lightline.vim'

" https://github.com/tpope/vim-commentary
Plug 'tpope/vim-commentary'

" https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'

" https://github.com/tpope/vim-vinegar
Plug 'tpope/vim-vinegar'

" https://github.com/APZelos/blamer.nvim
"Plug 'APZelos/blamer.nvim'

" https://github.com/fenetikm/falcon/wiki/Installation
"Plug 'fenetikm/falcon'

" https://github.com/preservim/nerdtree
Plug 'preservim/nerdtree' " Nerdtree

" https://github.com/pangloss/vim-javascript
Plug 'pangloss/vim-javascript'    " JavaScript support

" https://github.com/leafgarland/typescript-vim
Plug 'leafgarland/typescript-vim' " TypeScript syntax

" https://github.com/maxmellon/vim-jsx-pretty
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax

" https://github.com/jparise/vim-graphql
Plug 'jparise/vim-graphql'        " GraphQL syntax

" https://github.com/neoclide/coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Code completion

" https://github.com/neoclide/coc-jest
Plug 'neoclide/coc-jest'

" https://github.com/
Plug 'nvim-lua/plenary.nvim'

" https://github.com/ThePrimeagen/harpoon
Plug 'ThePrimeagen/harpoon'

" https://github.com/nvim-telescope/telescope.nvim
Plug 'nvim-telescope/telescope.nvim'

" https://github.com/morhetz/gruvbox
Plug 'morhetz/gruvbox'

" https://github.com/airblade/vim-rooter
Plug 'airblade/vim-rooter'

" https://github.com/joshdick/onedark.vim
Plug 'joshdick/onedark.vim'

" Initialize plugin system
call plug#end()

" Install plug-vim if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Neovim only
if has("termguicolors")
    set termguicolors
endif

" Dark scheme
"colorscheme falcon
colorscheme gruvbox
"colorscheme peachpuff
"colorscheme onedark
highlight Comment ctermfg=green
highlight String ctermfg=red

" Show character column
"set colorcolumn=80

""" GIT BLAMER
"let g:blamer_enabled = 1
" %a is the day of week, in case it's needed
"let g:blamer_date_format = '%e %b %Y'
"highlight Blamer guifg=darkorange

"""
""" EXTENSION CONFIGURATION
"""

" Back/forward one word using b and w
nnoremap b q
nnoremap q b

" For esc-keyless keyboard
imap jj <Esc>

" Map leader to comma
let mapleader = ","

""" TELESCOPE

let g:rooter_patterns = ['.git', '.svn', 'package.json', '!node_modules']

nnoremap <expr><leader>fp ':Telescope find_files cwd='.FindRootDirectory().'/<cr>'
nnoremap <expr><leader>gp ':Telescope live_grep cwd='.FindRootDirectory().'/<cr>'
nnoremap <leader>fz <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

""" COC

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
" Run jest tests 
nnoremap <leader>te :call CocAction('runCommand', 'jest.singleTest')<CR>

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
nmap <leader>t :CocCommand prettier.formatFile<CR>

" Navigate to next error
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" List diagnostics
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>

" List of workspace symbols
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>

" Press K to show diagnostics
nnoremap <silent>K :call CocAction('doHover')<CR>

" Code to show diagnostics and docs automatically 
function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()

""" NerdTree
let NERDTreeQuitOnOpen=1

" Ctrl + key
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
"""
