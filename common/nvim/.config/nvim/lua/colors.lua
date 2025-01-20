local function hi(group, style)
    local fg = "NONE"
    local ctermfg = "NONE"
    local bg = "NONE"
    local ctermbg = "NONE"
    local sp = "NONE"
    local gui = "NONE"
    local cterm = "NONE"

    if style.fg ~= nil then
        if style.fg.gui ~= nil then
            fg = style.fg.gui
        end
        if style.fg.cterm ~= nil then
            ctermfg = style.fg.cterm
        end
    end

    if style.bg ~= nil then
        if style.bg.gui ~= nil then
            bg = style.bg.gui
        end
        if style.bg.cterm ~= nil then
            ctermbg = style.bg.cterm
        end
    end

    if style.sp ~= nil then
        sp = style.sp.gui
    end

    if style.gui ~= nil then
        gui = style.gui
    end

    if style.cterm ~= nil then
        cterm = style.cterm
    end

    local command = string.format("highlight %s guifg=%s guibg=%s guisp=%s gui=%s ctermfg=%s ctermbg=%s cterm=%s", group, fg, bg, sp, gui, ctermfg, ctermbg, cterm)
    vim.cmd(command)
end

-- vim.cmd('colorscheme hackthebox_customized')
-- vim.cmd('colorscheme jellybeans')
-- vim.cmd('colorscheme tedious')
-- vim.cmd('colorscheme material_darker_high_contrast_custom')
-- vim.cmd('colorscheme lush_material_custom')
-- vim.cmd('colorscheme lush_gruvbox_custom_dark')
-- vim.cmd('colorscheme lush_gruvbox_v2')
-- vim.cmd('colorscheme lush_between')
-- vim.cmd('colorscheme visual_studio_code')
vim.cmd('colorscheme catppuccin')

-- vim.cmd('colorscheme paramount')
-- vim.cmd('hi Normal guibg=#262626 gui=none')

-- vim.cmd('colorscheme monochrome')
-- vim.cmd('hi Normal guibg=#262626 gui=none')

-- vim.cmd('hi Comment gui=none cterm=none')
-- vim.cmd('hi CursorLine cterm=none ctermfg=59 guifg=none guibg=#273143 gui=none')

-- vim.cmd('hi CursorLineNr cterm=bold ctermfg=Yellow guifg=yellow gui=bold')
-- vim.cmd('hi MatchParen cterm=bold ctermfg=white ctermbg=red gui=bold guifg=white guibg=red')
-- vim.cmd('hi Cursor cterm=none ctermfg=black ctermbg=white gui=none guifg=black guibg=white')
-- vim.cmd('hi NonText cterm=none ctermfg=59 guifg=#5C6370 gui=none')
-- vim.cmd('hi Whitespace cterm=none ctermfg=59 guifg=#5C6370 gui=none')
-- vim.cmd('hi SpecialKey cterm=none ctermfg=59 guifg=#5C6370 gui=none')
-- vim.cmd('hi Pmenu cterm=none cterm=none ctermfg=59 guibg=#0a0e14 guifg=#9faaba gui=none')
-- vim.cmd('hi PmenuSel cterm=none cterm=none ctermfg=49 guibg=#13181f guifg=#ffcc5c gui=none')
-- vim.cmd('hi VertSplit cterm=none ctermfg=59 guifg=none guibg=#2c323d gui=none')
-- -- vim.cmd('hi ICursor ctermfg=236 ctermbg=141 guifg=#282A36 guibg=#BD93F9')
-- vim.cmd('hi ICursor ctermfg=236 ctermbg=141 guifg=#282A36 guibg=#dfafff')
-- -- vim.cmd('hi RCursor ctermbg=117 guibg=#8BE9FD')
-- vim.cmd('hi RCursor ctermbg=117 guibg=#5cb2ff')
-- vim.cmd('hi VCursor ctermfg=236 ctermbg=141 guifg=#282A36 guibg=#dfafff')

-- vim.cmd('set guicursor=n-c:block-Cursor')
-- vim.cmd('set guicursor+=i-ci-ve:ver25-ICursor')
-- vim.cmd('set guicursor+=r-cr-o:block-RCursor')
-- vim.cmd('set guicursor+=v:block-VCursor')
-- vim.cmd('set guicursor+=a:blinkon0')

-- Nvim Tree
-- vim.cmd('hi! link NvimTreeEmptyFolderName Keyword')
-- vim.cmd('hi! link NvimTreeFolderName Function')
-- vim.cmd('hi! link NvimTreeOpenedFolderName Type')

-- Current context highlight for indent line.
-- vim.cmd('hi IndentBlanklineContextChar guifg=#ff3e3e gui=nocombine')

-------------------------------------------------------------------------------
-- Colors (Jellybean Theme)                                                  --
-------------------------------------------------------------------------------
local background = { gui = "#151515" }
local white =      { gui = "#e8e8d3" }
local black =      { gui = "#000000" }
local comment =    { gui = "#888888", cterm = "14" }
-- local pmenu =      { gui = "#252525" }
local pmenu =      { gui = "#151515" }
local indentline = { gui = "#252525" }
-- local divider =    { gui = "#242424" }


-------------------------------------------------------------------------------
-- Colors (Global)                                                           --
-------------------------------------------------------------------------------
local diagnostic_red =    { gui = "#EE7B7B", cterm = "210" }
local diagnostic_yellow = { gui = "#FFCC5C", cterm = "221" }
local diagnostic_blue =   { gui = "#5cb2ff", cterm = "75" }
local diagnostic_cyan =   { gui = "#5cecc6", cterm = "86" }

local markdown_green  = { gui = "#C5F467" }
local markdown_blue   = { gui = "#5cb2ff" }
local markdown_yellow = { gui = "#ffcc5c" }
local markdown_purple = { gui = "#dfafff" }
local markdown_red    = { gui = "#ff8484" }
local markdown_cyan   = { gui = "#5cecc6" }

local git_add =    { gui = "#C5F467" }
local git_change = { gui = "#5cb2ff" }
local git_delete = { gui = "#ff8484" }

local search = { gui = "#ffcc5c" }


-------------------------------------------------------------------------------
-- General                                                                   --
-------------------------------------------------------------------------------
-- 79 char column.
-- hi("ColorColumn", { bg = divider})
-- Toggleable overlength > 79 char.
hi("OverLength", { fg = white, bg = { gui = "#511717" }})

-------------------------------------------------------------------------------
-- Custom Markdown Headings (need to load after markdown plugin)             --
-------------------------------------------------------------------------------

hi("htmlH1alt", { fg = markdown_green,  bg = background })
hi("htmlH2alt", { fg = markdown_blue,   bg = background })
hi("htmlH3alt", { fg = markdown_yellow, bg = background })
hi("htmlH4alt", { fg = markdown_purple, bg = background })
hi("htmlH5alt", { fg = markdown_red,    bg = background })
hi("htmlH6alt", { fg = markdown_cyan,   bg = background })


-------------------------------------------------------------------------------
-- Other markdown settings                                                   --
-------------------------------------------------------------------------------
hi("htmlBold", { fg = white, bg = background, gui = "bold"})
hi("htmlItalic", { fg = white, bg = background, gui = "italic"})
hi("htmlBoldItalic", { fg = white, bg = background, gui = "bolditalic"})
hi("htmlStrike", { fg = white, bg = background, gui = "strikethrough"})


-------------------------------------------------------------------------------
-- Fern                                                                      --
-------------------------------------------------------------------------------
-- vim.cmd('hi! link FernBranchText String')
-- vim.cmd('hi! link FernBranchSymbol String')
-- vim.cmd('hi! link FernLeafSymbol Comment')

-------------------------------------------------------------------------------
-- Winbar                                                                    --
-------------------------------------------------------------------------------
-- vim.cmd('highlight WinBar           guifg=#d3d7cf gui=NONE')
-- vim.cmd('highlight WinBarNC         guifg=#999999')
-- vim.cmd('highlight WinBarLocation   guifg=#999999')
--
-- vim.cmd('highlight WinBarNameError   guifg=#ff8484 guibg=NONE')
-- vim.cmd('highlight WinBarNameWarning guifg=#ffcc5c guibg=NONE')


-------------------------------------------------------------------------------
-- StatusLine                                                                --
-------------------------------------------------------------------------------
-- vim.cmd('highlight StatusLine             guifg=#ffffff guibg=#34373e')
-- vim.cmd('highlight StatusLine2            guifg=#ffffff guibg=#515462')
-- vim.cmd('highlight StatusLineNameError    guifg=#ff8484 guibg=#34373e')
-- vim.cmd('highlight StatusLineNameWarning  guifg=#ffcc5c guibg=#34373e')
--
-- vim.cmd('highlight StatusLineModeNormal   guifg=#000000 guibg=#c5f467')
-- vim.cmd('highlight StatusLineModePending  guifg=#000000 guibg=#ffcc5c')
-- vim.cmd('highlight StatusLineModeInsert   guifg=#000000 guibg=#ffcc5c')
-- vim.cmd('highlight StatusLineModeVisual   guifg=#000000 guibg=#53a7f3')
-- vim.cmd('highlight StatusLineModeVLine    guifg=#000000 guibg=#53a7f3')
-- vim.cmd('highlight StatusLineModeVBlock   guifg=#000000 guibg=#53a7f3')
-- vim.cmd('highlight StatusLineModeSelect   guifg=#000000 guibg=#ffffff')
-- vim.cmd('highlight StatusLineModeSLine    guifg=#000000 guibg=#ffffff')
-- vim.cmd('highlight StatusLineModeSBlock   guifg=#000000 guibg=#ffffff')
-- vim.cmd('highlight StatusLineModeReplace  guifg=#000000 guibg=#ff8484')
-- vim.cmd('highlight StatusLineModeVReplace guifg=#000000 guibg=#ff8484')
-- vim.cmd('highlight StatusLineModeCommand  guifg=#000000 guibg=#dfafff')
-- vim.cmd('highlight StatusLineModeEx       guifg=#000000 guibg=#dfafff')
-- vim.cmd('highlight StatusLineModeMore     guifg=#000000 guibg=#999999')
-- vim.cmd('highlight StatusLineModeConfirm  guifg=#000000 guibg=#b7b842')
-- vim.cmd('highlight StatusLineModeShell    guifg=#ffffff guibg=#515462')
-- vim.cmd('highlight StatusLineModeTerminal guifg=#ffffff guibg=#515462')
--
-- vim.cmd('highlight StatusLineGitAdd    guifg=#c5f467 guibg=#515462')
-- vim.cmd('highlight StatusLineGitDelete guifg=#ff8484 guibg=#515462')
-- vim.cmd('highlight StatusLineGitChange guifg=#53a7f3 guibg=#515462')
--
-- vim.cmd('highlight StatusLineError     guifg=#ff8484 guibg=#35373e')
-- vim.cmd('highlight StatusLineWarn      guifg=#ffcc5c guibg=#35373e')
-- vim.cmd('highlight StatusLineInfo      guifg=#53a7f3 guibg=#35373e')
-- vim.cmd('highlight StatusLineHint      guifg=#4ccdd4 guibg=#35373e')

