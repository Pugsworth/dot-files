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

if exists(":Airline")
    " link the splitter line between windows to the color
    " of the airline mode indicator
    " hi VertSplit      cterm=none ctermfg=7 ctermbg=235
    hi clear VertSplit
    hi link VertSplit airline_a
endif

if g:settings.is_win || g:settings.is_cygwin
"     echo "Fixing Comment ctermfg"
"     hi Comment ctermfg=8
endif

if &syntax == "sh"
    highlight PreProc cterm=none
endif



" Don't explicitly restrict to 80 columns, but implicitly warn if gone over
" from https://github.com/thoughtstream/Damian-Conway-s-Vim-Setup/blob/master/.vimrc
highlight ColorColumn ctermfg=208 ctermbg=Black

