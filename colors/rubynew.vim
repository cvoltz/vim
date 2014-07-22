" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Based on rubyblue.vim

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "rubynew"
hi Normal		guifg=lightGray   guibg=black
hi NonText		guifg=darkGray
hi comment		guifg=lightBlue
hi constant		guifg=lightGreen
hi identifier	guifg=white
hi statement	guifg=yellow
hi preproc		guifg=yellow
hi type			guifg=white
hi special		guifg=lightGreen
hi Underlined	guifg=lightBlue
hi Underlined	gui=underline

hi ErrorMsg		guifg=black       guibg=red
hi WarningMsg	guifg=cyan
hi ModeMsg		guifg=yellow
hi MoreMsg		guifg=yellow
hi Error		guifg=white       guibg=red

hi Todo			guifg=black       guibg=yellow
hi Cursor		guifg=black       guibg=white
hi Search		guifg=black       guibg=yellow
hi IncSearch	guifg=black       guibg=yellow
hi LineNr		guifg=lightMagenta
hi title		gui=bold

hi StatusLineNC	guifg=gray        guibg=darkBlue
hi StatusLine	guifg=white        guibg=lightBlue

hi label		guifg=yellow
hi operator		guifg=yellow
hi clear Visual
hi Visual		term=reverse
hi Visual		guifg=black       guibg=yellow

hi DiffChange	guibg=darkGreen	guifg=black
hi DiffText		guibg=lightGreen	guifg=black
hi DiffAdd		guibg=blue		guifg=black
hi DiffDelete	guibg=cyan		guifg=black

hi Folded		guibg=yellow		guifg=black
hi FoldColumn	guibg=gray		guifg=black
