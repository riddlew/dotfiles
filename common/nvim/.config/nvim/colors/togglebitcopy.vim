set t_Co=256
set bg=dark
hi clear
if exists("syntax_on")
	syntax reset
endif
let g:colors_name = "togglebitcopy"

function! s:create_color(group, fg, bg, gg, guisp)
    let l:str = [
        \ 'highlight', a:group,
        \ 'guifg=', a:fg[0],
        \ 'guibg=', a:bg[0],
        \ 'guisp=', a:guisp,
        \ 'gui=', a:gg,
        \ 'ctermfg=', a:fg[1],
        \ 'ctermbg=', a:bg[1],
        \ 'cterm=', a:gg
    \]
    execute join(l:str, ' ')
endfunction


"    \"comment":    ["#91d0c6", 234],
"    \"yellow":     ["#f6d07a", 238],
"    \"green":      ["#6dfba5", 4],
let s:tb_colors = {
    \"bg_none":    ["NONE", 234],
    \"fg_none":    ["NONE", 234],
    \"bg":         ["#1c1f20", 15],
    \"white":      ["#ffffff", 231],
    \"comment":    ["#597c9e", 234],
    \"purple":     ["#dfa6ff", 234],
    \"red":        ["#ff8187", 234],
    \"blue":       ["#4ee4fe", 234],
    \"green":      ["#b7e45d", 4],
    \"yellow":     ["#FFCC5C", 238],
    \"cursorline": ["#2a2f31", 231],
    \"gray":       ["#c5c7c9", 234],
    \"gray2":      ["#525354", 234],
    \"vert":       ["#2c323d", 234],
    \"quickfix":   ["#ff00e1", 234],
    \"pmenu_bg":   ["#2c3133", 234],
\}
"    \"green2":     ["#74d59a", 234],

" misc
call s:create_color("ColorColumn",  s:tb_colors["white"],   s:tb_colors["bg_none"],    "NONE", "NONE")
call s:create_color("Conceal",      s:tb_colors["white"],   s:tb_colors["bg_none"],    "NONE", "NONE")
call s:create_color("Cursor",       s:tb_colors["bg"],      s:tb_colors["gray"],       "NONE", "NONE")
call s:create_color("lCursor",      s:tb_colors["white"],   s:tb_colors["bg_none"],    "NONE", "NONE")
call s:create_color("CursorIM",     s:tb_colors["white"],   s:tb_colors["bg_none"],    "NONE", "NONE")
call s:create_color("CursorColumn", s:tb_colors["white"],   s:tb_colors["bg_none"],    "NONE", "NONE")
call s:create_color("CursorLine",   s:tb_colors["fg_none"], s:tb_colors["cursorline"], "NONE", "NONE")
call s:create_color("Directory",    s:tb_colors["white"],   s:tb_colors["bg_none"],    "NONE", "NONE")
call s:create_color("DiffAdd",      s:tb_colors["bg"],      s:tb_colors["green"],      "NONE", "NONE")

"hi LineNrAbove      guisp=NONE guifg=#ffffff guibg=NONE ctermfg=231 ctermbg=234 gui=NONE cterm=NONE
"hi LineNrBelow      guisp=NONE guifg=#ffffff guibg=NONE ctermfg=231 ctermbg=234 gui=NONE cterm=NONE
call s:create_color("DiffChange",  s:tb_colors["bg"],      s:tb_colors["yellow"],  "NONE", "NONE")
call s:create_color("DiffDelete",  s:tb_colors["bg"],      s:tb_colors["red"],     "NONE", "NONE")
call s:create_color("DiffText",    s:tb_colors["yellow"],  s:tb_colors["bg_none"], "NONE", "NONE")
call s:create_color("EndOfBuffer", s:tb_colors["bg"],      s:tb_colors["bg_none"], "NONE", "NONE")
call s:create_color("ErrorMsg",    s:tb_colors["bg"],      s:tb_colors["red"],     "bold", "NONE")
call s:create_color("VertSplit",   s:tb_colors["fg_none"], s:tb_colors["vert"],    "NONE", "NONE")
call s:create_color("Folded",      s:tb_colors["comment"], s:tb_colors["bg_none"], "NONE", "NONE")
call s:create_color("FoldColumn",  s:tb_colors["white"],   s:tb_colors["bg_none"], "NONE", "NONE")
call s:create_color("SignColumn",  s:tb_colors["white"],   s:tb_colors["bg_none"], "NONE", "NONE")
call s:create_color("IncSearch",   s:tb_colors["bg"],      s:tb_colors["white"],   "NONE", "NONE")
call s:create_color("LineNr",      s:tb_colors["gray2"],   s:tb_colors["bg_none"], "NONE", "NONE")

call s:create_color("CursorLineNr", s:tb_colors["white"],    s:tb_colors["bg_none"],  "NONE",           "NONE")
call s:create_color("MatchParen",   s:tb_colors["fg_none"],  s:tb_colors["bg_none"],  "bold,underline", "NONE")
call s:create_color("ModeMsg",      s:tb_colors["white"],    s:tb_colors["bg_none"],  "NONE",           "NONE")
call s:create_color("MoreMsg",      s:tb_colors["white"],    s:tb_colors["bg_none"],  "NONE",           "NONE")
call s:create_color("NonText",      s:tb_colors["gray2"],    s:tb_colors["bg_none"],  "NONE",           "NONE")
call s:create_color("Pmenu",        s:tb_colors["white"],    s:tb_colors["pmenu_bg"], "NONE",           "NONE")
call s:create_color("PmenuSel",     s:tb_colors["blue"],     s:tb_colors["bg_none"],  "NONE",           "NONE")
call s:create_color("PmenuSbar",    s:tb_colors["white"],    s:tb_colors["bg_none"],  "NONE",           "NONE")
call s:create_color("PmenuThumb",   s:tb_colors["white"],    s:tb_colors["gray2"],    "NONE",           "NONE")
call s:create_color("Question",     s:tb_colors["green"],    s:tb_colors["bg_none"],  "NONE",           "NONE")
call s:create_color("QuickFixLine", s:tb_colors["quickfix"], s:tb_colors["bg_none"],  "NONE",           "NONE")
call s:create_color("Search",       s:tb_colors["bg"],       s:tb_colors["yellow"],   "NONE",           "NONE")
call s:create_color("SpecialKey",   s:tb_colors["quickfix"], s:tb_colors["bg_none"],  "NONE",           "NONE")
call s:create_color("SpellBad",     s:tb_colors["quickfix"], s:tb_colors["bg_none"],  "NONE",           "NONE")
call s:create_color("SpellCap",     s:tb_colors["quickfix"], s:tb_colors["bg_none"],  "NONE",           "NONE")
call s:create_color("SpellLocal",   s:tb_colors["quickfix"], s:tb_colors["bg_none"],  "NONE",           "NONE")
call s:create_color("SpellRare",    s:tb_colors["quickfix"], s:tb_colors["bg_none"],  "NONE",           "NONE")


"hi StatusLine       guisp=NONE guifg=#ffffff guibg=NONE ctermfg=6   ctermbg=0   gui=NONE cterm=NONE
"hi StatusLineNC     guisp=NONE guifg=#ffffff guibg=NONE ctermfg=236 ctermbg=7   gui=NONE cterm=NONE
"hi StatusLineTerm   guisp=NONE guifg=#ffffff guibg=NONE ctermfg=231 ctermbg=234 gui=NONE cterm=NONE
"hi StatusLineTermNC guisp=NONE guifg=#ffffff guibg=NONE ctermfg=231 ctermbg=234 gui=NONE cterm=NONE
"hi TabLine          guisp=NONE guifg=#ffffff guibg=NONE ctermfg=231 ctermbg=234 gui=NONE cterm=NONE
"hi TabLineFill      guisp=NONE guifg=#ffffff guibg=NONE ctermfg=231 ctermbg=234 gui=NONE cterm=NONE
"hi TabLineSel       guisp=NONE guifg=#ffffff guibg=NONE ctermfg=231 ctermbg=234 gui=NONE cterm=NONE
"hi Terminal         guisp=NONE guifg=#ffffff guibg=NONE ctermfg=231 ctermbg=234 gui=NONE cterm=NONE
call s:create_color("Title",      s:tb_colors["yellow"],   s:tb_colors["bg_none"], "NONE", "NONE")
call s:create_color("Visual",     s:tb_colors["bg"],       s:tb_colors["blue"],    "NONE", "NONE")
call s:create_color("VisualNOS",  s:tb_colors["bg"],       s:tb_colors["blue"],    "NONE", "NONE")
call s:create_color("WarningMsg", s:tb_colors["bg"],       s:tb_colors["yellow"],  "bold", "NONE")
call s:create_color("WildMenu",   s:tb_colors["quickfix"], s:tb_colors["bg_none"], "NONE", "NONE")


" major
call s:create_color("Normal",     s:tb_colors["white"],   s:tb_colors["bg"],      "NONE",      "NONE")
call s:create_color("Comment",    s:tb_colors["comment"], s:tb_colors["bg_none"], "NONE",      "NONE")
"call s:create_color("Constant",   s:tb_colors["purple"],  s:tb_colors["bg_none"], "NONE",      "NONE")
call s:create_color("Constant",   s:tb_colors["red"],  s:tb_colors["bg_none"], "NONE",      "NONE")
"call s:create_color("Identifier", s:tb_colors["green"],   s:tb_colors["bg_none"], "NONE",      "NONE")
call s:create_color("Identifier", s:tb_colors["purple"],   s:tb_colors["bg_none"], "NONE",      "NONE")
"call s:create_color("Statement",  s:tb_colors["yellow"],  s:tb_colors["bg_none"], "NONE",      "NONE")
call s:create_color("Statement",  s:tb_colors["yellow"],  s:tb_colors["bg_none"], "NONE",      "NONE")
call s:create_color("PreProc",    s:tb_colors["blue"],    s:tb_colors["bg_none"], "NONE",      "NONE")
"call s:create_color("Type",       s:tb_colors["green"],   s:tb_colors["bg_none"], "NONE",      "NONE")
call s:create_color("Type",       s:tb_colors["purple"],   s:tb_colors["bg_none"], "NONE",      "NONE")
call s:create_color("Special",    s:tb_colors["red"],     s:tb_colors["bg_none"], "NONE",      "NONE")
call s:create_color("Underlined", s:tb_colors["white"],   s:tb_colors["bg_none"], "underline", "NONE")
call s:create_color("Ignore",     s:tb_colors["white"],   s:tb_colors["bg_none"], "NONE",      "NONE")
call s:create_color("Error",      s:tb_colors["red"],     s:tb_colors["bg_none"], "underline", "NONE")
call s:create_color("Todo",       s:tb_colors["yellow"],  s:tb_colors["bg_none"], "bold",      "NONE")


" minor
"call s:create_color("String",         s:tb_colors["purple"],   s:tb_colors["bg_none"], "NONE", "NONE")
call s:create_color("String",         s:tb_colors["green"],   s:tb_colors["bg_none"], "NONE", "NONE")
call s:create_color("Character",      s:tb_colors["red"],      s:tb_colors["bg_none"], "NONE", "NONE")
call s:create_color("Number",         s:tb_colors["blue"],     s:tb_colors["bg_none"], "NONE", "NONE")
call s:create_color("Boolean",        s:tb_colors["red"],      s:tb_colors["bg_none"], "NONE", "NONE")
call s:create_color("Float",          s:tb_colors["blue"],     s:tb_colors["bg_none"], "NONE", "NONE")
"call s:create_color("Function",       s:tb_colors["green2"],   s:tb_colors["bg_none"], "bold", "NONE")
"call s:create_color("Function",       s:tb_colors["green"],   s:tb_colors["bg_none"],  "bold", "NONE")
"call s:create_color("Function",       s:tb_colors["green"],   s:tb_colors["bg_none"],  "NONE", "NONE")
call s:create_color("Function",       s:tb_colors["yellow"],   s:tb_colors["bg_none"],  "NONE", "NONE")
"call s:create_color("Conditional",    s:tb_colors["yellow"],   s:tb_colors["bg_none"], "NONE", "NONE")
call s:create_color("Conditional",    s:tb_colors["purple"],   s:tb_colors["bg_none"], "NONE", "NONE")
"call s:create_color("Repeat",         s:tb_colors["yellow"],   s:tb_colors["bg_none"], "NONE", "NONE")
call s:create_color("Repeat",         s:tb_colors["yellow"],   s:tb_colors["bg_none"], "NONE", "NONE")
"call s:create_color("Label",          s:tb_colors["yellow"],   s:tb_colors["bg_none"], "bold", "NONE")
call s:create_color("Label",          s:tb_colors["yellow"],   s:tb_colors["bg_none"], "NONE", "NONE")
"call s:create_color("Operator",       s:tb_colors["yellow"],   s:tb_colors["bg_none"], "bold", "NONE")
call s:create_color("Operator",       s:tb_colors["yellow"],   s:tb_colors["bg_none"], "bold", "NONE")
"call s:create_color("Keyword",        s:tb_colors["yellow"],   s:tb_colors["bg_none"], "NONE", "NONE")
call s:create_color("Keyword",        s:tb_colors["yellow"],   s:tb_colors["bg_none"], "NONE", "NONE")
"call s:create_color("Exception",      s:tb_colors["yellow"],   s:tb_colors["bg_none"], "NONE", "NONE")
call s:create_color("Exception",      s:tb_colors["yellow"],   s:tb_colors["bg_none"], "NONE", "NONE")
call s:create_color("Include",        s:tb_colors["blue"],     s:tb_colors["bg_none"], "NONE", "NONE")
call s:create_color("Define",         s:tb_colors["blue"],     s:tb_colors["bg_none"], "NONE", "NONE")
call s:create_color("Macro",          s:tb_colors["blue"],     s:tb_colors["bg_none"], "NONE", "NONE")
call s:create_color("PreCondit",      s:tb_colors["blue"],     s:tb_colors["bg_none"], "NONE", "NONE")
call s:create_color("StorageClass",   s:tb_colors["red"],      s:tb_colors["bg_none"], "NONE", "NONE")
"call s:create_color("Structure",      s:tb_colors["green"],    s:tb_colors["bg_none"], "NONE", "NONE")
call s:create_color("Structure",      s:tb_colors["purple"],    s:tb_colors["bg_none"], "NONE", "NONE")
"call s:create_color("Typedef",        s:tb_colors["green"],    s:tb_colors["bg_none"], "NONE", "NONE")
call s:create_color("Typedef",        s:tb_colors["purple"],    s:tb_colors["bg_none"], "NONE", "NONE")
call s:create_color("SpecialChar",    s:tb_colors["red"],      s:tb_colors["bg_none"], "NONE", "NONE")
call s:create_color("Tag",            s:tb_colors["white"],    s:tb_colors["bg_none"], "NONE", "NONE")
call s:create_color("Delimiter",      s:tb_colors["white"],    s:tb_colors["bg_none"], "NONE", "NONE")
call s:create_color("SpecialComment", s:tb_colors["comment"],  s:tb_colors["bg_none"], "bold", "NONE")
call s:create_color("Debug",          s:tb_colors["quickfix"], s:tb_colors["bg_none"], "NONE", "NONE")

" other
call s:create_color("lspReference",  s:tb_colors["quickfix"], s:tb_colors["bg_none"], "NONE", "NONE")
call s:create_color("StatusError",   s:tb_colors["bg"],       s:tb_colors["red"],     "bold", "NONE")
call s:create_color("StatusWarning", s:tb_colors["bg"],       s:tb_colors["yellow"],  "bold", "NONE")

" markdown
call s:create_color("mkdBold",        s:tb_colors["yellow"],  s:tb_colors["bg_none"], "bold",      "NONE")
call s:create_color("htmlBold",       s:tb_colors["yellow"],  s:tb_colors["bg_none"], "bold",      "NONE")
call s:create_color("mkdItalic",      s:tb_colors["blue"],    s:tb_colors["bg_none"], "italic",    "NONE")
call s:create_color("htmlItalic",     s:tb_colors["blue"],    s:tb_colors["bg_none"], "italic",    "NONE")
call s:create_color("htmlBoldItalic", s:tb_colors["red"],     s:tb_colors["bg_none"], "italic",    "NONE")
call s:create_color("mkdLineBreak",   s:tb_colors["fg_none"], s:tb_colors["bg_none"], "NONE",      "NONE")
call s:create_color("htmlH1",         s:tb_colors["purple"],  s:tb_colors["bg_none"], "bold",      "NONE")
call s:create_color("htmlH2",         s:tb_colors["purple"],  s:tb_colors["bg_none"], "bold",      "NONE")
call s:create_color("htmlH3",         s:tb_colors["purple"],  s:tb_colors["bg_none"], "bold",      "NONE")
call s:create_color("htmlH4",         s:tb_colors["purple"],  s:tb_colors["bg_none"], "bold",      "NONE")
call s:create_color("htmlH5",         s:tb_colors["purple"],  s:tb_colors["bg_none"], "bold",      "NONE")
call s:create_color("htmlH6",         s:tb_colors["purple"],  s:tb_colors["bg_none"], "bold",      "NONE")
call s:create_color("mkdHeading",     s:tb_colors["purple"],  s:tb_colors["bg_none"], "bold",      "NONE")
call s:create_color("mkdLink",        s:tb_colors["blue"],    s:tb_colors["bg_none"], "underline", "NONE")
call s:create_color("htmlLink",       s:tb_colors["blue"],    s:tb_colors["bg_none"], "underline", "NONE")
call s:create_color("mkdURL",         s:tb_colors["blue"],    s:tb_colors["bg_none"], "underline", "NONE")

" lsp
call s:create_color("LspDiagnosticsDefaultHint",        s:tb_colors["yellow"], s:tb_colors["bg_none"], "NONE", "NONE")
call s:create_color("LspDiagnosticsDefaultError",       s:tb_colors["red"],    s:tb_colors["bg_none"], "NONE", "NONE")
call s:create_color("LspDiagnosticsDefaultWarning",     s:tb_colors["yellow"], s:tb_colors["bg_none"], "NONE", "NONE")
call s:create_color("LspDiagnosticsDefaultInformation", s:tb_colors["blue"],   s:tb_colors["bg_none"], "NONE", "NONE")

"Git Gutter
call s:create_color("GitGutterAdd",          s:tb_colors["bg"], s:tb_colors["green"],  "NONE", "NONE")
call s:create_color("GitGutterDelete",       s:tb_colors["bg"], s:tb_colors["red"],    "NONE", "NONE")
call s:create_color("GitGutterChangeDelete", s:tb_colors["bg"], s:tb_colors["yellow"], "NONE", "NONE")
call s:create_color("diffAdded",             s:tb_colors["bg"], s:tb_colors["green"],  "NONE", "NONE")
call s:create_color("diffRemoved",           s:tb_colors["bg"], s:tb_colors["red"],    "NONE", "NONE")
