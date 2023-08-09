" Settings
" Show Line Numbers
set number relativenumber
" Wrap Text
set wrap
" Set Text Encoding
set encoding=utf-8
" Status Bar
set laststatus=2
" No Startup Text
set shortmess=I
" Show Current Command
set showcmd
" Avoid Wrapping A Line In The Middle Of A Word
set linebreak
" Make Searching Better
set hlsearch
set incsearch
vnoremap <C-c> "+y
map <C-p> "+P
" Enable Colors In The Terminal
set termguicolors
" Highlight The Line Currently Under Cursor
set cursorline
" Make Update Time Smaller
set updatetime=250
" Enable Mouse
set mouse=a
set mousehide
" Show The File Currently Being Edited
set title
" Confirm You Want To Close Unsaved File
set confirm
" Enable Spellchecking
set spell
" Set History Higher
set history=10000
" Hide Tilde's
set fillchars=eob:\
" Tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
" Make Vim Act Normal In Windows
set nocompatible
" Turn On Syntax
syntax on
let g:is_posix=1
" Enable Autocompletion
set wildmode=longest,list,full
" Make It So When You Split It Goes To The Right
set splitbelow splitright
" Make Hopping Around Split Windows Easier
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" Remap S Which Is Equal To The Command cc To A Find And Replace Function
nnoremap S :%s//g<Left><Left>
" Delete Whitespace On Save
autocmd BufWritePre * %s/\s\+$//e
" Make Undo File
set undofile
" Have GDB Alias
autocmd VimEnter * packadd termdebug
" Plugins
call plug#begin()
  Plug 'luochen1990/rainbow'
  Plug 'tpope/vim-fugitive'
  Plug '907th/vim-auto-save'
  Plug 'tpope/vim-surround'
  Plug 'vim-airline/vim-airline'
  Plug 'tpope/vim-commentary'
  Plug 'tc50cal/vim-terminal'
  Plug 'lervag/vimtex'
  Plug 'pbrisbin/vim-mkdir'
  Plug 'catppuccin/vim', { 'as': 'catppuccin' }
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'preservim/nerdtree' |
              \ Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()
" Install vim-plug if not found
if has('win64') || has('win32') || has('win16')
  if empty(glob('C:\Users\%USERNAME%\AppData\Local\nvim\autoload\plug.vim'))
    silent !curl -fLo :\Users\%USERNAME%\AppData\Local\nvim\autoload\plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  endif
else
  if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  endif
endif
" Run PlugInstall and PlugClean if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC | PlugClean
  \| endif
" Theme
colorscheme catppuccin_mocha
set background=dark
" Setup The Plugins
let g:rainbow_conf = {
  \ 'guifgs': ['#ec9ca4', '#89cedc', '#b6bdf9', '#a4dc94', '#e4cce4', '#8cacf4', '#f4c4c4', '#c4a4f4']
\ }
let g:airline_theme = 'catppuccin_mocha'
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable='+'
let g:NERDTreeDirArrowCollapsible='~'
autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
let g:rainbow_active = 1
silent! let g:auto_save = 1
let g:coc_disable_startup_warning = 1
" Configure Plugin Shortcuts
" Markdown Previewer
  nmap <F5> <Plug>MarkdownPreview
  nmap <F6> <Plug>MarkdownPreviewStop
  nmap <F7> <Plug>MarkdownPreviewToggle
" Nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <Tab>
  \ coc#pum#visible() ? coc#pum#next(1) :
  \ check_back_space() ? '\<Tab>' :
  \ coc#refresh()
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
if has('patch-8.1.1564')
  set signcolumn=number
else
  set signcolumn=no
endif
let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-html', 'coc-snippets', 'coc-css', 'coc-cssmodules', 'coc-discord', 'coc-clangd', 'coc-python', 'coc-java', 'coc-texlab', 'coc-xml', 'coc-yaml']
