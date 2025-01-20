nnoremap <buffer> <Leader>Ft :TableFormat<CR>
nnoremap <buffer> <Leader>Fp :MarkdownPreviewToggle<CR>

setlocal noautoindent
setlocal smartindent
setlocal colorcolumn=0
setlocal linebreak
setlocal nonumber
setlocal norelativenumber
setlocal shiftwidth=4 
setlocal nospell
setlocal tabstop=4
setlocal softtabstop=4
setlocal expandtab
setlocal wrap
setlocal nolist
setlocal textwidth=0
setlocal showbreak=
" syn clear htmlH1
" syn clear htmlH2
" syn clear htmlH3
" syn clear htmlH4
" syn clear htmlH5
" syn clear htmlH6
" syn region htmlH1 matchgroup=mkdHeading start=/^\s*#[^@]/ end=/$/ contains=mkdLink,mkdInlineURL,@Spell
" syn region htmlH2 matchgroup=mkdHeading start=/^\s*##[^@]/ end=/$/ contains=mkdLink,mkdInlineURL,@Spell
" syn region htmlH3 matchgroup=mkdHeading start=/^\s*###[^@]/ end=/$/ contains=mkdLink,mkdInlineURL,@Spell
" syn region htmlH4 matchgroup=mkdHeading start=/^\s*####[^@]/ end=/$/ contains=mkdLink,mkdInlineURL,@Spell
" syn region htmlH5 matchgroup=mkdHeading start=/^\s*#####[^@]/ end=/$/ contains=mkdLink,mkdInlineURL,@Spell
" syn region htmlH6 matchgroup=mkdHeading start=/^\s*######[^@]/ end=/$/ contains=mkdLink,mkdInlineURL,@Spell
" syn region htmlH1alt matchgroup=mkdHeading start=/^\s*#@/ end=/$/ contains=mkdLink,mkdInlineURL,@Spell containedin=mkdNonListItemBlock concealends
" syn region htmlH2alt matchgroup=mkdHeading start=/^\s*##@/ end=/$/ contains=mkdLink,mkdInlineURL,@Spell containedin=mkdNonListItemBlock concealends
" syn region htmlH3alt matchgroup=mkdHeading start=/^\s*###@/ end=/$/ contains=mkdLink,mkdInlineURL,@Spell containedin=mkdNonListItemBlock concealends
" syn region htmlH4alt matchgroup=mkdHeading start=/^\s*####@/ end=/$/ contains=mkdLink,mkdInlineURL,@Spell containedin=mkdNonListItemBlock concealends
" syn region htmlH5alt matchgroup=mkdHeading start=/^\s*#####@/ end=/$/ contains=mkdLink,mkdInlineURL,@Spell containedin=mkdNonListItemBlock concealends
" syn region htmlH6alt matchgroup=mkdHeading start=/^\s*#######@/ end=/$/ contains=mkdLink,mkdInlineURL,@Spell containedin=mkdNonListItemBlock concealends
