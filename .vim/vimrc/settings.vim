"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Customized Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:settings = {}
let g:settings.is_cygwin = has('win32unix')
let g:settings.is_win = has('win32') || has('win64') || g:settings.is_cygwin

