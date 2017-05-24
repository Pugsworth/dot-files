if has("strftime")
    function! Date()
        return strftime("%d%m%Y")
    endfunction
endif

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

function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

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

function! Refactor()
    let old = expand("<cword>")
    let new = input("New Name: ")
    echo "[DUMMY] would replace " . old . " to " . new
endfunc



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
        \/e
endfunction

function! DoUncomment(cmt)
    let l:esc_cmt = substitute(a:cmt, '\/', '\\/', 'g')
    :execute ':s/\V\(\^\s\*\)\('.l:esc_cmt.'\s\?\)\(\s\*\.\*\$\)/\1\3'
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
        let s:matched=matchlist(&comments, '\%(^\|,b\|\W\):\([^,X]\+\)')

        if empty(s:matched)
            echomsg "Comment match failed, does &comments contain a valid comment?"
            return
        endif

        let l:cpat=s:matched[1]
    endif

    " echom "Using character (" . l:cpat . ") for comment."
    if match(a:line, printf('\V\s\*%s', l:cpat)) == 0
        :call DoUncomment(l:cpat)
    else
        :call DoComment(l:cpat)
    endif


endfunction



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


function! MarkMargin (on)
    if exists('b:MarkMargin')
        try
            call matchdelete(b:MarkMargin)
        catch /./
        endtry
        unlet b:MarkMargin
    endif
    if a:on
        let b:MarkMargin = matchadd('ColorColumn', '\%81v\s*\S', 100)
    endif
endfunction


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


" TODO: refactor into an autoload or plugin or something
" when adding more to the list on another line, escape the first quote
" (:help line-continuation)
let s:synbl = ['help', 'nerdtree']
" called before Enter/Leave to determine if we do anything
function! PreSyntax()
    if !&l:modifiable || index(s:synbl, &l:syntax) != -1
        return 0
    endif

    return 1
endfunction

" Changes the syntax to default when leaving a buffer
function! SyntaxLeave()
    let l:cont = PreSyntax()
    if l:cont == 0
        return
    endif

    let b:syntax_name = &filetype
    let &l:syntax = "text"
endfunc

" Changes the syntax back using the buffer variable b:syntax_name
function! SyntaxEnter()
    let l:cont = PreSyntax()
    if l:cont == 0
        return
    endif

    try
        let &syntax = b:syntax_name
    catch /^Vim\%((\a\+)\)\=:E121/
        " normal :echo "Uh oh! Failed to reset syntax"
    endtry
endfunc


" function! ShellExecute()
"     let tempfile = tempname()
" endfunc

