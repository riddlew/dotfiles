if exists("b:current_syntax")
	finish
endif


syn match mkdListItem /^\s*\%([A-Za-z]\+\.\)\ze\s\+/

" syn match mkdCustListItem "\-\s" conceal cchar=●
"syn match mkdCustListItem "^\s*\%(\-\-\)" conceal cchar=■
"syn match mkdCustListItem /^\s*\%(--\)\ze\s+/ conceal cchar=■
"syn match mkdCustListItem /^\s*\%(\-\-\-}\)\ze\s+/ conceal cchar=▲
"syn match mkdCustListItem /^\s*\%(\-\-\-\-\)\ze\s+/ conceal cchar=▬
"syn match mkdCustListItem /^\s*\%(\-\-\-\-\-\)\ze\s+/ conceal cchar=◢
"syn match mkdCustListItem /^\s*\%(\-\-\-\-\-\-\)\ze\s+/ conceal cchar=◥

"call matchadd('Conceal', '\[\ \]', 0, 11, {'conceal': ''})
"call matchadd('Conceal', '\[x\]', 0, 12, {'conceal': ''})

"call matchadd('Conceal', '^\*', 0, 13, {'conceal': '●'})
"call matchadd('Conceal', '^\s\s\s\s\*', 0, 14, {'conceal': '■'})

"syntax match String "[ ]" conceal cchar=■
"syntax match mkdNonListItemBlock "[ ]" conceal cchar=■

hi Conceal guibg=NONE

" syn clear htmlH1
" syn clear htmlH2
" syn clear htmlH3
" syn clear htmlH4
" syn clear htmlH5
" syn clear htmlH6
" syn region htmlH1 matchgroup=mkdHeading start=/^\s*#/ end=/$/ contains=mkdLink,mkdInlineURL,@Spell concealends
" syn region htmlH2 matchgroup=mkdHeading start=/^\s*##/ end=/$/ contains=mkdLink,mkdInlineURL,@Spell concealends
" syn region htmlH3 matchgroup=mkdHeading start=/^\s*###/ end=/$/ contains=mkdLink,mkdInlineURL,@Spell concealends
" syn region htmlH4 matchgroup=mkdHeading start=/^\s*####/ end=/$/ contains=mkdLink,mkdInlineURL,@Spell concealends
" syn region htmlH5 matchgroup=mkdHeading start=/^\s*#####/ end=/$/ contains=mkdLink,mkdInlineURL,@Spell concealends
" syn region htmlH6 matchgroup=mkdHeading start=/^\s*######/ end=/$/ contains=mkdLink,mkdInlineURL,@Spell concealends
" syn region htmlH1alt matchgroup=mkdHeading start=/^\s*@#/ end=/$/ contains=mkdLink,mkdInlineURL,@Spell containedin=mkdNonListItemBlock concealends
" syn region htmlH2alt matchgroup=mkdHeading start=/^\s*@@#/ end=/$/ contains=mkdLink,mkdInlineURL,@Spell containedin=mkdNonListItemBlock concealends
" syn region htmlH3alt matchgroup=mkdHeading start=/^\s*@@@#/ end=/$/ contains=mkdLink,mkdInlineURL,@Spell containedin=mkdNonListItemBlock concealends
" syn region htmlH4alt matchgroup=mkdHeading start=/^\s*@@@@#/ end=/$/ contains=mkdLink,mkdInlineURL,@Spell containedin=mkdNonListItemBlock concealends
" syn region htmlH5alt matchgroup=mkdHeading start=/^\s*@@@@@#/ end=/$/ contains=mkdLink,mkdInlineURL,@Spell containedin=mkdNonListItemBlock concealends
" syn region htmlH6alt matchgroup=mkdHeading start=/^\s*@@@@@@#/ end=/$/ contains=mkdLink,mkdInlineURL,@Spell containedin=mkdNonListItemBlock concealends
let b:current_syntax = "markdown"
