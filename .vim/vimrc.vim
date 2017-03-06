set nocompatible

filetype plugin indent on
set encoding=utf-8
scriptencoding utf-8

set clipboard=unnamed
if has("unnamedplus")
    set clipboard=unnamed,unnamedplus
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Customized Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:settings = {}
let s:settings.is_cygwin = has('win32unix')
let s:settings.is_win = has('win32') || has('win64') || s:settings.is_cygwin



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntax and Highlighting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

colorscheme default
syntax on
set background=dark
" set t_Co=256
colorscheme monokai_mine
" hi LineNr       ctermfg=DarkGrey
" hi CursorLine   ctermbg=237
" hi CursorColumn cterm=bold

if s:settings.is_win || s:settings.is_cygwin
"     echo "Fixing Comment ctermfg"
"     hi Comment ctermfg=8
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
set foldlevel=1

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
inoremap ^] ^X^]
inoremap ^F ^X^F
inoremap ^D ^X^D
inoremap ^L ^X^L
" navigate popup menus with ctrl-j/k
inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-J>"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"

" show whitespace characters
set list
set listchars=extends:>,precedes:<,tab:\|\ ,eol:↲

set wildignore+=*.pyc,*.luac
set wildignore+=*.DS_Store
set wildignore+=*.hg,*.git,*.svn


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Backup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO: create or warn if directories don't exist
set backup
set backupdir=~/.vim/backup,~/.backup
set backupskip=/tmp/backup/*,~/.backup/*
set directory=~/.vim/swap,~/.swap
set writebackup


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Initialization
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'crusoexia/vim-monokai'
Plug 'w0ng/vim-hybrid'
Plug 'bronson/vim-trailing-whitespace'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'mustache/vim-mustache-handlebars'
Plug 'rgarver/Kwbd.vim'
Plug 'chrisbra/NrrwRgn'
Plug 'chrisbra/Recover.vim'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'torrancew/vim-openscad'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'garbas/vim-snipmate'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'honza/vim-snippets'
Plug 'ap/vim-css-color'
Plug 'flazz/vim-colorschemes'
" Plug 'qualiabyte/vim-colorstepper'
Plug 'godlygeek/tabular'
" Plug 'mtth/scratch.vim'


call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" edit .vimrc
"" map <leader>ev :e! ~/.vimrc<CR>
" edit the new location of vimrc
map <leader>ev :e! ~/.vim/vimrc.vim<CR>
" source .vimrc (:so %)
"" map <leader>sv :so ~/.vimrc<CR>
map <leader>sv :so ~/.vim/vimrc.vim<CR>
" edit .bashrc
map <leader>eb :e! ~/.bashrc<CR>

" Closes a buffer with expected behaviour of 'tabs'
" closes the buffer, creates a new blank buffer if last one
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>
map <leader>Q :bp<bar>sp<bar>bn<bar>bd!<CR>

" Folding using <space>
nnoremap <space> za
vnoremap <space> za

" Real line movement
nnoremap j gj
nnoremap k gk

" Set up ESC to remove search highlighting
" second line is needed due to terminal and vim weirdness
nnoremap <silent><esc> :noh<CR>
nnoremap <esc>^[ <esc>^[

" quick renaming within brackets
nnoremap gr gd[{V%::s/<C-R///gc<left><left><left>
nnoremap gR gD:%s/<C-R>///gc<left><left><left>

nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>

cnoremap <C-A> <home>
cnoremap <C-E> <end>

nnoremap * *``
nnoremap # #``


nnoremap <silent> <F3> :set paste!<CR>
imap <silent> <F3> <C-O><F3>
vmap <silent> <F3> <C-O><F3>

nnoremap <silent> <F4> :NERDTreeToggle<CR>
imap <silent> <F4> <C-O><F4>

nnoremap <silent> <F6> :set spell!<CR>
imap <silent> <F6> <C-O><F6>
vmap <silent> <F6> <C-O><F6>

" Nice little function to echo the F key mappings
function! FKeyMappings()
    for i in range(1,12)
        let l:f = '<F'.i.'>'
        let l:map = mapcheck(l:f, 'n')
        if l:map != ""
            echo l:f . ' = ' . l:map
        endif
    endfor
endfunction
command! FKeyMappings call FKeyMappings()
nmap <silent> <F1> :FKeyMappings<CR>



" For now, &comments seems to work wonderfully
"" augroup AutoComment
""     autocmd!
""     autocmd FileType c,cpp,java,scala   let b:comment_leader = '// '
""     autocmd FileType sh,ruby,python     let b:comment_leader = '# '
""     autocmd FileType conf,fstab         let b:comment_leader = '# '
""     autocmd FileType tex                let b:comment_leader = '% '
""     autocmd FileType mail               let b:comment_leader = '> '
""     autocmd FileType vim                let b:comment_leader = '" '
""     autocmd FileType lua                let b:comment_leader = '-- '
"" augroup END

"" vnoremap <leader>/ '<,'>s/^\(\s\?[^"].*\)/" \1/


""""
" Comment Mapping
""""
" Here is a fancy system for toggling line comments on both the current line
" and all lines in a selection.
" It makes use of the &comments variable (:h comments) to crudely extract
" the line-based comment string and insert it in front of the lines.
" Current, it always inserts a space after the comment and removes a single
" space if one exists.
" This has a side-effect of removing a leading space if not commented using a
" space after the comment string.
" It's setup to work with itself so it will always toggle perfectly.
function! DoComment(cmt)
    :s/\v^(\s*)(.+)$/\=
        \printf("%s%s %s", submatch(1), a:cmt, submatch(2))
endfunction

function! DoUncomment(cmt)
    :execute ':s/\V\(\^\s\*\)\('.a:cmt.'\s\?\)\(\s\*\.\*\$\)/\1\3'
endfunction

" TODO: option to only toggle comments for the comment state of the first line
"       use indentation for first line to determine comment location for each line
function! ToggleComment(line)
    if !exists("b:current_syntax")
        return
    end

    let l:cmt_ovr={}
    let l:cmt_ovr.bash="#"

    " some syntaxs have the wrong &comment
    " [sh] is one of them because it tries to handle all *sh shells
    " using the &comments method, it reports // as the comment character, which is wrong
    if has_key(l:cmt_ovr, b:current_syntax)
        let l:cpat=l:cmt_ovr[b:current_syntax]
    else
        let l:cpat=matchlist(&comments, '\%(^\|,b\|\W\):\([^,X]\+\)')[1]
    endif

    " echom "Using character (" . l:cpat . ") for comment."
    if match(a:line, printf('\V\s\*%s', l:cpat)) == 0
        :call DoUncomment(l:cpat)
    else
        :call DoComment(l:cpat)
    endif


endfunction

noremap <silent> <leader>/ :call ToggleComment(getline("."))<CR>



" this is a special one
" there exists a neat shortcut for horizontal resizing: z{N}<CR>
" but nothing exists for resizing horizontally
" unfortunately, z{N}<CR> works off of line count, not 0-100%
nnoremap <silent> <leader>z :set opfunc=ResizeVertical<CR>g@
function! ResizeVertical(...)

    if a:1 == 'line'
        if v:count > 0
            " percent * columns
            let l:perc = string(round( (&columns+0.0) * ((v:count+0.0) / 100.0) ))
            execute "vertical resize" l:perc
        endif
    elseif a:1 =~ '\v\d+(\.\d*)?'
        let l:perc = string((&columns+0.0) * (a:1 + 0.0) / 100.0)
        echom a:1 . ' - ' . l:perc
        execute "vertical resize" l:perc
    endif

endfunction

" TODO: normalize nomenclature
nmap <silent> 1 :call ResizeVertical(25)<CR>
nmap <silent> 2 :call ResizeVertical(50)<CR>
nmap <silent> 3 :call ResizeVertical(75)<CR>

" nmap <silent> 4 :call ResizeHorizontal(25)<CR>
" nmap <silent> 5 :call ResizeHorizontal(50)<CR>
" nmap <silent> 6 :call ResizeHorizontal(75)<CR>

" Reports syntax group under cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:airline#extensions#tabline#enabled = 1     " buffers as 'tabs'
let g:airline#extensions#tabline#fnamemod = ':t' " just filename
let g:airline_powerline_fonts = 1 " requires patched fonts - https://github.com/powerline/fonts
let g:airline_inactive_collapse=1
let g:airline_theme = "bubblegum"

let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1

let g:airline#extensions#tabline#buffer_nr_show=1

" let g:hybrid_custom_term_colors = 1
" let g:hybrid_reduced_contrast = 1

let g:airline_section_c="%<%F%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <C-h> :call WinMove('h')<CR>
map <C-j> :call WinMove('j')<CR>
map <C-k> :call WinMove('k')<CR>
map <C-l> :call WinMove('l')<CR>

" Window movement shortcuts
" move to the window in the direction shown, or create a new window
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction


nmap <leader>T :enew<CR>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>

" swap line down
nmap <ESC>N :m +1<CR>
" swap line up
nmap <ESC>M :m -2<CR>


function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

nnoremap <F2> :call NumberToggle()<CR>
"" cnoremap <C-n> <CR>n/<C-p>
"" cnoremap <C-m> <CR>n?<C-p>

" Changes the syntax to default when leaving a buffer
function! SyntaxLeave()
    let b:syntax_name = &filetype
    let &l:syntax = "text"
endfunc

" Changes the syntax back using the buffer variable b:syntax_name
function! SyntaxEnter()
    try
        let &l:syntax = b:syntax_name
    catch /^Vim\%((\a\+)\)\=:E121/
        " normal :echo "Uh oh! Failed to reset syntax"
    endtry
endfunc

augroup Focus
    autocmd!
    autocmd BufLeave,FocusLost,WinLeave,BufWinLeave     * set norelativenumber
    autocmd BufEnter,FocusGained,WinEnter,BufWinEnter   * set relativenumber

    autocmd BufLeave,FocusLost,WinLeave,BufWinLeave     * setlocal  nocursorline
    autocmd BufEnter,FocusGained,WinEnter,BufWinEnter   * setlocal  cursorline

    autocmd BufLeave,FocusLost,WinLeave,BufWinLeave     * :call SyntaxLeave()
    autocmd BufEnter,FocusGained,WinEnter,BufWinEnter   * :call SyntaxEnter()
augroup END

function! ShowQuickReference()
    :silent !firefox "https://cdn.shopify.com/s/files/1/0165/4168/files/preview.png"
    :redraw!
endfunc
command! Quickref call ShowQuickReference()

function! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfunc
command! TrimWhitespace call TrimWhitespace()

" Not sure if we want this to run all the time
" autocmd BufWritePre * :call TrimWhitespace()


function! Refactor()
    let old = expand("<cword>")
    let new = input("New Name: ")
    echo "[DUMMY] would replace " . old . " to " . new
endfunc


" function! ShellExecute()
"     let tempfile = tempname()
" endfunc


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom Filetypes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd BufRead,BufNewFile *.bash_* set filetype=sh


