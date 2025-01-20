local function follow_symlink()
	local filepath = vim.fn.expand('%:p')
	local resolved = vim.fn.resolve(filepath)

	if filepath == resolved then
		return
	end

	vim.cmd [[ silent! Bwipeout ]]
	vim.fn.execute('edit ' .. vim.fn.fnameescape(resolved))
	vim.cmd [[ redraw ]]
end
vim.api.nvim_create_user_command("FollowSymlink", follow_symlink, { nargs=0 })

function ShowCheatsheet()
  vim.cmd('vsplit')
  local win = vim.api.nvim_get_current_win()
  local buf = vim.api.nvim_create_buf(true, true)
  vim.api.nvim_buf_set_name(buf, "CHEAT SHEET")
  vim.api.nvim_win_set_buf(win, buf)
  vim.cmd('edit testing.txt')
end



-------------------------------------------------------------------------------
-- Git Worktree Functions                                                    --
-------------------------------------------------------------------------------
function GitWorktreeAdd(args)
	vim.ui.input({
		prompt = "Worktree name: "
	}, function(input)
		if input ~= nil then
			-- HOW TO CLEAR COMMAND LINE OR INSERT NEW LINE?!
			local output = vim.fn.system(string.format("git worktree add %s", name))
			vim.api.nvim_echo({{"\n"}, {output}}, false, {})
		else
			print("Add worktree cancelled")
		end
	end)
end
vim.api.nvim_create_user_command("WorktreeAdd", GitWorktreeAdd, { nargs=0 })




-------------------------------------------------------------------------------
-- Codewars Jest Test Current Folder                                         --
--                                                                           --
-- Run jest tests for the current folder, looking for "*.solution.ts" file.  --
-------------------------------------------------------------------------------
function CodewarsTestFile()
  local Terminal = require('toggleterm.terminal').Terminal

  local path = vim.api.nvim_buf_get_name(0)
  local parts = string.gmatch(path, "([^.]+)")
  local p = {}

  for str in parts do
    table.insert(p, str)
  end
  table.insert(p, #p, "test")
  local target = table.concat(p, ".")
  -- vim.cmd(":!npx jest " .. target)
  local term = Terminal:new({
    cmd = "npx jest " .. target,
    dir = vim.fn.expand("%:p:h"),
    hidden = false,
    close_on_exit = false
  })
  term:toggle()
end
vim.api.nvim_create_user_command("CodewarsTest", CodewarsTestFile, { nargs=0 })

-- Toggle is wonky if you close the tab and try to maximize again. I will just tabc the tab myself.
-- function MaximizeToggle()
--     if vim.g.maximize_buffer ~= nil then
--         vim.g.maximize_buffer = nil
--         vim.cmd('tabclose')
--     else
--         vim.g.maximize_buffer = true
--         vim.cmd('tabedit %')
--         vim.fn.setpos(".", current_pos)
--     end
-- end
function MaximizeToggle()
    -- Create new tab with the current buffer and move to the correct line #.
    local current_pos = vim.fn.getcurpos()
    vim.cmd('tabedit %')
    vim.fn.setpos(".", current_pos)
end

-- vim.api.nvim_add_user_command("ToggleWrap", function()
--     if vim.wo.wrap == true then
--         vim.opt.wrap = false
--         print("Line wrap OFF")
--     else
--         vim.opt.wrap = true
--         print("Line wrap ON")
--     end
-- end, {})

function ToggleWrap()
    if vim.wo.wrap == true then
        vim.opt.wrap = false
        print("Line wrap OFF")
    else
        vim.opt.wrap = true
        print("Line wrap ON")
    end
end

function TabsSpaces()
    if vim.api.nvim_buf_get_option(0, 'expandtab') == true then
        vim.api.nvim_buf_set_option(0, 'expandtab', false)
        print("Using TABS")
    else
        vim.api.nvim_buf_set_option(0, 'expandtab', true)
        print("Using SPACES")
    end
end

function ConvertTabsSpaces()
    if vim.api.nvim_buf_get_option(0, 'expandtab') == true then
        vim.cmd('%s/\\t/\\ \\ \\ \\ /g')
        print("Converted TABS to SPACES")
    else
        vim.cmd('%s/\\ \\ \\ \\ /\\t/g')
        print("Converted SPACES to TABS")
    end
end

function FontSize(amount, reset)
  vim.opt.guifont = string.gsub(vim.opt.guifont._value, ":h(%d+)", function(n)
    local size = n

    if reset == true or reset == "true" then
      size = amount
    else
      size = size + amount
    end

    return string.format(":h%d", size)
  end)
end
vim.api.nvim_create_user_command("FontSize", function(opts)
  FontSize(opts.fargs[1], opts.fargs[2])
end, { nargs = "+" })


function FontPrint()
    print("Font is currently " .. vim.opt.guifont._value)
end
vim.api.nvim_create_user_command("FontPrint", FontPrint, {})

function ToggleLineNumbers()
    if vim.api.nvim_win_get_option(0, 'relativenumber') then
        vim.api.nvim_win_set_option(0, 'number', true)
        vim.api.nvim_win_set_option(0, 'relativenumber', false)
    else
        vim.api.nvim_win_set_option(0, 'number', true)
        vim.api.nvim_win_set_option(0, 'relativenumber', true)
    end
end

function ToggleNoNumbers()
    if vim.api.nvim_win_get_option(0, 'number') == true then
        vim.api.nvim_win_set_option(0, 'number', false)
    else
        vim.api.nvim_win_set_option(0, 'number', true)
    end
end

function GetOct2Bin(n)
    local oct2bin = {
        ['0'] = '000',
        ['1'] = '001',
        ['2'] = '010',
        ['3'] = '011',
        ['4'] = '100',
        ['5'] = '101',
        ['6'] = '110',
        ['7'] = '111'
    }
    return oct2bin[n]
end


function DecimalToBinary8Bits(n)
    local s = string.format('%.2o', n)
    s = s:gsub('.', GetOct2Bin)
    s = s:sub(2)
    return s
end

function Binary8BitsToDecimal(n)
    return tonumber(tostring(n), 2)
end

function DecimalToHex(n)
    return string.format("0x%x", n)
end

function HexToDecimal(n)
    return tonumber(tostring(n), 16)
end

function ToggleOverLength()
    if vim.g.hideoverlength == nil or vim.g.hideoverlength == false then
        vim.cmd('match OverLength //')
        vim.g.hideoverlength = true
    else
        vim.cmd('match OverLength /\\%81v.\\+/')
        vim.g.hideoverlength = false
    end
end

function ToggleDiagnosticVirtualText()
    if vim.g.hidediagnostics == nil or vim.g.hidediagnostics == true then
        vim.diagnostic.config({virtual_text = true})
        vim.g.hidediagnostics = false
    else
        vim.diagnostic.config({virtual_text = false})
        vim.g.hidediagnostics = true
    end
end

function FormatFileOnSaveIfEnabled()
    if vim.g.enable_format_on_save == nil or vim.g.enable_format_on_save == false then
        print("File formatting on save currently disabled")
    else
        vim.lsp.buf.formatting_sync()
        print("Format file done")
    end
end

function ToggleFormatFileOnSave()
    if vim.g.enable_format_on_save == nil or vim.g.enable_format_on_save == false then
        print("File formatting on save enabled")
        vim.g.enable_format_on_save = true
    else
        print("File formatting on save disabled")
        vim.g.enable_format_on_save = false
    end
end

function ToggleLspSignature()
    if _LSP_SIG_CFG.floating_window == true then
        _LSP_SIG_CFG.floating_window = false
        if _LSP_SIG_CFG.winnr and _LSP_SIG_CFG.winnr > 0 then
            if vim.api.nvim_win_is_valid(_LSP_SIG_CFG.winnr) then
                vim.api.nvim_win_close(_LSP_SIG_CFG.winnr, true)
            end
            _LSP_SIG_CFG.winnr = nil
            _LSP_SIG_CFG.bufnr = nil
            _LSP_SIG_CFG.startx = nil
        end
    else
        _LSP_SIG_CFG.floating_window = true
    end
end

--- Get Highlighting ----------------------------------------------------------
-- This is no longer needed as of Neovim 0.9. It now comes with comment
-- :Inspect

-- vim.cmd[[
-- function! SynStack()
--     if !exists("*synstack")
--         return
--     endif
--
--     echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
--     echo map(synstack(line('.'), col('.')), 'synIDattr(synIDtrans(v:val), "name")')
-- endfunction
--
-- nnoremap <leader>9 :call SynStack()<CR>
-- ]]
vim.cmd[[nnoremap <Leader>9 :Inspect<CR>]]

--- Restore View --------------------------------------------------------------
vim.cmd[[
" Saves code folding.
if exists("g:loaded_restore_view")
    finish
endif

let g:loaded_restore_view = 1

if !exists("g:skipview_files")
    let g:skipview_files = []
endif

function! MakeViewCheck()
    if &l:diff | return 0 | endif
    if &buftype != '' | return 0 | endif
    if expand('%') =~ '\[.*\]' | return 0 | endif
    if empty(glob(expand('%:p'))) | return 0 | endif
    if &modifiable == 0 | return 0 | endif
    if len($TEMP) && expand('%:p:h') == $TEMP | return 0 | endif
    if len($TMP) && expand('%:p:h') == $TMP | return 0 | endif

    let file_name = expand('%:p')
    for ifiles in g:skipview_files
        if file_name =~ ifiles
            return 0
        endif
    endfor

    return 1
endfunction

" Removed: Causes directory to automatically change when opening files.
" Fixed: Does not save cwd if viewoptions is not set to curdir or options.
augroup AutoView
    autocmd!
    " Autosave & Load Views.
    autocmd BufWritePre,BufWinLeave ?* if MakeViewCheck() | silent! mkview | endif
    autocmd BufWinEnter ?* if MakeViewCheck() | silent! loadview | endif
augroup END
" ]]




-- vim.api.nvim_create_user_command("Test", require("functions.nvim-tree").mark_all_visible, { nargs=0 })
-- vim.api.nvim_create_user_command("Test2", require("functions.nvim-tree").unmark_all_visible, { nargs=0 })

function _new_floaterm_input()
	-- local input_name = vim.fn.input({
	-- 	prompt = "New Floaterm Name (blank for default name): ",
	-- 	default = '',
	-- 	cancelreturn = "::CANCEL::",
	-- })
	vim.ui.input({
		prompt = "New Floaterm Name (blank for default name): ",
		default = '',
	}, function(input)
		if input == nil then
			return
		end

		if input == '' then
			vim.cmd(':FloatermNew')
		else
			vim.cmd(string.format(':FloatermNew --title=%s', string.gsub(input, ' ', '\\ ')))
		end
	end)
end

function _tab_rename()
	vim.ui.input({
		prompt = "New tab name: ",
		default = '',
	}, function(input)
		if input == nil or input == "" then
			return
		end

		-- vim.cmd(string.format(':TabRename %s', string.gsub(input, ' ', '\\ ')))
		vim.cmd(string.format(':TabRename %s', input))
	end)
end
