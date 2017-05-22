

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


" Not sure if we want this to run all the time
" autocmd BufWritePre * :call TrimWhitespace()

augroup Focus
    autocmd!
    " autocmd BufLeave,FocusLost,WinLeave,BufWinLeave     * set norelativenumber
    " autocmd BufEnter,FocusGained,WinEnter,BufWinEnter   * set relativenumber

    " autocmd BufLeave,FocusLost,WinLeave,BufWinLeave     * setlocal nocursorline
    " autocmd BufEnter,FocusGained,WinEnter,BufWinEnter   * setlocal cursorline

    " autocmd BufLeave,FocusLost,WinLeave,BufWinLeave     * :call SyntaxLeave()
    " autocmd BufEnter,FocusGained,WinEnter,BufWinEnter   * :call SyntaxEnter()
    autocmd BufLeave     * :call SyntaxLeave()
    autocmd BufEnter     * :call SyntaxEnter()
augroup END



augroup MarkMargin
    autocmd!
    autocmd  BufEnter  *       :call MarkMargin(1)
    autocmd  BufEnter  *.vp*   :call MarkMargin(0)
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom Filetypes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd BufRead,BufNewFile *.bash_* set filetype=sh



