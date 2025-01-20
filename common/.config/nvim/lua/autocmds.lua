vim.cmd [[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]]

vim.cmd [[
augroup startify
    autocmd!
    autocmd FileType startify setlocal nospell
augroup END
]]

vim.cmd [[
augroup python-fix
    autocmd!
    "autocmd Filetype python setlocal noexpandtab tabstop=4 softtabstop=4 shiftwidth=4
    autocmd Filetype python setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
augroup END
]]

-- Set typescript and tsx filetypes.
vim.cmd [[
augroup typescriptsettings
    autocmd!
    autocmd BufNewFile,BufRead *.js set filetype=javascript
    autocmd BufNewFile,BufRead *.jsx set filetype=javascriptreact
    autocmd BufNewFile,BufRead *.tsx set filetype=typescriptreact
    autocmd BufNewFile,BufRead *.ts set filetype=typescript
augroup END
]]

-- Set fern settings
vim.cmd [[
augroup fern-settings
  autocmd! *
  autocmd FileType fern setlocal nonumber norelativenumber
augroup END
]]

-- vim.cmd [[
-- augroup StupidSyntaxFilesKeepChangingShit
--     autocmd!
--     autocmd Filetype * setlocal textwidth=79
-- augroup END
-- ]]

-- Show leading spaces
-- vim.cmd [[
-- " Dont' enable on these filetypes
-- let ftToIgnore = ['markdown', 'help']
--
-- augroup show-leadings-spaces
-- 	autocmd BufWinEnter * if index(ftToIgnore, &ft) < 0 | syn match LeadingSpace /\(^\t* *\)\@<= / containedin=ALL conceal cchar=·
-- 	autocmd BufReadPre * if index(ftToIgnore, &ft) < 0 | syn match LeadingSpace /\(^\t* *\)\@<= / containedin=ALL conceal cchar=·
-- augroup END
-- ]]

-- Highlight trailing whitespace
-- vim.cmd [[
-- let trailingIgnoreFT = [ 'fern', 'NvimTree', 'undotree', 'diff' ]
-- augroup HighlightTrailingWhitespace
-- 	autocmd!
-- 	" autocmd InsertEnter * if index(trailingIgnoreFT, &ft) < 0 | call clearmatches() | endif
-- 	autocmd InsertEnter * if index(trailingIgnoreFT, &ft) < 0 | match NonText /\s\+$/ | endif
-- 	autocmd InsertLeave * if index(trailingIgnoreFT, &ft) < 0 | match Error /\s\+$/ | endif
-- 	autocmd BufWinEnter * if index(trailingIgnoreFT, &ft) < 0 | match Error /\s\+$/ | endif
-- 	autocmd BufWinEnter * if index(trailingIgnoreFT, &ft) > 0 | call clearmatches() | endif
-- 	autocmd WinEnter * if index(trailingIgnoreFT, &ft) < 0 | match Error /\s\+$/ | endif
-- 	" autocmd BufWinEnter * if index(trailingIgnoreFT, &ft) < 0 | call clearmatches() | endif
--
-- 	" match Error /\s\+$/
--
-- 	" autocmd BufWinEnter <buffer> match Error /\s\+$/
-- 	" autocmd InsertEnter <buffer> match Error /\s\+$/
-- 	" autocmd InsertLeave <buffer> match Error /\s\+$/
-- 	" autocmd BufWinLeave <buffer> call clearmatches()
-- augroup END
-- ]]

vim.cmd[[
" Disable line number in terminal buffers
autocmd TermOpen * :set nonumber norelativenumber
]]

-- Disable indent_blankline when in diff
vim.cmd[[
if &diff
	let g:indent_blankline_enabled = v:false
endif
]]
