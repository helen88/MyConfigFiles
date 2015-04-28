set nocompatible
set nu
set tabstop=2
set expandtab
set shiftwidth=2

filetype plugin indent on

syntax on
syntax enable

" Always show statusline
set laststatus=2
" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" Solarized options 
let g:solarized_termtrans = 1
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized
" Molokai options 
let g:molokai_original = 1
let g:rehash256 = 1
" colorscheme molokai
set background=dark

let g:Powerline_symbols = 'fancy'
set fillchars+=stl:\ ,stlnc:\

set guifont=Courier_New:h15
set gcr=a:blinkon0
set smartindent
set autoindent
set autoread  "Set to auto read when a file is changed from the outside
set paste
set autowriteall

let mapleader = ","
map <leader>nn :NERDTreeToggle<cr>
map <leader>tt :TlistToggle<cr>
map <C-s> :w<CR>
map <CR> o<ESC>
map <S-CR> O<ESC>
map <C-n> :noh<CR>
map <C-o> :only<CR>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
nmap j gj
nmap k gk

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:vim_markdown_folding_disabled=1

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start
set nobackup  " do not keep a backup file, use versions instead
set history=50  " keep 50 lines of command line history
set ruler " show the cursor position all the time
set cursorline " highlight the current line
set showcmd " display incomplete commands
set incsearch " do incremental searching
" autoload .vimrc
set wildmenu  " cmd auto completion
" set ignorecase
set hlsearch

" paste text with origin indentation
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

autocmd User Node if &filetype == "javascript" | setlocal expandtab | endif
" encoding setting
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
set encoding=prc

