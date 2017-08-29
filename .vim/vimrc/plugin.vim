"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Initialization
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Dependencies implicitly shown via indentation
" Plug 'dependency'
"  Plug 'dependant'

call plug#begin('~/.vim/plugged')

" High Use
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
 Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rgarver/Kwbd.vim'
Plug 'chrisbra/NrrwRgn'
Plug 'chrisbra/Recover.vim'
Plug 'godlygeek/tabular'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-startify'

" Git
Plug 'tpope/vim-fugitive'
 Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'

" snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'SirVer/ultisnips'
Plug 'tomtom/tlib_vim'
 " Plug 'garbas/vim-snipmate'
 Plug 'honza/vim-snippets'

" themes
Plug 'flazz/vim-colorschemes'
Plug 'crusoexia/vim-monokai'
Plug 'w0ng/vim-hybrid'

" util
Plug 'bronson/vim-trailing-whitespace'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'

" syntax
Plug 'mustache/vim-mustache-handlebars'
Plug 'torrancew/vim-openscad'

" etc
Plug 'jeetsukumaran/vim-indentwise'
Plug 'ap/vim-css-color'
" Plug 'qualiabyte/vim-colorstepper'
" Plug 'mtth/scratch.vim'
"
" airline - comes after everything else
Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'



call plug#end()



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Airline
let g:airline#extensions#tabline#enabled = 1     " buffers as 'tabs'
let g:airline#extensions#tabline#fnamemod = ':t' " just filename
let g:airline_powerline_fonts = 1 " requires patched fonts - https://github.com/powerline/fonts
let g:airline_inactive_collapse=1
let g:airline_theme = "bubblegum"

let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1

let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline#extensions#tabline#show_tabs=0

" let g:hybrid_custom_term_colors = 1
" let g:hybrid_reduced_contrast = 1

let g:airline_section_c="%<%F%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#"

" Tagbar
let g:tagbar_autofocus=1

"
" NERDTree
" re-sourcing vimrc causes the NERDTree icons to break
if exists("g:loaded_webdevicons")
    call webdevicons#refresh()
endif

"
" Startify
"
let g:startify_custom_header=[""]
let g:startify_update_oldfiles=1
let g:startify_change_to_dir=1
" let g:startify_use_env=1

"
" UltiSnips
"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
