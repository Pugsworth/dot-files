"----------------------------------------------------------------
" Vim color file
" Converted from Textmate theme Monokai using Coloration v0.3.2 (http://github.com/sickill/coloration)

highlight clear
set background=dark

if exists("syntax_on")
  syntax reset
endif

set t_Co=256
let g:colors_name = "Monokai Mine"


"----------------------------------------------------------------
" General settings                                              |
"----------------------------------------------------------------
"----------------------------------------------------------------
" Syntax group   | Foreground    | Background    | Style        |
"----------------------------------------------------------------

" --------------------------------
" Editor settings
" --------------------------------
hi Normal          ctermfg=none    ctermbg=235    cterm=none
hi Cursor          ctermfg=none    ctermbg=none    cterm=none
hi CursorLine      ctermfg=none    ctermbg=237     cterm=none
hi LineNr          ctermfg=242     ctermbg=234     cterm=none
hi CursorLineNR    ctermfg=208     ctermbg=235     cterm=bold

" -----------------
" - Number column -
" -----------------
hi CursorColumn    ctermfg=none    ctermbg=236     cterm=bold
hi FoldColumn      ctermfg=none    ctermbg=233     cterm=bold
hi Folded          ctermfg=59      ctermbg=233     cterm=standout
hi SignColumn      ctermfg=none    ctermbg=235     cterm=standout

" -------------------------
" - Window/Tab delimiters -
" -------------------------
hi VertSplit       ctermfg=239     ctermbg=233     cterm=reverse
hi ColorColumn     ctermfg=none    ctermbg=235     cterm=reverse
hi TabLine         ctermfg=252     ctermbg=233     cterm=underline
hi TabLineFill     ctermfg=none    ctermbg=none    cterm=reverse
hi TabLineSel      ctermfg=none    ctermbg=none    cterm=bold

" -------------------------------
" - File Navigation / Searching -
" -------------------------------
hi Directory       ctermfg=81      ctermbg=none    cterm=bold
hi Search          ctermfg=234     ctermbg=186     cterm=reverse
hi IncSearch       ctermfg=none    ctermbg=none    cterm=reverse

" -----------------
" - Prompt/Status -
" -----------------
hi StatusLine      ctermfg=59      ctermbg=234     cterm=bold,reverse
hi StatusLineNC    ctermfg=239     ctermbg=59      cterm=reverse
hi WildMenu        ctermfg=0       ctermbg=11      cterm=standout
hi Question        ctermfg=186     ctermbg=none    cterm=standout
hi Title           ctermfg=186     ctermbg=none    cterm=bold
hi ModeMsg         ctermfg=186     ctermbg=none    cterm=bold
hi MoreMsg         ctermfg=186     ctermbg=none    cterm=bold

" --------------
" - Visual aid -
" --------------
hi MatchParen      ctermfg=234     ctermbg=141     cterm=reverse
hi Visual          ctermfg=none    ctermbg=239     cterm=none
hi VisualNOS       ctermfg=none    ctermbg=none    cterm=bold,underline
hi NonText         ctermfg=237     ctermbg=none    cterm=bold

hi Todo            ctermfg=208     ctermbg=none    cterm=bold
hi Underlined      ctermfg=148     ctermbg=none    cterm=underline
hi Error           ctermfg=196     ctermbg=52      cterm=reverse
hi ErrorMsg        ctermfg=196     ctermbg=52      cterm=standout
hi WarningMsg      ctermfg=196     ctermbg=none    cterm=standout
hi Ignore          ctermfg=none    ctermbg=none    cterm=none
hi SpecialKey      ctermfg=197     ctermbg=none    cterm=bold

" --------------------------------
" Variable types
" --------------------------------
hi Constant        ctermfg=141     ctermbg=none    cterm=underline
hi String          ctermfg=186     ctermbg=none    cterm=none
hi StringDelimiter ctermfg=186     ctermbg=none    cterm=none
hi Character       ctermfg=186     ctermbg=none    cterm=none
hi Number          ctermfg=141     ctermbg=none    cterm=none
hi Boolean         ctermfg=208     ctermbg=none    cterm=none
hi Float           ctermfg=141     ctermbg=none    cterm=none

hi Identifier      ctermfg=148     ctermbg=none    cterm=none
hi Function        ctermfg=148     ctermbg=none    cterm=none

" --------------------------------
" Language constructs
" --------------------------------
hi Statement       ctermfg=197     ctermbg=none    cterm=none
hi Conditional     ctermfg=197     ctermbg=none    cterm=none
hi Repeat          ctermfg=197     ctermbg=none    cterm=none
hi Label           ctermfg=197     ctermbg=none    cterm=none
hi Operator        ctermfg=197     ctermbg=none    cterm=none
hi Keyword         ctermfg=81      ctermbg=none    cterm=none
hi Exception       ctermfg=197     ctermbg=none    cterm=bold
hi Comment         ctermfg=242     ctermbg=none    cterm=none

hi Special         ctermfg=141     ctermbg=none    cterm=bold
hi SpecialChar     ctermfg=197     ctermbg=none    cterm=bold
hi Tag             ctermfg=197     ctermbg=none    cterm=none
hi Delimiter       ctermfg=197     ctermbg=none    cterm=none
hi SpecialComment  ctermfg=81      ctermbg=none    cterm=none
hi Debug           ctermfg=141     ctermbg=none    cterm=bold

" ----------
" - C like -
" ----------
hi PreProc         ctermfg=148     ctermbg=none    cterm=underline
hi Include         ctermfg=197     ctermbg=none    cterm=none
hi Define          ctermfg=197     ctermbg=none    cterm=none
hi Macro           ctermfg=148     ctermbg=none    cterm=none
hi PreCondit       ctermfg=148     ctermbg=none    cterm=none

hi Type            ctermfg=81      ctermbg=none    cterm=underline
hi StorageClass    ctermfg=197     ctermbg=none    cterm=none
hi Structure       ctermfg=81      ctermbg=none    cterm=none
hi Typedef         ctermfg=81      ctermbg=none    cterm=none





" ----------
" - Miscellaneous -
" ----------

hi link EndOfBuffer NonText
hi cDefine          ctermfg=148    ctermbg=none    cterm=none      guifg=#A6E22D
hi cInclude         ctermfg=148    ctermbg=none    cterm=none      guifg=#A6E22D
hi cLabel           ctermfg=167    ctermbg=none    cterm=none      guifg=#F92772
hi Conceal          ctermfg=7      ctermbg=242     cterm=none      guifg=LightGrey   guibg=DarkGrey
hi ExtraWhitespace  ctermfg=none   ctermbg=1       cterm=none      guibg=#382424
hi SpellBad         ctermfg=none   ctermbg=9       cterm=reverse   gui=undercurl     guisp=Red
hi SpellCap         ctermfg=none   ctermbg=12      cterm=reverse   gui=undercurl     guisp=Blue
hi SpellLocal       ctermfg=none   ctermbg=14      cterm=underline gui=undercurl     guisp=Cyan
hi SpellRare        ctermfg=none   ctermbg=13      cterm=reverse   gui=undercurl     guisp=Magenta

"
" CSS
"
hi cssBraces         ctermfg=252   ctermbg=none   cterm=none   guifg=#E8E8E3
hi cssClassName      ctermfg=148   ctermbg=none   cterm=none   guifg=#A6E22D
hi cssClassNameDot   ctermfg=197   ctermbg=none   cterm=none   guifg=#F92772
hi cssColor          ctermfg=141   ctermbg=none   cterm=none   guifg=#ae81ff
hi cssCommonAttr     ctermfg=197   ctermbg=none   cterm=none   guifg=#F92772
hi cssFunctionName   ctermfg=81    ctermbg=none   cterm=none   guifg=#66d9ef
hi cssProp           ctermfg=186   ctermbg=none   cterm=none   guifg=#E6DB74
hi cssPseudoClassId  ctermfg=141   ctermbg=none   cterm=none   guifg=#ae81ff
hi cssUIAttr         ctermfg=186   ctermbg=none   cterm=none   guifg=#E6DB74
hi cssURL            ctermfg=208   ctermbg=none   cterm=underline gui=underline,italic guifg=#FD9720
hi cssValueLength    ctermfg=141   ctermbg=none   guifg=#ae81ff

hi cStorageClass     ctermfg=197   ctermbg=none   cterm=none      guifg=#F92772
hi cStructure        ctermfg=197   ctermbg=none   cterm=none      guifg=#F92772

hi DiffAdd           ctermfg=193   ctermbg=65     cterm=bold      guifg=#d7ffaf    guibg=#5f875f
hi DiffChange        ctermfg=189   ctermbg=60     cterm=bold      guifg=#d7d7ff    guibg=#5f5f87
hi DiffDelete        ctermfg=234   ctermbg=167    cterm=bold      guifg=#272822    guibg=#f75f5f
hi DiffText          ctermfg=234   ctermbg=81     cterm=reverse   guifg=#272822    guibg=#66d9ef

" hi erubyDelimiter  cleared
hi erubyRailsMethod  ctermfg=81  ctermbg=none     cterm=none      guifg=#66d9ef

hi htmlArg           ctermfg=148 ctermbg=none     cterm=none      guifg=#A6E22D
hi htmlEndTag        ctermfg=252 ctermbg=none     cterm=none      guifg=#E8E8E3
hi htmlSpecialChar   ctermfg=141 ctermbg=none     cterm=none      guifg=#ae81ff
hi htmlTag           ctermfg=252 ctermbg=none     cterm=none      guifg=#E8E8E3
hi htmlTagName       ctermfg=197 ctermbg=none     cterm=none      guifg=#F92772

hi jsArgsObj        ctermfg=81   ctermbg=none     cterm=none      guifg=#66d9ef
hi jsBuiltins       ctermfg=81   ctermbg=none     cterm=none      guifg=#66d9ef
hi jsDocTags        ctermfg=81   ctermbg=none     cterm=none      gui=italic guifg=#66d9ef
hi jsExceptions     ctermfg=81   ctermbg=none     cterm=none      guifg=#66d9ef
hi jsFuncArgRest    ctermfg=141  ctermbg=none     cterm=none      gui=italic guifg=#ae81ff
hi jsFuncArgs       ctermfg=208  ctermbg=none     cterm=none      gui=italic guifg=#FD9720
hi jsFuncName       ctermfg=148  ctermbg=none     cterm=none      guifg=#A6E22D
hi jsFunctionKey    ctermfg=148  ctermbg=none     cterm=none      guifg=#A6E22D
hi jsFutureKeys     ctermfg=81   ctermbg=none     cterm=none      guifg=#66d9ef
hi jsPrototype      ctermfg=81   ctermbg=none     cterm=none      guifg=#66d9ef
hi jsStatic         ctermfg=81   ctermbg=none     cterm=none      guifg=#66d9ef
hi jsStorageClass   ctermfg=81   ctermbg=none     cterm=none      guifg=#66d9ef
hi jsSuper          ctermfg=81   ctermbg=none     cterm=none      guifg=#66d9ef
hi jsThis           ctermfg=197  ctermbg=none     cterm=none      guifg=#F92772

hi lessVariable     ctermfg=148  ctermbg=none     cterm=none      guifg=#A6E22D

hi link luaBuiltIn       Special
hi link luaComment       Comment
hi link luaCommentLong   luaComment
hi link luaCommentTodo   Todo
hi link luaCond          Conditional
hi link luaConstant      Boolean
hi link luaDocTag        Underlined
hi link luaEllipsis      StorageClass
hi link luaElse          Conditional
hi link luaError         Error
hi link luaFloat         Float
hi link luaFuncArgName   Noise
hi link luaFuncCall      luaFuncName
hi link luaFuncId        luaFuncName
hi link luaFuncParens    Noise
hi link luaFuncTable     luaFuncName
hi link luaGoto          luaStatement
hi link luaGotoLabel     Noise
hi link luaIn            Repeat
hi link luaLabel         Label
hi link luaNumber        Number
hi link luaOperator      Operator
hi link luaParens        Noise
hi link luaRepeat        Repeat
hi link luaSpecialTable  luaFuncName
hi link luaSpecialValue  luaFuncName
hi link luaStatement     Statement
hi link luaString        String
hi link luaStringLong    luaString
hi link luaStringSpecial SpecialChar
hi link luaTable         Structure
hi luaBraces             ctermfg=197     ctermbg=none    cterm=none
hi luaBrackets           ctermfg=197     ctermbg=none    cterm=none
hi luaCommentLongTag     ctermfg=240     ctermbg=none    cterm=none
hi luaFunc               ctermfg=197     ctermbg=none    cterm=none
hi luaFuncKeyword        ctermfg=197     ctermbg=none    cterm=none
hi luaFuncName           ctermfg=81      ctermbg=none    cterm=none
hi luaLocal              ctermfg=197     ctermbg=none    cterm=none
hi luaSemiCol            ctermfg=7       ctermbg=none    cterm=none
"  hi                luaBlock         cleared
"  hi                luaBracket       cleared
"  hi                luaComma         cleared
"  hi                luaElseifThen    cleared
"  hi                luaFuncArgComma  cleared
"  hi                luaFuncArgs      cleared
"  hi                luaFuncSig       cleared
"  hi                luaIfThen        cleared
"  hi                luaLoop          cleared
"  hi                luaNoise         cleared
"  hi                luaParen         cleared
"  hi                luaStringLongTag cleared
"  hi                luaThenEnd       cleared

hi Pmenu           ctermfg=235    ctermbg=252      cterm=none         guifg=#2D2E27 guibg=#E8E8E3
hi PmenuSbar       ctermfg=none   ctermbg=248      cterm=none         guibg=Grey
hi PmenuSel        ctermfg=81     ctermbg=234      cterm=bold,reverse gui=bold,reverse guifg=#66d9ef guibg=#272822
hi PmenuThumb      ctermfg=235    ctermbg=243      cterm=none         guifg=#2D2E27 guibg=#8F908A

hi link rubyClassVariable          rubyIdentifier
hi link rubyGlobalVariable         rubyIdentifier
hi link rubyInstanceVariable       rubyIdentifier
hi link rubyInterpolationDelimiter Delimiter
hi link rubyPseudoVariable         Constant
hi rubyBlockArgument            ctermfg=208     ctermbg=none     cterm=none     guifg=#FD9720
hi rubyBlockParameter           ctermfg=208     ctermbg=none     cterm=none     guifg=#FD9720
hi rubyClass                    ctermfg=197     ctermbg=none     cterm=none     guifg=#F92772
hi rubyConstant                 ctermfg=81      ctermbg=none     cterm=none     guifg=#66d9ef
hi rubyControl                  ctermfg=197     ctermbg=none     cterm=none     guifg=#F92772
hi rubyDefine                   ctermfg=197     ctermbg=none     cterm=none     guifg=#F92772
hi rubyEscape                   ctermfg=141     ctermbg=none     cterm=none     guifg=#ae81ff
hi rubyException                ctermfg=197     ctermbg=none     cterm=none     guifg=#F92772
hi rubyFunction                 ctermfg=148     ctermbg=none     cterm=none     guifg=#A6E22D
hi rubyInclude                  ctermfg=197     ctermbg=none     cterm=none     guifg=#F92772
hi rubyOperator                 ctermfg=197     ctermbg=none     cterm=none     guifg=#F92772
hi rubyRailsARAssociationMethod ctermfg=208     ctermbg=none     cterm=none     guifg=#FD9720
hi rubyRailsARMethod            ctermfg=208     ctermbg=none     cterm=none     guifg=#FD9720
hi rubyRailsMethod              ctermfg=208     ctermbg=none     cterm=none     guifg=#FD9720
hi rubyRailsRenderMethod        ctermfg=208     ctermbg=none     cterm=none     guifg=#FD9720
hi rubyRegexp                   ctermfg=186     ctermbg=none     cterm=none     guifg=#E6DB74
hi rubyRegexpDelimiter          ctermfg=186     ctermbg=none     cterm=none     guifg=#E6DB74
hi rubyStringDelimiter          ctermfg=186     ctermbg=none     cterm=none     guifg=#E6DB74
hi rubySymbol                   ctermfg=141     ctermbg=none     cterm=none     guifg=#ae81ff

hi xmlAttrib                    ctermfg=148     ctermbg=none     cterm=none     guifg=#A6E22D
hi xmlEndTag                    ctermfg=197     ctermbg=none     cterm=none     guifg=#F92772
hi xmlTag                       ctermfg=197     ctermbg=none     cterm=none     guifg=#F92772
hi xmlTagName                   ctermfg=208     ctermbg=none     cterm=none     guifg=#FD9720



"
" Vim
"

hi vimOption            ctermfg=141     ctermbg=none    cterm=none
hi vimSynType           ctermfg=81      ctermbg=none    cterm=none
