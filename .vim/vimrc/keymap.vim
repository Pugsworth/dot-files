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

" no comment
noremap <leader>w :w<CR>

" default Y to yank including newline doesn't make sense
nnoremap Y y$

" Closes a buffer with expected behaviour of 'tabs'
" closes the buffer, creates a new blank buffer if last one
" map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>
" map <leader>Q :bp<bar>sp<bar>bn<bar>bd!<CR>
nmap <leader>q <Plug>Kwbd

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


inoremap ^] ^X^]
inoremap ^F ^X^F
inoremap ^D ^X^D
inoremap ^L ^X^L
" navigate popup menus with ctrl-j/k
inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-J>"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"



nnoremap <silent> <F3> :set paste!<CR>
imap <silent> <F3> <C-O><F3>

nnoremap <silent> <F4> :NERDTreeToggle<CR>
imap <silent> <F4> <C-O><F4>

nnoremap <silent> <F6> :set spell!<CR>
imap <silent> <F6> <C-O><F6>

nnoremap <F8> :TagbarToggle<CR>


nmap <silent> <F1> :FKeyMappings<CR>


noremap <silent> <leader>/ :call ToggleComment(getline("."))<CR>



" this is a special one
" there exists a neat shortcut for horizontal resizing: z{N}<CR>
" but nothing exists for resizing horizontally
" unfortunately, z{N}<CR> works off of line count, not 0-100%
nnoremap <silent> <leader>z :set opfunc=ResizeVertical<CR>g@



" TODO: normalize nomenclature
nmap <silent> 1 :call ResizeVertical(25)<CR>
nmap <silent> 2 :call ResizeVertical(50)<CR>
nmap <silent> 3 :call ResizeVertical(75)<CR>

" nmap <silent> 4 :call ResizeHorizontal(25)<CR>
" nmap <silent> 5 :call ResizeHorizontal(50)<CR>
" nmap <silent> 6 :call ResizeHorizontal(75)<CR>

" Reports syntax group under cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>


map <C-h> :call WinMove('h')<CR>
map <C-j> :call WinMove('j')<CR>
map <C-k> :call WinMove('k')<CR>
map <C-l> :call WinMove('l')<CR>


" nmap <leader>T :enew<CR>
" nmap <leader>l :bnext<CR>
" nmap <leader>h :bprevious<CR>

" swap line down
nmap <ESC>N :m +1<CR>
" swap line up
nmap <ESC>M :m -2<CR>


nnoremap <F2> :call NumberToggle()<CR>
"" cnoremap <C-n> <CR>n/<C-p>
"" cnoremap <C-m> <CR>n?<C-p>


"" vnoremap <leader>/ '<,'>s/^\(\s\?[^"].*\)/" \1/

