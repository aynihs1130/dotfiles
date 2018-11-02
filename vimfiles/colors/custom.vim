" Vim color file
" Maintainer:   A. Sinan Unur
" Last Change:  2001/10/04
" Dark color scheme
hi clear
set background=Dark
if exists("syntax_on")
  syntax reset
endif
let g:colors_name="custom"
" Console Color Scheme
hi Normal       term=NONE cterm=NONE ctermfg=LightGray   ctermbg=Black
hi NonText      term=NONE cterm=NONE ctermfg=Brown       ctermbg=Black
hi Function     term=NONE cterm=NONE ctermfg=DarkCyan    ctermbg=Black
hi Statement    term=BOLD cterm=BOLD ctermfg=DarkBlue    ctermbg=Black
hi Special      term=NONE cterm=NONE ctermfg=DarkGreen   ctermbg=Black
hi SpecialChar  term=NONE cterm=NONE ctermfg=Cyan        ctermbg=Black
hi Constant     term=NONE cterm=NONE ctermfg=Blue        ctermbg=Black
hi Comment      term=NONE cterm=NONE ctermfg=DarkGray    ctermbg=Black
hi Preproc      term=NONE cterm=NONE ctermfg=DarkGreen   ctermbg=Black
hi Type         term=NONE cterm=NONE ctermfg=DarkMagenta ctermbg=Black
hi Identifier   term=NONE cterm=NONE ctermfg=Cyan        ctermbg=Black
hi StatusLine   term=BOLD cterm=NONE ctermfg=Yellow      ctermbg=DarkBlue
hi StatusLineNC term=NONE cterm=NONE ctermfg=Black       ctermbg=Gray
hi Visual       term=NONE cterm=NONE ctermfg=White       ctermbg=DarkCyan
hi Search       term=NONE cterm=NONE ctermbg=Cyan      ctermfg=DarkBlue
hi VertSplit    term=NONE cterm=NONE ctermfg=Black       ctermbg=Gray
hi Directory    term=NONE cterm=NONE ctermfg=Green       ctermbg=Black
hi WarningMsg   term=NONE cterm=NONE ctermfg=Blue        ctermbg=Yellow
hi Error        term=NONE cterm=NONE ctermfg=DarkRed     ctermbg=Gray
hi Cursor                            ctermfg=Black       ctermbg=Cyan
hi LineNr       term=NONE cterm=NONE ctermfg=Red         ctermbg=Black
" GUI Color Scheme010621
hi Normal       gui=NONE     guifg=White   guibg=#010621
hi NonText      gui=NONE     guifg=#ff9999 guibg=#010621
hi Function     gui=NONE     guifg=#7788ff guibg=#010621
hi Statement    gui=BOLD     guifg=#ffcc33 guibg=#010621
hi Special      gui=NONE     guifg=Cyan    guibg=#010621
hi Constant     gui=NONE     guifg=#ccff00 guibg=#010621
hi Comment      gui=NONE     guifg=#66cc99 guibg=#010621
hi Preproc      gui=NONE     guifg=#33ff66 guibg=#010621
hi Type         gui=NONE     guifg=#ff5579 guibg=#010621
hi Identifier   gui=NONE     guifg=Cyan    guibg=#110024
hi StatusLine   gui=BOLD     guifg=White   guibg=#990033
hi StatusLineNC gui=NONE     guifg=Black   guibg=#cccccc
hi Visual       gui=NONE     guifg=White   guibg=#00aa33
hi Search       gui=BOLD     guibg=#00ff99 guifg=DarkBlue
hi VertSplit    gui=NONE     guifg=White   guibg=#666666
hi Directory    gui=NONE     guifg=Green   guibg=#010621
hi WarningMsg   gui=STANDOUT guifg=#ff00cc guibg=Yellow
hi Error        gui=NONE     guifg=White   guibg=Red
hi Cursor                    guifg=White   guibg=#cc0099
hi LineNr       gui=NONE     guifg=#cccccc guibg=#002255
hi ModeMsg      gui=NONE     guifg=Blue    guibg=White
hi Question     gui=NONE     guifg=#66ff99 guibg=#010621
hi CursorLine   gui=underline              guibg=#222222
hi Underlined                guifg=#3366ff guibg=#010621
hi onEvent                   guifg=#ff33ff guibg=#010621
hi SpecialKey                guifg=#333335 guibg=#010621
hi ajaxProp                  guifg=#cc2244 guibg=#010621
hi jsHandle                  guifg=#40e0d0 guibg=#010621
hi jsV                       guifg=#ff0099 guibg=#010621
hi DOM                       guifg=#00ff99 guibg=#010621
hi html5                     guifg=#666600 guibg=#010621
hi Pmenu                     guifg=#ffffff guibg=#660033
hi PmenuSel                  guifg=#ffffff guibg=#330066
