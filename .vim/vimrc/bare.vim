set nocompatible

filetype plugin indent on
scriptencoding utf-8
augroup Encoding
    au!
    autocmd BufNewFile,BufRead * if &modifiable
    autocmd BufNewFile,BufRead *    set encoding=utf-8
    autocmd BufNewFile,BufRead * endif
augroup END

set encoding=utf-8

"           +--- Remember marks for last 100 files
"           |    +--- Remember up to 100 lines in each regsiter
"           |    |    +--- Remember 100 bytes in each register
"           |    |    |    +--- no hlsearch on load
"           |    |    |    | +--- Remember uppercase marks
"           |    |    |    | |  +--- Remember last 500 commands
"           |    |    |    | |  |
"           v    v    v    v v  v
set viminfo='100,<100,s100,h,f1,:500

set clipboard=unnamed
if has("unnamedplus")
    set clipboard=unnamed,unnamedplus
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nowrap
set number
set hidden

" searching
set incsearch
set hlsearch
set ignorecase
set smartcase
let @/ = ""
let @y = "ggVGy"

" indentation
set autoindent
set smartindent
set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround

" folding
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=99

" miscellaneous
set scrolloff=3
set sidescroll=1
set sidescrolloff=10
set showcmd
set cursorline
set cursorcolumn
set laststatus=2
set backspace=indent,eol,start
set notimeout
set ttimeout
set ttimeoutlen=10
set showbreak=>
set splitright
set splitbelow
set lazyredraw
set synmaxcol=300 " when would anything over 300 columns even need to be highlighted?
set virtualedit=block

" tell vim that any [sh] syntax is bash (posix)
let g:is_bash=1

" If an xterm or rxvt terminal, change cursor for mode
if &term =~ "xterm\\|rxvt"
    let &t_SI="\033[5 q"
    let &t_EI="\033[1 q"
endif


" completion
set dictionary+=/usr/share/dict/words
set completeopt=menuone,noinsert
set wildmode=longest,list

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Backup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO: create or warn if directories don't exist
set backup
set backupdir=~/.vim/backup,~/.backup
set backupskip=/tmp/backup/*,~/.backup/*
set directory=~/.vim/swap,~/.swap
set writebackup


" show whitespace characters
set list
set listchars=extends:>,precedes:<,tab:\|\ ,eol:↲

set fillchars=vert:┆,fold:-

set wildignore+=*.pyc,*.luac
set wildignore+=*.DS_Store
set wildignore+=*.hg,*.git,*.svn


