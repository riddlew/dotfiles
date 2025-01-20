set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

set t_Co=256
let g:colors_name="Material Darker High Contrast (Custom)"

function! s:H(group, style)
  let fg = " guifg=" . (has_key(a:style, "fg") ? a:style.fg : "NONE")
  let bg = " guibg=" . (has_key(a:style, "bg") ? a:style.bg : "NONE")
  let sp = " guisp=" . (has_key(a:style, "sp") ? a:style.sp : "NONE")
  let gui = " gui=" . (has_key(a:style, "gui") ? a:style.gui : "NONE")

  execute "highlight " . a:group . fg . bg . sp . gui
endfunction

function! s:L(from_group, to_group)
  execute "highlight link " . a:from_group . " " . a:to_group
endfunction

" **********
" * Colors *
" **********
let s:bg          = "#212121"
let s:fg          = "#ffffff"
let s:red         = "#f07178"
let s:green       = "#c3e88d"
let s:yellow      = "#ffcb6b"
let s:blue        = "#82aaff"
let s:purple      = "#c792ea"
let s:cyan        = "#89ddff"


let s:comment     = "#888888"
let s:nontext     = "#4a4a4a"
let s:columns     = "#212121"
let s:borders     = "#384048"
let s:lightgrey   = "#556779"
let s:lightgrey2  = "#b0b8c0"

let s:diffadd    = { "bg": "#214700", "fg": "#c3e88d" }
let s:diffchange = { "bg": "#073c7d", "fg": "#82aaff" }
let s:diffdelete = { "bg": "#610000", "fg": "#f07178" }
let s:difftext   = { "bg": "#89ddff", "fg": s:bg }
let s:diffheader = { "bg": "#ffcb6b", "fg": s:bg }

let s:pink        = "#f0a0c0"
let s:debug        = "#FF00FF"







" let s:test1 = "#1d1f21"
" let s:test2 = "#212121"
" let s:test3 = "#292b2b"
" let s:test4 = "#3f4040"
" let s:test5 = "#5c5e5e"
" let s:test6 = "#757878"
" let s:test7 = "#969898"
" " let s:testred = "#cc6666"
" " let s:testorange = "#de935f"
" " let s:testyellow      = "#f0c674"
" " let s:testgreen       = "#b5bd68"
" " let s:testblue        = "#81a2be"
" " let s:testdark_blue   = "#41728e"
" " let s:testmagenta     = "#c9b4cf"
" " let s:testviolet      = "#b294bb"
" " let s:testcyan        = "#8abeb7"
"
" let s:grey1       = "#282b33"
" let s:grey2       = "#34373e"
" " let s:grey3       = "#41454b"
" let s:grey3       = "#384048"
" " let s:grey4       = "#515462"
" let s:grey4       = "#556779"
" " let s:grey5       = "#636672"
" let s:grey5       = "#606060"
" let s:grey6       = "#668799"
" let s:grey7       = "#9098a0"
" let s:grey8       = "#b0b8c0"
" let s:grey9       = "#b2c1da"

" " let s:dark_red    = "#d97474"
" " let s:pure_red    = "#ff3e3e"
" let s:red         = "#ff8484"
" " let s:dark_red    = "#de5577"
" " let s:dark_red2   = "#902020"
" " let s:dark_red3   = "#40000A"

" " let s:yellow      = "#ffcc5c"
" " let s:dark_yellow = "#e1af6a"
" let s:yellow      = "#fad07a"
" let s:dark_yellow = "#ffb964"

" let s:very_blue        = "#53a7f3"
" let s:diff_blue     = "#314f76"
" " let s:dark_blue   = "#4b93d1"
" let s:blue        = "#8fbfdc"
" let s:dark_blue   = "#8197bf"
" let s:dark_blue2  = "#2b5b77"

" let s:cyan        = "#4ccdd4"
" " let s:dark_cyan   = "#63ceb0"
" let s:dark_cyan   = "#2d7067"

" " let s:green       = "#a7df37"
" " let s:dark_green  = "#a7cb6d"
" let s:bright_green= "#a7df37"
" let s:bright_green2= "#d2ebbe"
" let s:green       = "#99ad6a"
" let s:dark_green  = "#799d6a"
" let s:dark_green2 = "#437019"

" " let s:purple      = "#dfafff"
" let s:purple      = "#c6b6ee"
" let s:dark_purple = "#bb93d6"
" let s:dark_purple2= "#700089"
" let s:dark_purple3= "#540063"

" let s:pink        = "#f0a0c0"
" let s:debug        = "#FF00FF"

" let s:cyan        = "#4ccdd4"
" let s:pure_red    = "#ff3e3e"




" *****************
" * Syntax Groups *
" *****************
call s:H("Comment",        { "fg": s:comment })
call s:H("Constant",       { "fg": s:red })
call s:H("Special",        { "fg": s:blue }) " this, Math class, etc
call s:H("Delimiter",      { "fg": s:fg })
" call s:H("StringDelimiter",{ "fg": s:dark_green2 })
call s:H("StringDelimiter",{ "fg": s:green })
call s:H("String",         { "fg": s:green })
call s:H("Identifier",     { "fg": s:purple })  " Variable names
call s:H("Structure",      { "fg": s:blue }) " struct, union, enum
call s:H("Function",       { "fg": s:yellow }) " Function name & class methods
" call s:H("Statement",      { "fg": s:dark_blue })
call s:H("Statement",      { "fg": s:blue })
call s:H("PreProc",        { "fg": s:blue })
call s:H("Character",      { "fg": s:red })
call s:H("Number",         { "fg": s:blue })
call s:H("Float",          { "fg": s:blue })
call s:H("Boolean",        { "fg": s:red })
" call s:H("Conditional",    { "fg": s:dark_blue })   " if else switch etc
call s:H("Conditional",    { "fg": s:blue })   " if else switch etc
" call s:H("Repeat",         { "fg": s:dark_blue })   " for do while etc
call s:H("Repeat",         { "fg": s:blue })   " for do while etc
call s:H("Operator",       { "fg": s:blue })  " sizeof, +, *, etc
" call s:H("Keyword",        { "fg": s:dark_blue })
call s:H("Keyword",        { "fg": s:blue })
" call s:H("Exception",      { "fg": s:dark_blue })   " try catch throw
call s:H("Exception",      { "fg": s:blue })   " try catch throw
call s:H("Include",        { "fg": s:blue })   " #include
call s:H("Define",         { "fg": s:blue })   " #define
call s:H("Macro",          { "fg": s:blue })   " same as define
call s:H("PreCondit",      { "fg": s:blue })   " #if, #else, #endif
call s:H("Type",           { "fg": s:yellow }) " int, long, char, etc
" call s:H("StorageClass",   { "fg": s:dark_yellow }) " static, register, volatile, etc
call s:H("StorageClass",   { "fg": s:yellow }) " static, register, volatile, etc
call s:H("Typedef",        { "fg": s:yellow }) " interface names, etc
call s:H("SpecialChar",    { "fg": s:red })    " same as character?
" call s:H("Tag",            { "fg": s:dark_green })
call s:H("Tag",            { "fg": s:green })
" call s:H("SpecialComment", { "fg": s:dark_green })
call s:H("SpecialComment", { "fg": s:green })
" call s:H("Debug",          { "fg": s:dark_green })
call s:H("Debug",          { "fg": s:green })
" call s:H("Underlined",     { "fg": s:dark_blue, "gui": "underline" })
call s:H("Underlined",     { "fg": s:blue, "gui": "underline" })
" call s:H("Ignore",         { "fg": s:pink })
call s:H("Ignore",         { "fg": s:debug })
" call s:H("Error",          { "bg": s:red, "fg": s:fg })
call s:H("Todo",           { "fg": s:fg, "gui": "NONE" })

" ********************
" * Highlight Groups *
" ********************
" call s:H("ColorColumn",  { "bg": s:test2 })
call s:H("ColorColumn",  { "bg": s:columns })
" Not sure if conceal will break anything, but need it right now so that
" easymotion works in nvim-tree, otherwise it's white on light-grey color.
" call s:H("Conceal",      { "fg": s:yellow })
" Changed to gray because it's used for leading spaces autocmd.
call s:H("Conceal",      { "fg": s:nontext })
call s:H("Cursor",       { "bg": s:fg, "fg": s:bg })
call s:H("iCursor",       { "bg": s:yellow, "fg": s:bg })
call s:H("vCursor",       { "bg": s:blue, "fg": s:bg })
call s:H("rCursor",       { "bg": s:red, "fg": s:bg })
set guicursor=n-c:block-Cursor
set guicursor+=i:block-iCursor
set guicursor+=v:block-vCursor
set guicursor+=r:block-rCursor
" call s:H("CursorColumn", { "bg": s:test2 })
call s:H("CursorColumn", { "bg": s:columns })
" call s:H("CursorColumn", { "bg": s:test2 })
call s:H("CursorLine",   { "bg": s:columns })
call s:H("Directory",    { "fg": s:blue })
" call s:H("Error",        { "fg": s:pure_red })
call s:H("Error",        { "fg": s:red })
" call s:H("ErrorMsg",     { "fg": s:pure_red })
call s:H("ErrorMsg",     { "fg": s:red })
" call s:H("VertSplit",    { "fg": s:grey3 })
call s:H("VertSplit",    { "fg": s:borders })
call s:L("WinSeparator", "VertSplit")
" call s:H("Folded",       { "bg": s:test4, "fg": s:fg })
call s:H("Folded",       { "bg": s:borders, "fg": s:fg })
call s:H("FoldColumn",   { "fg": s:fg })
call s:H("SignColumn",   { "fg": s:fg })
" call s:H("LineNr",       { "fg": s:grey4 })
call s:H("LineNr",       { "fg": s:lightgrey })
call s:H("CursorLineNr", { "fg": s:fg })
" call s:H("MatchParen",   { "bg": s:grey4, "fg": s:fg })
call s:H("MatchParen",   { "bg": s:lightgrey, "fg": s:fg })
" call s:H("ModeMsg",      { "gui": "bold" })
call s:L("MoreMsg", "Special")
call s:H("NonText",      { "fg": s:nontext })
" call s:H("Normal",       { "bg": s:bg, "fg": s:fg })
call s:H("Normal",       { "fg": s:fg })

" call s:H("Pmenu",        { "bg": s:test3 })
call s:H("Pmenu",        { "bg": s:borders })
" call s:H("PmenuSel",     { "bg": s:grey8, "fg": s:bg })
call s:H("PmenuSel",     { "bg": s:lightgrey2, "fg": s:bg })
" call s:H("PmenuSbar",    { "bg": s:test3 })
call s:H("PmenuSbar",    { "bg": s:borders })
" call s:H("PmenuThumb",   { "bg": s:grey8 })
call s:H("PmenuThumb",   { "bg": s:lightgrey2 })

call s:H("Question",     { "fg": s:green })
" call s:H("Search",       { "bg": s:dark_blue2, "fg": s:fg, "gui": "bold" })
call s:H("Search",       { "bg": s:blue, "fg": s:fg, "gui": "bold" })
" call s:H("IncSearch",    { "bg": s:blue, "fg": s:bg, "gui": "bold"})
call s:H("IncSearch",    { "bg": s:cyan, "fg": s:bg, "gui": "bold"})
call s:H("SpecialKey",   { "fg": s:nontext })
call s:H("SpellBad",     { "fg": s:red, "gui": "underline" })
call s:H("SpellCap",     { "fg": s:blue, "gui": "underline" })
" call s:H("SpellLocal",   { "fg": s:dark_purple2, "gui": "underline" })
call s:H("SpellLocal",   { "fg": s:purple, "gui": "underline" })
call s:H("SpellRare",    { "fg": s:cyan, "gui": "underline" })

" call s:H("TabLine",      { "bg": s:grey1, "fg": s:fg })
call s:H("TabLine",      { "bg": s:columns, "fg": s:fg })
" call s:H("TabLineFill",  { "bg": s:grey1, "fg": s:fg })
call s:H("TabLineFill",  { "bg": s:columns, "fg": s:fg })
call s:H("TabLineSel",   { "bg": "#484D5C", "fg": s:fg })

call s:H("Title",        { "fg": s:fg })
" call s:H("Visual",       { "bg": s:test4, "fg": s:fg })
call s:H("Visual",       { "bg": s:borders, "fg": s:fg })
call s:H("WarningMsg",   { "fg": s:red })
" call s:H("WildMenu",     { "bg": s:test3, "fg": s:fg })
call s:H("WildMenu",     { "bg": s:borders, "fg": s:fg })
" call s:H("EndOfBuffer",  { "fg": s:grey2 })
call s:H("EndOfBuffer",  { "fg": s:borders })

call s:H("FloatBorder",  { "fg": s:fg, "bg": s:bg })
" Disabled because it interferes with lsp-signature background
" call s:H("NormalFloat",  { "bg": s:bg })

" **************
" * Treesitter *
" **************
" " call s:H("TSAttribute", { "fg": s:pink })
" call s:H("TSBoolean", { "fg": s:red, "gui": "bold" })
" " call s:H("TSCharacter", { "fg": s:pink })
" " call s:H("TSCharacterSpecial", { "fg": s:pink })
" call s:H("TSComment", { "fg": s:grey })
" call s:H("TSConditional", { "fg": s:violet })
" call s:H("TSConstant", { "fg": s:red })
" call s:H("TSConstBuiltin", { "fg": s:red, "gui": "bold" })
" " call s:H("TSConstMacro", { "fg": s:pink })
" " call s:H("TSConstructor", { "fg": s:pink })
" " call s:H("TSDebug", { "fg": s:pink })
" " call s:H("TSDefine", { "fg": s:pink })
" " call s:H("TSError", { "fg": s:red })
" " call s:H("TSException", { "fg": s:pink })
" " call s:H("TSField", { "fg": s:pink })
" " call s:H("TSFloat", { "fg": s:pink })
" call s:H("TSFunction", { "fg": s:blue })
" " call s:H("TSFunctionCall", { "bg": s:pink })
" " call s:H("TSFuncBuiltin", { "bg": s:pink })
" " call s:H("TSFuncMacro", { "bg": s:pink })
" call s:H("TSInclude", { "fg": s:violet })
" call s:H("TSKeyword", { "fg": s:violet })
" call s:H("TSKeywordFunction", { "fg": s:violet })
" call s:H("TSKeywordOperator", { "fg": s:violet })
" call s:H("TSKeywordReturn", { "fg": s:violet })
" " call s:H("TSLabel", { "bg": s:pink })
" call s:H("TSMethod", { "fg": s:blue })
" " call s:H("TSMethodCall", { "bg": s:pink })
" " call s:H("TSNamespace", { "bg": s:pink })
" " call s:H("TSNone", { "bg": s:pink })
" call s:H("TSNumber", { "fg": s:red, "gui": "bold" })
" call s:H("TSOperator", { "fg": s:fg })
" call s:H("TSParameter", { "fg": s:fg })
" " call s:H("TSParameterReference", { "bg": s:pink })
" " call s:H("TSPreProc", { "bg": s:pink })
" call s:H("TSProperty", { "fg": s:orange })
" call s:H("TSPunctDelimiter", { "fg": s:fg })
" call s:H("TSPunctBracket", { "fg": s:fg })
" call s:H("TSPunctSpecial", { "fg": s:red })
" call s:H("TSRepeat", { "fg": s:violet })
" " call s:H("TSStorageClass", { "bg": s:pink })
" call s:H("TSString", { "fg": s:green })
" " call s:H("TSStringRegex", { "bg": s:pink })
" " call s:H("TSStringEscape", { "bg": s:pink })
" " call s:H("TSStringSpecial", { "bg": s:pink })
" " call s:H("TSSymbol", { "bg": s:pink })
" " call s:H("TSTag", { "bg": s:pink })
" " call s:H("TSTagAttribute", { "bg": s:pink })
" " call s:H("TSTagDelimiter", { "bg": s:pink })
" " call s:H("TSText", { "bg": s:pink })
" " call s:H("TSStrong", { "bg": s:pink })
" " call s:H("TSEmphasis", { "bg": s:pink })
" " call s:H("TSUnderline", { "bg": s:pink })
" " call s:H("TSStrike", { "bg": s:pink })
" " call s:H("TSTitle", { "bg": s:pink })
" " call s:H("TSLiteral", { "bg": s:pink })
" " call s:H("TSURI", { "bg": s:pink })
" " call s:H("TSMath", { "bg": s:pink })
" " call s:H("TSTextReference", { "bg": s:pink })
" " call s:H("TSEnvironment", { "bg": s:pink })
" " call s:H("TSEnvironmentName", { "bg": s:pink })
" " call s:H("TSNote", { "bg": s:pink })
" " call s:H("TSWarning", { "bg": s:pink })
" " call s:H("TSDanger", { "bg": s:pink })
" " call s:H("TSTodo", { "bg": s:pink })
" call s:H("TSType", { "fg": s:yellow })
" call s:H("TSTypeBuiltin", { "fg": s:violet })
" " call s:H("TSTypeQualifier", { "bg": s:pink })
" " call s:H("TSTypeDefinition", { "bg": s:pink })
" call s:H("TSVariable", { "fg": s:fg })
" call s:H("TSVariableBuiltin", { "fg": s:violet })

" ********
" * HTML *
" ********
" call s:H("htmlArg",            { "fg": s:yellow })
" call s:H("htmlEndTag",         { "fg": s:blue })
call s:L("htmlLink", "Underlined")
" call s:H("htmlSpecialChar",    { "fg": s:green })
" call s:H("htmlSpecialTagName", { "fg": s:blue })
" call s:H("htmlTag",            { "fg": s:blue })
" call s:H("htmlTagName",        { "fg": s:blue })

" *******
" * CSS *
" *******
" call s:H("cssAttrComma",         { "fg": s:green })
" call s:H("cssAttributeSelector", { "fg": s:green })
" call s:H("cssBraces",            { "fg": s:yellow })
" call s:H("cssClassName",         { "fg": s:yellow })
" call s:H("cssClassNameDot",      { "fg": s:yellow })
" call s:H("cssDefinition",        {})
" call s:H("cssFontAttr",          { "fg": s:red })
" call s:H("cssFontDescriptor",    { "fg": s:green })
" call s:H("cssFunctionName",      { "fg": s:yellow })
" call s:H("cssIdentifier",        { "fg": s:yellow })
" call s:H("cssImportant",         { "fg": s:green })
" call s:H("cssMediaType",         { "fg": s:green })
" call s:H("cssProp",              { "fg": s:yellow })
" call s:H("cssPseudoClassId",     { "fg": s:blue })
" call s:H("cssSelectorOp",        { "fg": s:green })
" call s:H("cssSelectorOp2",       { "fg": s:green })
" call s:H("cssTagName",           { "fg": s:blue })

" ********
" * Sass *
" ********
" call s:H("sassAmpersand",      { "fg": s:red })
" call s:H("sassClass",          { "fg": s:yellow })
" call s:H("sassControl",        { "fg": s:blue })
" call s:H("sassExtend",         { "fg": s:cyan })
" call s:H("sassFor",            { "fg": s:cyan })
" call s:H("sassFunction",       { "fg": s:yellow })
" call s:H("sassId",             { "fg": s:purple })
" call s:H("sassInclude",        { "fg": s:cyan })
" call s:H("sassMedia",          { "fg": s:cyan })
" call s:H("sassMediaOperators", { "fg": s:cyan })
" call s:H("sassMixin",          { "fg": s:cyan })
" call s:H("sassMixinName",      {})
" call s:H("sassMixing",         { "fg": s:cyan })

" *******
" * Xml *
" *******
" call s:H("xmlAttrib",  { "fg": s:yellow })
" call s:H("xmlTag",     { "fg": s:blue })
" call s:H("xmlEndTag",  { "fg": s:blue })
" call s:H("xmlTagName", { "fg": s:blue })

" **************
" * Javascript *
" **************
" call s:H("javaScriptBraces",       {  })
" call s:H("javaScriptFunction",     {  })
" call s:H("javaScriptIdentifier",   {  })
" call s:H("javaScriptNull",         {  })
" call s:H("javaScriptNumber",       {  })
" call s:H("javaScriptRequire",      {  })
" call s:H("javaScriptReserved",     {  })
" call s:H("jsArrowFunction",        {  })
" call s:H("jsClassKeywords",        {  })
" call s:H("jsDocParam",             {  })
" call s:H("jsDocTags",              {  })
" call s:H("jsFuncCall",             {  })
" call s:H("jsFunction",             {  })
" call s:H("jsGlobalObjects",        {  })
" call s:H("jsModuleWords",          {  })
" call s:H("jsModules",              {  })
" call s:H("jsNull",                 {  })
" call s:H("jsOperator",             {  })
" call s:H("jsStorageClass",         {  })
" call s:H("jsTemplateBraces",       {  })
" call s:H("jsTemplateVar",          {  })
" call s:H("jsThis",                 {  })
" call s:H("jsUndefined",            {  })
" call s:H("javascriptArrowFunc",    {  })
" call s:H("javascriptClassExtends", {  })
" call s:H("javascriptClassKeyword", {  })
" call s:H("javascriptDocNotation",  {  })
" call s:H("javascriptDocParamName", {  })
" call s:H("javascriptDocTags",      {  })
" call s:H("javascriptEndColons",    {  })
" call s:H("javascriptExport",       {  })
" call s:H("javascriptFuncArg",      {  })
" call s:H("javascriptFuncKeyword",  {  })
" call s:H("javascriptIdentifier",   {  })
" call s:H("javascriptImport",       {  })
" call s:H("javascriptObjectLabel",  {  })
" call s:H("javascriptOpSymbol",     {  })
" call s:H("javascriptOpSymbols",    {  })
" call s:H("javascriptPropertyName", {  })
" call s:H("javascriptTemplateSB",   {  })
" call s:H("javascriptVariable",     {  })

" **************
" * Typescript *
" **************
" typescriptASCII xxx links to Special
" typescriptAbstract xxx links to Special
" typescriptAccessibilityModifier xxx links to Keyword
" typescriptAliasDeclaration xxx links to Identifier
" typescriptAliasKeyword xxx links to Keyword
" typescriptAmbientDeclaration xxx links to Special
" typescriptAnimationEvent xxx links to Title
" typescriptArray xxx cleared
" typescriptArrayDestructure xxx cleared
" typescriptArrayMethod xxx links to Keyword
" typescriptArrayStaticMethod xxx links to Keyword
" typescriptArrowFunc xxx links to Type
" typescriptArrowFuncArg xxx links to PreProc
" typescriptArrowFuncDef xxx cleared
" typescriptAssertType xxx links to Keyword
" typescriptAssign xxx cleared
" typescriptAsyncFor xxx links to Keyword
" typescriptAsyncFunc xxx links to Keyword
" typescriptAsyncFuncKeyword xxx links to Keyword
" typescriptBOM  xxx links to Structure
" typescriptBOMHistoryMethod xxx links to Keyword
" typescriptBOMHistoryProp xxx links to Keyword
" typescriptBOMLocationMethod xxx links to Keyword
" typescriptBOMLocationProp xxx links to Keyword
" typescriptBOMNavigatorMethod xxx links to Keyword
" typescriptBOMNavigatorProp xxx links to Keyword
" typescriptBOMNetworkProp xxx links to Keyword
" typescriptBOMWindowCons xxx links to Structure
" typescriptBOMWindowEvent xxx links to Keyword
" typescriptBOMWindowMethod xxx links to Structure
" typescriptBOMWindowProp xxx links to Structure
" typescriptBinaryOp xxx cleared
" typescriptBlobMethod xxx links to Keyword
" typescriptBlock xxx cleared
" typescriptBoolean xxx links to Boolean
" typescriptBraces xxx links to Function
" typescriptBranch xxx links to Conditional
" typescriptCSSEvent xxx links to Title
" typescriptCacheMethod xxx links to Keyword
" typescriptCall xxx links to PreProc
" typescriptCase xxx links to Conditional
" typescriptCastKeyword xxx links to Special
" typescriptClassBlock xxx cleared
" typescriptClassExtends xxx links to Keyword
" typescriptClassHeritage xxx cleared
" typescriptClassKeyword xxx links to Keyword
" call s:H("typescriptClassname", { "fg": s:yellow })
" typescriptClassStatic xxx links to StorageClass
" typescriptClassTypeArguments xxx cleared
" typescriptClassTypeParameter xxx cleared
" typescriptComment xxx links to Comment
" typescriptCommentTodo xxx links to Todo
" typescriptComputedMember xxx cleared
" typescriptComputedPropertyName xxx cleared
" typescriptConditional xxx links to Conditional
" typescriptConditionalElse xxx links to Conditional
" typescriptConditionalParen xxx cleared
" typescriptConditionalType xxx cleared
" typescriptConsoleMethod xxx links to Keyword
" typescriptConstraint xxx links to Keyword
" typescriptConstructSignature xxx links to Identifier
" typescriptConstructor xxx links to Keyword
" typescriptConstructorType xxx links to Function
" typescriptCryptoGlobal xxx links to Structure
" typescriptCryptoMethod xxx links to Keyword
" typescriptCryptoProp xxx links to Keyword
" typescriptDOMDocMethod xxx links to Keyword
" typescriptDOMDocProp xxx links to Keyword
" typescriptDOMElemAttrs xxx links to Keyword
" typescriptDOMElemFuncs xxx links to Keyword
" typescriptDOMEventCons xxx links to Structure
" typescriptDOMEventMethod xxx links to Keyword
" typescriptDOMEventProp xxx links to Keyword
" typescriptDOMEventTargetMethod xxx links to Keyword
" typescriptDOMFormMethod xxx links to Keyword
" typescriptDOMFormProp xxx links to Keyword
" typescriptDOMMutationEvent xxx links to Title
" typescriptDOMNodeMethod xxx links to Keyword
" typescriptDOMNodeProp xxx links to Keyword
" typescriptDOMNodeType xxx links to Keyword
" typescriptDOMStorage xxx links to Keyword
" typescriptDOMStorageMethod xxx links to Keyword
" typescriptDOMStorageProp xxx links to Keyword
" typescriptDOMStyle xxx links to Keyword
" typescriptDatabaseEvent xxx links to Title
" typescriptDateMethod xxx links to Keyword
" typescriptDateStaticMethod xxx links to Keyword
" typescriptDebugger xxx cleared
" typescriptDecorator xxx links to Special
" typescriptDestructureAs xxx cleared
" typescriptDestructureComma xxx cleared
" typescriptDestructureLabel xxx links to Function
" typescriptDestructureString xxx links to String
" typescriptDestructureVariable xxx links to PreProc
" typescriptDocA xxx cleared
" typescriptDocAs xxx cleared
" typescriptDocB xxx cleared
" typescriptDocComment xxx links to Comment
" typescriptDocDesc xxx cleared
" typescriptDocEventRef xxx links to Function
" typescriptDocLinkTag xxx cleared
" typescriptDocNGDirective xxx cleared
" typescriptDocNGParam xxx links to typescriptDocParam
" typescriptDocName xxx cleared
" typescriptDocNamedParamType xxx links to Type
" typescriptDocNotation xxx links to SpecialComment
" typescriptDocNumParam xxx links to Function
" typescriptDocParam xxx links to Function
" typescriptDocParamName xxx links to Type
" typescriptDocParamType xxx links to Type
" typescriptDocRef xxx cleared
" typescriptDocTags xxx links to SpecialComment
" typescriptDocumentEvent xxx links to Title
" typescriptDotNotation xxx cleared
" typescriptDotStyleNotation xxx cleared
" typescriptDragEvent xxx links to Title
" typescriptES6MapMethod xxx links to Keyword
" typescriptES6MapProp xxx links to Keyword
" typescriptES6SetMethod xxx links to Keyword
" typescriptES6SetProp xxx links to Keyword
" typescriptElementEvent xxx links to Title
" typescriptEncodingGlobal xxx links to Structure
" typescriptEncodingMethod xxx links to Keyword
" typescriptEncodingProp xxx links to Keyword
" typescriptEndColons xxx links to Exception
" typescriptEnum xxx cleared
" typescriptEnumKeyword xxx links to Identifier
" typescriptEventFuncCallArg xxx cleared
" typescriptEventString xxx links to String
" typescriptExceptions xxx links to Special
" typescriptExport xxx links to Special
" typescriptExportType xxx links to Special
" typescriptFileListMethod xxx links to Keyword
" typescriptFileMethod xxx links to Keyword
" typescriptFileReaderMethod xxx links to Keyword
" typescriptFileReaderProp xxx links to Keyword
" typescriptFocusEvent xxx links to Title
" typescriptForOperator xxx links to Repeat
" typescriptFormEvent xxx links to Title
" typescriptFrameEvent xxx links to Title
" typescriptFuncArg xxx links to PreProc
" typescriptFuncCallArg xxx cleared
" typescriptFuncComma xxx links to Operator
" typescriptFuncImpl xxx cleared
" typescriptFuncKeyword xxx links to Keyword
" typescriptFuncName xxx links to Function
" typescriptFuncType xxx links to Special
" typescriptFuncTypeArrow xxx links to Function
" typescriptFunctionMethod xxx links to Keyword
" typescriptFunctionType xxx cleared
" typescriptGenericCall xxx cleared
" typescriptGenericFunc xxx cleared
" typescriptGenericImpl xxx cleared
" typescriptGeolocationMethod xxx links to Keyword
" typescriptGlobal xxx links to Structure
" typescriptGlobalArrayDot xxx cleared
" typescriptGlobalDateDot xxx cleared
" typescriptGlobalJSONDot xxx cleared
" typescriptGlobalMathDot xxx cleared
" typescriptGlobalMethod xxx links to Structure
" typescriptGlobalNumberDot xxx cleared
" typescriptGlobalObjectDot xxx cleared
" typescriptGlobalPromiseDot xxx cleared
" typescriptGlobalRegExpDot xxx cleared
" typescriptGlobalStringDot xxx cleared
" typescriptGlobalSymbolDot xxx cleared
" typescriptGlobalURLDot xxx cleared
" typescriptHeadersMethod xxx links to Keyword
" typescriptIdentifier xxx links to Structure
" typescriptIdentifierName xxx cleared
" typescriptImport xxx links to Special
" typescriptImportType xxx links to Special
" typescriptIndexExpr xxx cleared
" typescriptIndexSignature xxx cleared
" typescriptInputDeviceEvent xxx links to Title
" typescriptInterfaceComma xxx cleared
" typescriptInterfaceExtends xxx links to Keyword
" typescriptInterfaceHeritage xxx cleared
" typescriptInterfaceKeyword xxx links to Keyword
" typescriptInterfaceName xxx links to Function
" typescriptInterfaceTypeArguments xxx cleared
" typescriptInterfaceTypeParameter xxx cleared
" typescriptIntlMethod xxx links to Keyword
" typescriptJSONStaticMethod xxx links to Keyword
" typescriptKeywordOp xxx links to Identifier
" typescriptLabel xxx links to Label
" typescriptLineComment xxx links to Comment
" typescriptLoopParen xxx cleared
" typescriptMagicComment xxx links to SpecialComment
" typescriptMappedIn xxx links to Special
" typescriptMathStaticMethod xxx links to Keyword
" typescriptMathStaticProp xxx links to Keyword
" typescriptMediaEvent xxx links to Title
" call s:H("typescriptMember", { "fg": s:fg })
" typescriptMemberOptionality xxx cleared
" typescriptMenuEvent xxx links to Title
" typescriptMessage xxx links to Keyword
" typescriptMethodAccessor xxx links to Operator
" typescriptMixinComma xxx cleared
" typescriptModule xxx links to Special
" typescriptNetworkEvent xxx links to Title
" typescriptNodeGlobal xxx links to Structure
" typescriptNull xxx links to Boolean
" typescriptNumber xxx links to Number
" typescriptNumberMethod xxx links to Keyword
" typescriptNumberStaticMethod xxx links to Keyword
" typescriptNumberStaticProp xxx links to Keyword
" typescriptObjectAsyncKeyword xxx links to Keyword
" typescriptObjectColon xxx cleared
" typescriptObjectDestructure xxx cleared
" typescriptObjectLabel xxx links to typescriptLabel
" typescriptObjectLiteral xxx cleared
" typescriptObjectMethod xxx links to Keyword
" typescriptObjectSpread xxx cleared
" typescriptObjectStaticMethod xxx links to Keyword
" typescriptObjectType xxx cleared
" typescriptOperator xxx links to Identifier
" typescriptOptionalMark xxx links to PreProc
" typescriptParamImpl xxx links to PreProc
" typescriptParenExp xxx cleared
" typescriptParens xxx links to Normal
" typescriptParenthesizedType xxx cleared
" typescriptPaymentAddressProp xxx links to Keyword
" typescriptPaymentEvent xxx links to Keyword
" typescriptPaymentMethod xxx links to Keyword
" typescriptPaymentProp xxx links to Keyword
" typescriptPaymentResponseMethod xxx links to Keyword
" typescriptPaymentResponseProp xxx links to Keyword
" typescriptPaymentShippingOptionProp xxx links to Keyword
" typescriptPredefinedType xxx links to Type
" typescriptProgressEvent xxx links to Title
" typescriptPromiseMethod xxx links to Keyword
" typescriptPromiseStaticMethod xxx links to Keyword
" typescriptProperty xxx cleared
" typescriptPrototype xxx links to Type
" typescriptProxyAPI xxx links to Keyword
" typescriptReadonlyArrayKeyword xxx links to Keyword
" typescriptReadonlyModifier xxx links to Keyword
" typescriptRef  xxx links to Include
" typescriptReflectMethod xxx links to Keyword
" typescriptRegExpMethod xxx links to Keyword
" typescriptRegExpProp xxx links to Keyword
" typescriptRegExpStaticProp xxx links to Keyword
" typescriptRegexpString xxx links to String
" typescriptRepeat xxx links to Repeat
" typescriptRequestMethod xxx links to Keyword
" typescriptRequestProp xxx links to Keyword
" typescriptReserved xxx links to Error
" typescriptResourceEvent xxx links to Title
" typescriptResponseMethod xxx links to Keyword
" typescriptResponseProp xxx links to Keyword
" typescriptRestOrSpread xxx cleared
" typescriptReturnAnnotation xxx cleared
" typescriptSVGEvent xxx links to Title
" typescriptScriptEvent xxx links to Title
" typescriptSensorEvent xxx links to Title
" typescriptServiceWorkerEvent xxx links to Title
" typescriptServiceWorkerMethod xxx links to Keyword
" typescriptServiceWorkerProp xxx links to Keyword
" typescriptSessionHistoryEvent xxx links to Title
" typescriptSpecial xxx links to Special
" typescriptStatementKeyword xxx links to Statement
" typescriptStorageEvent xxx links to Title
" typescriptString xxx links to String
" typescriptStringLiteralType xxx links to String
" typescriptStringMember xxx links to String
" typescriptStringMethod xxx links to Keyword
" typescriptStringProperty xxx links to String
" typescriptStringStaticMethod xxx links to Keyword
" typescriptSubtleCryptoMethod xxx links to Keyword
" typescriptSymbolStaticMethod xxx links to Keyword
" typescriptSymbolStaticProp xxx links to Keyword
" typescriptSymbols xxx links to Normal
" typescriptTabEvent xxx links to Title
" typescriptTemplate xxx links to String
" typescriptTemplateLiteralType xxx links to String
" typescriptTemplateSB xxx links to Label
" typescriptTemplateSubstitution xxx cleared
" typescriptTemplateSubstitutionType xxx cleared
" typescriptTernary xxx cleared
" typescriptTernaryOp xxx cleared
" typescriptTestGlobal xxx links to Function
" typescriptTextEvent xxx links to Title
" typescriptTouchEvent xxx links to Title
" typescriptTry  xxx links to Special
" typescriptTupleLable xxx links to Label
" typescriptTupleType xxx cleared
" typescriptType xxx links to Type
" typescriptTypeAnnotation xxx cleared
" typescriptTypeArguments xxx cleared
" typescriptTypeBracket xxx cleared
" typescriptTypeBrackets xxx cleared
" typescriptTypeCast xxx cleared
" typescriptTypeOperator xxx cleared
" typescriptTypeParameter xxx links to Identifier
" typescriptTypeParameters xxx cleared
" typescriptTypeQuery xxx links to Keyword
" typescriptTypeReference xxx links to Identifier
" typescriptURLStaticMethod xxx links to Keyword
" typescriptURLUtilsProp xxx links to Keyword
" typescriptUnaryOp xxx cleared
" typescriptUncategorizedEvent xxx links to Title
" typescriptUnion xxx links to Operator
" typescriptUpdateEvent xxx links to Title
" typescriptUserDefinedType xxx links to Keyword
" typescriptValueChangeEvent xxx links to Title
" typescriptVariable xxx links to Identifier
" call s:H("typescriptVariableDeclaration", { "fg": s:red })
" typescriptViewEvent xxx links to Title
" typescriptWebsocketEvent xxx links to Title
" typescriptWindowEvent xxx links to Title
" typescriptXHRGlobal xxx links to Structure
" typescriptXHRMethod xxx links to Keyword
" typescriptXHRProp xxx links to Keyword

" ********
" * Json *
" ********
" call s:H("jsonCommentError",      {  })
" call s:H("jsonKeyword",           {  })
" call s:H("jsonQuote",             {  })
" call s:H("jsonMissingCommaError", {  })
" call s:H("jsonNoQuotesError",     {  })
" call s:H("jsonNumError",          {  })
" call s:H("jsonString",            {  })
" call s:H("jsonStringSQError",     {  })
" call s:H("jsonSemicolonError",    {  })

" ************
" * Markdown *
" ************
" call s:H("markdownCode",              {  })
" call s:H("markdownCodeBlock",         {  })
" call s:H("markdownCodeDelimiter",     {  })
" call s:H("markdownHeadingDelimiter",  {  })
" call s:H("markdownRule",              {  })
" call s:H("markdownHeadingRule",       {  })
" call s:H("markdownH1",                {  })
" call s:H("markdownH2",                {  })
" call s:H("markdownH3",                {  })
" call s:H("markdownH4",                {  })
" call s:H("markdownH5",                {  })
" call s:H("markdownH6",                {  })
" call s:H("markdownIdDelimiter",       {  })
" call s:H("markdownId",                {  })
" call s:H("markdownBlockquote",        {  })
" call s:H("markdownItalic",            {  })
" call s:H("markdownBold",              {  })
" call s:H("markdownListMarker",        {  })
" call s:H("markdownOrderedListMarker", {  })
" call s:H("markdownIdDeclaration",     {  })
" call s:H("markdownLinkText",          {  })
" call s:H("markdownLinkDelimiter",     {  })
" call s:H("markdownUrl",               {  })

" call s:H("htmlH1",             { "bg": s:green,  "fg": s:bg })
" call s:H("htmlH2",             { "bg": s:blue,   "fg": s:bg })
" call s:H("htmlH3",             { "bg": s:yellow, "fg": s:bg })
" call s:H("htmlH4",             { "bg": s:purple, "fg": s:bg })
" call s:H("htmlH5",             { "bg": s:red,    "fg": s:bg })
" call s:H("htmlH6",             { "bg": s:cyan,   "fg": s:bg })
call s:H("htmlH1",             { "bg": s:green  })
call s:H("htmlH2",             { "bg": s:blue   })
call s:H("htmlH3",             { "bg": s:yellow })
call s:H("htmlH4",             { "bg": s:purple })
call s:H("htmlH5",             { "bg": s:red    })
call s:H("htmlH6",             { "bg": s:cyan   })
" call s:H("mkdHeading",         { "bg": s:bg,   "fg": s:test4 })
call s:H("mkdHeading",         { "fg": s:borders })
call s:H("htmlLink",           { "fg": s:blue, "gui": "underline" })
call s:H("mkdLink",            { "fg": s:blue, "gui": "underline" })
call s:H("mkdURL",             { "fg": s:blue, "gui": "underline" })
call s:H("htmlItalic",         { "gui": "italic" })
call s:H("mkdItalic",          { "gui": "italic" })
call s:H("htmlBold",           { "gui": "bold" })
call s:H("mkdBold",            { "gui": "bold" })
call s:H("htmlBoldItalic",     { "gui": "bold,italic" })
call s:H("mkdBoldItalic",      { "gui": "bold,italic" })
call s:H("htmlStrike",         { "gui": "strikethrough" })
call s:H("mkdStrike",          { "gui": "strikethrough" })
" call s:H("mkdCodeDelimiter",       { "fg": s:test4 })
call s:H("mkdCodeDelimiter",       { "fg": s:borders })
" call s:H("mkdCodeStart",       { "fg": s:test4 })
call s:H("mkdCodeStart",       { "fg": s:borders })
" call s:H("mkdCodeEnd",         { "fg": s:test4 })
call s:H("mkdCodeEnd",         { "fg": s:borders })
call s:H("mkdCode",            { "fg": s:yellow })
" mkdMath

" ********
" * Ruby *
" ********
" call s:H("rubyBlockParameter",            {  })
" call s:H("rubyBlockParameterList",        {  })
" call s:H("rubyClass",                     {  })
" call s:H("rubyConstant",                  {  })
" call s:H("rubyControl",                   {  })
" call s:H("rubyEscape",                    {  })
" call s:H("rubyFunction",                  {  })
" call s:H("rubyGlobalVariable",            {  })
" call s:H("rubyInclude",                   {  })
" call s:H("rubyIncluderubyGlobalVariable", {  })
" call s:H("rubyInstanceVariable",          {  })
" call s:H("rubyInterpolation",             {  })
" call s:H("rubyInterpolationDelimiter",    {  })
" call s:H("rubyInterpolationDelimiter",    {  })
" call s:H("rubyRegexp",                    {  })
" call s:H("rubyRegexpDelimiter",           {  })
" call s:H("rubyStringDelimiter",           {  })
" call s:H("rubySymbol",                    {  })

" *******
" * Git *
" *******
" call s:H("gitcommitComment",       {  })
" call s:H("gitcommitUnmerged",      {  })
" call s:H("gitcommitOnBranch",      {  })
" call s:H("gitcommitBranch",        {  })
" call s:H("gitcommitDiscardedType", {  })
" call s:H("gitcommitSelectedType",  {  })
" call s:H("gitcommitHeader",        {  })
" call s:H("gitcommitUntrackedFile", {  })
" call s:H("gitcommitDiscardedFile", {  })
" call s:H("gitcommitSelectedFile",  {  })
" call s:H("gitcommitUnmergedFile",  {  })
" call s:H("gitcommitFile",          {  })
" hi link gitcommitNoBranch gitcommitBranch
" hi link gitcommitUntracked gitcommitComment
" hi link gitcommitDiscarded gitcommitComment
" hi link gitcommitSelected gitcommitComment
" hi link gitcommitDiscardedArrow gitcommitDiscardedFile
" hi link gitcommitSelectedArrow gitcommitSelectedFile
" hi link gitcommitUnmergedArrow gitcommitUnmergedFile
" call s:H("diffAdded",      { "fg": s:green })
" call s:H("diffRemoved",    { "fg": s:red })
" call s:H("diffChanged",    { "fg": s:blue })
" call s:H("diffText",       { "fg": s:difftext })
call s:H("diffAdded",      s:diffadd)
call s:H("diffRemoved",    s:diffdelete)
call s:H("diffChanged",    s:diffchange)
call s:H("diffText",       s:difftext)
" diffLine and diffSubname help mark where hunks begin and end in fugitive.
call s:H("diffLine",       s:diffheader)
call s:H("diffSubname",    s:diffheader)
call s:H("GitSignsAdd",    { "fg": s:green })
call s:H("GitSignsChange", { "fg": s:blue })
call s:H("GitSignsDelete", { "fg": s:red })
call s:H("DiffAdd",        s:diffadd)
call s:H("DiffChange",     s:diffchange)
call s:H("DiffDelete",     s:diffdelete)
call s:H("DiffText",       s:difftext)

" *******************
" * Neovim Terminal *
" *******************
" let g:terminal_color_0          = s:grey2
let g:terminal_color_0          = s:borders
" let g:terminal_color_1          = s:dark_red
let g:terminal_color_1          = s:red
" let g:terminal_color_2          = s:dark_green
let g:terminal_color_2          = s:green
" let g:terminal_color_3          = s:dark_yellow
let g:terminal_color_3          = s:yellow
" let g:terminal_color_4          = s:dark_blue
let g:terminal_color_4          = s:blue
" let g:terminal_color_5          = s:dark_purple
let g:terminal_color_5          = s:purple
" let g:terminal_color_6          = s:dark_cyan
let g:terminal_color_6          = s:cyan
" let g:terminal_color_7          = s:grey6
let g:terminal_color_7          = s:lightgrey2
" let g:terminal_color_8          = s:grey3
let g:terminal_color_8          = s:borders
let g:terminal_color_9          = s:red
let g:terminal_color_10         = s:green
let g:terminal_color_11         = s:yellow
let g:terminal_color_12         = s:blue
let g:terminal_color_13         = s:purple
let g:terminal_color_14         = s:cyan
let g:terminal_color_15         = s:fg
let g:terminal_color_background = s:bg
let g:terminal_color_foreground = s:fg

" ******************************
" * Global Statusline / WinBar *
" ******************************
" call s:H("StatusLine",   { "bg": s:grey1, "fg": s:fg })
call s:H("StatusLine",   { "bg": s:columns, "fg": s:fg })
call s:H("StatusLineNC", { "bg": s:bg, "fg": s:fg })
" call s:H('StatusLine             guifg=#ffffff guibg=#34373e')
" call s:H("StatusLineNameError",   { "bg": s:grey1, "fg": "#ff8484" })
call s:H("StatusLineNameError",   { "bg": s:columns, "fg": s:red })
" call s:H("StatusLineNameWarning", { "bg": s:grey1, "fg": "#ffcc5c" })
call s:H("StatusLineNameWarning", { "bg": s:columns, "fg": s:yellow })
" call s:H("StatusLine2",           { "bg": s:grey1, "fg": s:fg })
call s:H("StatusLine2",           { "bg": s:columns, "fg": s:fg })

" call s:H("StatusLineModeNormal",   { "bg": s:grey1, "fg": s:fg })
" call s:H("StatusLineModePending",  { "bg": s:grey1, "fg": s:fg })
" call s:H("StatusLineModeInsert",   { "bg": s:grey1, "fg": s:fg })
" call s:H("StatusLineModeVisual",   { "bg": s:grey1, "fg": s:fg })
" call s:H("StatusLineModeVLine",    { "bg": s:grey1, "fg": s:fg })
" call s:H("StatusLineModeVBlock",   { "bg": s:grey1, "fg": s:fg })
" call s:H("StatusLineModeSelect",   { "bg": s:grey1, "fg": s:fg })
" call s:H("StatusLineModeSLine",    { "bg": s:grey1, "fg": s:fg })
" call s:H("StatusLineModeSBlock",   { "bg": s:grey1, "fg": s:fg })
" call s:H("StatusLineModeReplace",  { "bg": s:grey1, "fg": s:fg })
" call s:H("StatusLineModeVReplace", { "bg": s:grey1, "fg": s:fg })
" call s:H("StatusLineModeCommand",  { "bg": s:grey1, "fg": s:fg })
" call s:H("StatusLineModeEx",       { "bg": s:grey1, "fg": s:fg })
" call s:H("StatusLineModeShell",    { "bg": s:grey1, "fg": s:fg })
" call s:H("StatusLineModeTerminal", { "bg": s:grey1, "fg": s:fg })
call s:H("StatusLineModeNormal",   { "bg": s:columns, "fg": s:fg })
call s:H("StatusLineModePending",  { "bg": s:columns, "fg": s:fg })
call s:H("StatusLineModeInsert",   { "bg": s:columns, "fg": s:fg })
call s:H("StatusLineModeVisual",   { "bg": s:columns, "fg": s:fg })
call s:H("StatusLineModeVLine",    { "bg": s:columns, "fg": s:fg })
call s:H("StatusLineModeVBlock",   { "bg": s:columns, "fg": s:fg })
call s:H("StatusLineModeSelect",   { "bg": s:columns, "fg": s:fg })
call s:H("StatusLineModeSLine",    { "bg": s:columns, "fg": s:fg })
call s:H("StatusLineModeSBlock",   { "bg": s:columns, "fg": s:fg })
call s:H("StatusLineModeReplace",  { "bg": s:columns, "fg": s:fg })
call s:H("StatusLineModeVReplace", { "bg": s:columns, "fg": s:fg })
call s:H("StatusLineModeCommand",  { "bg": s:columns, "fg": s:fg })
call s:H("StatusLineModeEx",       { "bg": s:columns, "fg": s:fg })
call s:H("StatusLineModeShell",    { "bg": s:columns, "fg": s:fg })
call s:H("StatusLineModeTerminal", { "bg": s:columns, "fg": s:fg })

" call s:H("StatusLineGitAdd",    { "fg": s:green, "bg": s:grey1 })
call s:H("StatusLineGitAdd",    { "fg": s:green, "bg": s:columns })
" call s:H("StatusLineGitDelete", { "fg": s:red, "bg": s:grey1 })
call s:H("StatusLineGitDelete", { "fg": s:red, "bg": s:columns })
" call s:H("StatusLineGitChange", { "fg": s:blue, "bg": s:grey1 })
call s:H("StatusLineGitChange", { "fg": s:blue, "bg": s:columns })

call s:H("StatusLineError",     { "fg": s:bg, "bg": s:red })
call s:H("StatusLineWarn",      { "fg": s:bg, "bg": s:yellow })
call s:H("StatusLineInfo",      { "fg": s:bg, "bg": s:blue })
call s:H("StatusLineHint",      { "fg": s:bg, "bg": s:cyan })

call s:H("WinBar",              { "fg": s:fg, "gui": "bold" })
call s:H("WinBarNC",            { "fg": s:comment, "gui": "bold" })
call s:H("WinBarLocation",      { "fg": s:comment })

call s:H("WinBarNameError",     { "fg": s:red, "gui": "bold" })
call s:H("WinBarNameWarning",   { "fg": s:yellow, "gui": "bold" })

" **************
" * Neovim LSP *
" **************
call s:H("DiagnosticError",             { "fg": s:red })
call s:H("DiagnosticWarn",              { "fg": s:yellow })
call s:H("DiagnosticInfo",              { "fg": s:blue })
call s:H("DiagnosticHint",              { "fg": s:cyan })

call s:H("DiagnosticUnderlineError",    { "fg": s:red,    "gui": "underline" })
call s:H("DiagnosticUnderlineWarn",     { "fg": s:yellow, "gui": "underline" })
call s:H("DiagnosticUnderlineInfo",     { "fg": s:blue,   "gui": "underline" })
call s:H("DiagnosticUnderlineHint",     { "fg": s:cyan,   "gui": "underline" })

call s:H("DiagnosticVirtualTextError",  { "fg": s:red })
call s:H("DiagnosticVirtualTextWarn",   { "fg": s:yellow })
call s:H("DiagnosticVirtualTextInfo",   { "fg": s:blue })
call s:H("DiagnosticVirtualTextHint",   { "fg": s:cyan })

" This is the old way of Lsp diagnostics highlights
" call s:H("LspDiagnosticsVirtualTextError",       { "fg": s:red })
" call s:H("LspDiagnosticsError",                  { "fg": s:red })
" call s:H("LspDiagnosticsWarning",                { "fg": s:yellow })
" call s:H("LspDiagnosticsVirtualTextWarning",     { "fg": s:yellow })
" call s:H("LspDiagnosticsInformation",            { "fg": s:blue })
" call s:H("LspDiagnosticsVirtualTextInformation", { "fg": s:blue })
" call s:H("LspDiagnosticsHint",                   { "fg": s:cyan })
" call s:H("LspDiagnosticsVirtualTextHint",        { "fg": s:cyan })

" *********************
" * mhinz/vim-signify *
" *********************
" call s:H("SignifySignAdd",    {  })
" call s:H("SignifySignChange", {  })
" call s:H("SignifySignDelete", {  })

" **************************
" * airblade/vim-gitgutter *
" **************************
call s:H("GitGutterAdd",    { "fg": s:green })
call s:H("GitGutterChange", { "fg": s:red })
call s:H("GitGutterDelete", { "fg": s:blue })

" **********************
" * lewis6991/gitsigns *
" **********************
call s:H("GitSignsAdd",    { "fg": s:green })
call s:H("GitSignsDelete", { "fg": s:red })
call s:H("GitSignsChange", { "fg": s:blue })

" ********************
" * hrsh7th/nvim-cmp *
" ********************
" Deprecated functions in LSP.
call s:H("CmpItemAbbrDeprecated", { "fg": s:red })
" Highlight the part of the completion that was typed.
call s:H("CmpItemAbbrMatch",      { "fg": s:yellow, "gui": "bold" })
call s:H("CmpItemAbbrMatchFuzzy", { "fg": s:yellow, "gui": "bold" })
" Highlight the types
" call s:H("CmpItemKindClass",       { "fg": "#D4D4D4" })
" call s:H("CmpItemKindColor",       { "fg": "#D4D4D4" })
" call s:H("CmpItemKindConstant",    { "fg": "#D4D4D4" })
" call s:H("CmpItemKindConstructor", { "fg": "#D4D4D4" })
" call s:H("CmpItemKindEnum",        { "fg": "#D4D4D4" })
" call s:H("CmpItemKindEnumMember",  { "fg": "#D4D4D4" })
" call s:H("CmpItemKindEvent",       { "fg": "#D4D4D4" })
" call s:H("CmpItemKindField",       { "fg": "#D4D4D4" })
" call s:H("CmpItemKindFile",        { "fg": "#D4D4D4" })
" call s:H("CmpItemKindFolder",      { "fg": "#D4D4D4" })
" call s:H("CmpItemKindFunction",    { "fg": "#C586C0" })
" call s:H("CmpItemKindInterface",   { "fg": "#9CDCFE" })
" call s:H("CmpItemKindKeyword",     { "fg": "#D4D4D4" })
" call s:H("CmpItemKindMethod",      { "fg": "#C586C0" })
" call s:H("CmpItemKindModule",      { "fg": "#D4D4D4" })
" call s:H("CmpItemKindOperator",    { "fg": "#D4D4D4" })
" call s:H("CmpItemKindProperty",    { "fg": "#D4D4D4" })
" call s:H("CmpItemKindReference",   { "fg": "#D4D4D4" })
" call s:H("CmpItemKindSnippet",     { "fg": "#D4D4D4" })
" call s:H("CmpItemKindStruct",      { "fg": "#D4D4D4" })
" call s:H("CmpItemKindText",        { "fg": "#9CDCFE" })
" call s:H("CmpItemKindUnit",        { "fg": "#D4D4D4" })
" call s:H("CmpItemKindValue",       { "fg": "#D4D4D4" })
" call s:H("CmpItemKindVariable",    { "fg": "#9CDCFE" })

" **********************************
" * lukas-reineke/indent-blankline *
" **********************************
" call s:H("IndentBlanklineChar",        { "fg": s:grey2 })
call s:H("IndentBlanklineChar",        { "fg": s:borders })
" call s:H("IndentBlanklineContextChar", { "fg": s:grey8, "gui": "nocombine" })
call s:H("IndentBlanklineContextChar", { "fg": s:lightgrey2, "gui": "nocombine" })

" ***********************
" * folke/todo-comments *
" ***********************
call s:H("CommentYellow", { "fg": s:yellow, "gui": "bold" })
call s:H("CommentRed",    { "fg": s:red, "gui": "bold" })
call s:H("CommentBlue"  , { "fg": s:blue, "gui": "bold" })
call s:H("CommentCyan",   { "fg": s:cyan, "gui": "bold" })
call s:H("CommentPurple", { "fg": s:purple, "gui": "bold" })
call s:H("CommentGreen",  { "fg": s:green, "gui": "bold" })
call s:H("CommentWhite",  { "fg": s:fg, "gui": "bold" })

" ****************************
" * nvim-telescope/telescope *
" ****************************
call s:H("TelescopeTitle", { "gui": "bold" })
" call s:H("TelescopeSelection", { "bg": s:grey2, "fg": s:fg })
call s:H("TelescopeSelection", { "bg": s:borders, "fg": s:fg })
call s:H("TelescopeMatching",       { "fg": s:yellow, "gui": "bold" })
call s:H("TelescopeMultiSelection", { "fg": s:purple, "gui": "bold" })

" *****************************
" * easymotion/vim-easymotion *
" *****************************

" *************************
" * voldikss/vim-floaterm *
" *************************
call s:H("FloatermBorder", { "bg": s:bg, "fg": s:fg })

" *************
" * vim-sneak *
" *************
call s:L("Sneak", "Search")

" **************
" * treesitter *
" **************
call s:L("@annotation", "PreProc")
call s:L("@attribute", "PreProc")
call s:L("@boolean", "Boolean")
call s:L("@character", "Character")
call s:L("@character.special", "SpecialChar")
call s:L("@comment", "Comment")
call s:L("@conditional", "Conditional")
call s:L("@constant", "Constant")
call s:L("@constant.builtin", "Special")
call s:L("@constant.macro", "Define")
call s:L("@constructor", "Special")
call s:L("@debug", "Debug")
call s:L("@define", "Define")
call s:L("@exception", "Exception")
call s:L("@field", "Identifier")
call s:L("@float", "Float")
call s:L("@function", "Function")
call s:L("@function.builtin", "Special")
call s:L("@function.call", "@function")
call s:L("@function.macro", "Macro")
call s:L("@include", "Include")
call s:L("@keyword", "Keyword")
call s:L("@keyword.function", "Keyword")
call s:L("@keyword.operator", "@operator")
call s:L("@keyword.return", "@keyword")
call s:L("@label", "Label")
call s:L("@method", "Function")
call s:L("@method.call", "@method")
call s:L("@namespace", "Include")
" call s:L("@none", "")
call s:L("@number", "Number")
call s:L("@operator", "Operator")
call s:L("@parameter", "Identifier")
call s:L("@parameter.reference", "@parameter")
call s:L("@preproc", "PreProc")
call s:L("@property", "Identifier")
call s:L("@punctuation.bracket", "Delimiter")
call s:L("@punctuation.delimiter", "Delimiter")
call s:L("@punctuation.special", "Delimiter")
call s:L("@repeat", "Repeat")
call s:L("@storageclass", "StorageClass")
call s:L("@string", "String")
call s:L("@string.escape", "SpecialChar")
call s:L("@string.regex", "String")
call s:L("@string.special", "SpecialChar")
call s:L("@symbol", "Identifier")
call s:L("@tag", "Label")
call s:L("@tag.attribute", "@property")
call s:L("@tag.delimiter", "Delimiter")
call s:L("@text", "@none")
call s:L("@text.danger", "WarningMsg")
call s:H("@text.emphasis", { "gui": "italic" })
call s:L("@text.environment", "Macro")
call s:L("@text.environment.name", "Type")
call s:L("@text.literal", "String")
call s:L("@text.math", "Special")
call s:L("@text.note", "SpecialComment")
call s:L("@text.reference", "Constant")
call s:H("@text.strike", { "gui": "strikethrough" })
call s:H("@text.strong", { "gui": "bold" })
call s:L("@text.title", "Title")
call s:L("@text.underline", "Underlined")
call s:L("@text.uri", "Underlined")
call s:L("@text.warning", "Todo")
call s:L("@text.todo", "Todo")
call s:L("@type", "Type")
call s:L("@type.builtin", "Type")
call s:L("@type.definition", "Typedef")
call s:L("@type.qualifier", "Type")
call s:L("@variable.builtin", "Special")
