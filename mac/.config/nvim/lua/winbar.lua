-- Based off of the config at
-- https://github.com/cseickel/dotfiles/blob/main/config/nvim/winbar.lua

local M = {}

local mode_map = {
  ['n']      = {'N',       "%#StatusLineModeNormal#"},
  ['no']     = {'O',       "%#StatusLineModePending#"},
  ['nov']    = {'O',       "%#StatusLineModePending#"},
  ['noV']    = {'O',       "%#StatusLineModePending#"},
  ['no\22']  = {'O',       "%#StatusLineModePending#"},
  ['niI']    = {'N',       "%#StatusLineModeNormal#"},
  ['niR']    = {'N',       "%#StatusLineModeNormal#"},
  ['niV']    = {'N',       "%#StatusLineModeNormal#"},
  ['nt']     = {'N',       "%#StatusLineModeNormal#"},
  ['v']      = {'V',       "%#StatusLineModeVisual#"},
  ['vs']     = {'V',       "%#StatusLineModeVisual#"},
  ['V']      = {'VL',      "%#StatusLineModeVLine#"},
  ['Vs']     = {'VL',      "%#StatusLineModeVLine#"},
  ['\22']    = {'VB',      "%#StatusLineModeVBlock#"},
  ['\22s']   = {'VB',      "%#StatusLineModeVBlock#"},
  ['s']      = {'S',       "%#StatusLineModeSelect#"},
  ['S']      = {'SL',      "%#StatusLineModeSLine#"},
  ['\19']    = {'SB',      "%#StatusLineModeSBlock#"},
  ['i']      = {'I',       "%#StatusLineModeInsert#"},
  ['ic']     = {'I',       "%#StatusLineModeInsert#"},
  ['ix']     = {'I',       "%#StatusLineModeInsert#"},
  ['R']      = {'R',       "%#StatusLineModeReplace#"},
  ['Rc']     = {'R',       "%#StatusLineModeReplace#"},
  ['Rx']     = {'R',       "%#StatusLineModeReplace#"},
  ['Rv']     = {'VR',      "%#StatusLineModeVReplace#"},
  ['Rvc']    = {'VR',      "%#StatusLineModeVReplace#"},
  ['Rvx']    = {'VR',      "%#StatusLineModeVReplace#"},
  ['c']      = {':',       "%#StatusLineModeCommand#"},
  ['cv']     = {'EX',      "%#StatusLineModeEx#"},
  ['ce']     = {'EX',      "%#StatusLineModeEx#"},
  ['r']      = {'R',       "%#StatusLineModeReplace#"},
  ['rm']     = {'MORE',    "%#StatusLineModeMore#"},
  ['r?']     = {'CONFIRM', "%#StatusLineModeConfirm#"},
  ['!']      = {'SHELL',   "%#StatusLineModeShell#"},
  ['t']      = {'TERM',    "%#StatusLineModeTerminal#"},
}

-- Custom winbar names for specific filetypes
local winbar_filetype_names = {
  ["fern"] = "Fern"
}

local colors = {
  reset                   = "%*",
  winbar_error            = "%#WinBarError#",
  winbar_warning          = "%#WinBarWarn#",
  winbar_info             = "%#WinBarInfo#",
  winbar_hint             = "%#WinBarHint#",
  winbar_location         = "%#WinBarLocation#",
  statusline_normal       = "%#StatusLine#",
  statusline_section_2    = "%#StatusLine2#",
  statusline_name_error   = "%#StatusLineNameError#",
  statusline_name_warning = "%#StatusLineNameWarning#",
  statusline_name_info    = "%#StatusLineNameInfo#",
  statusline_name_hint    = "%#StatusLineNameHint#",
  statusline_git_add      = "%#StatusLineGitAdd#",
  statusline_git_delete   = "%#StatusLineGitDelete#",
  statusline_git_change   = "%#StatusLineGitChange#",
}

local isempty = function(s)
  return s == nil or s == ""
end

local has_key = function(t, key)
  return t[key] ~= nil
end

local is_truncated = function(width)
  local current_width = vim.api.nvim_win_get_width(0)
  return current_width < width
end

M.get_diagnostic_color = function(location)
  local d = vim.diagnostic.get(0)
  local error_color, warning_color, info_color, hint_color, normal_color = "", "", "", "", ""

  if location == "winbar" then
    error_color = colors.winbar_error
    warning_color = colors.winbar_warning
    info_color = colors.winbar_info
    hint_color = colors.winbar_hint
    normal_color = ""
  else
    error_color = colors.statusline_name_error
    warning_color = colors.statusline_name_warning
    info_color = colors.statusline_name_info
    hint_color = colors.statusline_name_hint
    normal_color = colors.statusline_normal
  end

  if #d == 0 then
    return normal_color
  end

  local min_severity = 100
  for _, diag in ipairs(d) do
    if diag.severity < min_severity then
      min_severity = diag.severity
    end
  end

  if min_severity == vim.diagnostic.severity.ERROR then
    return error_color
  elseif min_severity == vim.diagnostic.severity.WARN then
    return warning_color
  elseif min_severity == vim.diagnostic.severity.INFO then
    return info_color
  elseif min_severity == vim.diagnostic.severity.HINT then
    return hint_color
  else
    return normal_color
  end
end

M.get_filename = function(location)
  -- How to get current tab? is_current is unreliable
  if location == "winbar" then
    local filename = vim.fn.resolve(vim.fn.expand("%:~:."))
    if filename == "" then
      filename = "[No Name]"
    end
    return table.concat({
      -- M.get_diagnostic_color("winbar"),
      filename,
      " ",
      colors.reset
    })
  else
    return table.concat({
      -- M.get_diagnostic_color("statusline"),
      -- " %f ",
      vim.fn.getcwd(),
    })
  end
end

M.get_modified_read_only = function()
  local text = ""

  if vim.bo.readonly then
    text = "[RO] "
  end

  if vim.bo.modified then
    text = text .. "[+] "
  end

  return text
end

M.get_git_changes = function()
  local changes = vim.b.gitsigns_status
  if isempty(changes) then
    return ""
  else
    changes = string.gsub(changes, "+", "%" .. colors.statusline_git_add .. "+")
    changes = string.gsub(changes, "-", "%" .. colors.statusline_git_delete .. "-")
    changes = string.gsub(changes, "~", "%" .. colors.statusline_git_change .. "~")
    return changes .. " "
  end
end

M.get_location = function()
  local success, result = pcall(function ()
    -- if not is_current() then
    --   return ""
    -- end
    local provider = require("nvim-navic")
    if not provider.is_available() then
      return ""
    end

    local location = provider.get_location({})
    if not isempty(location) and location ~= "error" then
      return table.concat({
        colors.winbar_location,
        "  ",
        location,
        colors.reset
      })
    else
      return ""
    end
  end)

  if not success then
    return ""
  end
  return result
end

M.get_git_branch = function()
  local branch = vim.b.git_branch
  if isempty(branch) then
    return ""
  else
    -- return "   " .. branch .. " "
    -- return " שׂ " .. branch .. " "
    return " 󰘬 " .. branch .. " "
  end
end

M.get_mode = function ()
  local mode_code = vim.api.nvim_get_mode().mode
  local mode = mode_map[mode_code][1] or string.upper(mode_code)
  local mode_text = mode_map[mode_code][2] or string.upper(mode_code)-- [+]
  return table.concat({
    mode_text,
    " ",
    mode,
    " ",
    colors.reset
  })
end

M.get_filetype = function()
  -- if is_truncated(80) then
  --   return ""
  -- else
  --   if vim.bo.filetype ~= "" then
  --     return "[" .. vim.bo.filetype .. "] "
  --   else
  --     return ""
  --   end
  -- end
  if vim.bo.filetype ~= "" then
    return "[" .. vim.bo.filetype .. "] "
  else
    return ""
  end
end

M.get_git_section = function()
  local branch = M.get_git_branch()
  if isempty(branch) then
    return ""
  end

  local stats = M.get_git_changes()
  return table.concat({
    colors.statusline_section_2,
    branch,
    stats,
    colors.reset
  })

end

M.get_format = function()
  return vim.bo.fileformat
end

M.get_diag_counts = function (location)
  local d = vim.diagnostic.get(0)
  if #d == 0 then
    return ""
  end

  local error_color, warning_color, hint_color, info_color, normal_color = "", "", "", "", ""
  if location == "winbar" then
    error_color = colors.winbar_error
    warning_color = colors.winbar_warning
    info_color = colors.winbar_info
    hint_color = colors.winbar_hint
    normal_color = ""
  else
    error_color = colors.statusline_name_error
    warning_color = colors.statusline_name_warning
    info_color = colors.statusline_name_info
    hint_color = colors.statusline_name_hint
    normal_color = colors.statusline_normal
  end

  local grouped = {}
  for _, diag in ipairs(d) do
    local severity = diag.severity
    if not grouped[severity] then
      grouped[severity] = 0
    end
    grouped[severity] = grouped[severity] + 1
  end

  local result = ""
  local S = vim.diagnostic.severity
  if grouped[S.ERROR] then
    -- result = result .. "%#StatusLineError#" .. grouped[S.ERROR] .. "  %*"
    result = result .. error_color .. " " .. grouped[S.ERROR] .. " " .. colors.reset
  end
  if grouped[S.WARN] then
    -- result = result .. "%#StatusLineWarn#" .. grouped[S.WARN] .. "  %*"
    result = result .. warning_color .. " " .. grouped[S.WARN] .. " " .. colors.reset
  end
  if grouped[S.INFO] then
    -- result = result .. "%#StatusLineInfo#" .. grouped[S.INFO] .. "  %*"
    result = result .. info_color .. " " .. grouped[S.INFO] .. " " .. colors.reset
  end
  if grouped[S.HINT] then
    -- result = result .. "%#StatusLineHint#" .. grouped[S.HINT] .. "  %*"
    result = result .. hint_color .. " " .. grouped[S.HINT] .. " " .. colors.reset
  end
  return result
end

M.get_tab_info = function()
  local is_spc = vim.bo.expandtab
  local width = vim.bo.tabstop
  return string.format("[%s %d] ", is_spc and "SPC" or "TAB", width)
end

M.get_lsp_progress = function()
  if #vim.lsp.buf_get_clients() == 0 then
    return ''
  end


  -- print(#vim.lsp.get_active_clients({
  --   bufnr = vim.api.nvim_win_get_buf(0)
  -- }))
  -- print(vim.inspect(vim.lsp.get_active_clients({
  --   bufnr = vim.api.nvim_win_get_buf(0)
  -- })[2].progress))
  local t = vim.lsp.get_active_clients({
    bufnr = vim.api.nvim_win_get_buf(0)
  })[2].progress
  -- for k,v in pairs(t) do
  --   print(k)
  -- end

  if #t._items == 0 then
    return ''
  end
  -- vim.api.nvim_buf_set_lines(buf, 1,  -1, true, {"hi"})
  -- local lsp = vim.lsp.status()[1]
  -- if lsp ~= "" then
  --   local name = lsp.name or ''
  --   local msg = lsp.message or ''
  --   local percentage = lsp.percentage or 0
  --   local title = lsp.title or ''
  --
  --   return string.format(" %%<%s: %s %s (%s%%%%) ", name, title, msg, percentage)
  -- end

  return t._items[#t._items].value.message
end

M.get_winbar = function()
  -- floating window
  local cfg = vim.api.nvim_win_get_config(0)
  if cfg.relative > "" or cfg.external then
    return ""
  end

  if has_key(winbar_filetype_names, vim.bo.filetype) then
    return winbar_filetype_names[vim.bo.filetype]
  end

  if vim.bo.buftype == "terminal" then
    if vim.bo.filetype == "toggleterm" then
        return string.format("TERM %d", vim.b.toggle_number)
    else
      return "TERM"
    end
    -- return table.concat({
    --   "TERMINAL ",
    --   colors.winbar_location,
    --   " %{b:term_title}",
    --   colors.reset
    -- })
  else
    local buftype = vim.bo.buftype
    -- real files do not have buftypes
    if isempty(buftype) then
      local filename = M.get_filename("winbar")
      local modified = M.get_modified_read_only()
      -- local location = M.get_location()
      local diag = M.get_diag_counts("winbar")
      -- print(vim.inspect(diag))

      return table.concat({
        "%<",
        filename,
        modified,
        diag
        -- "%=",
        -- location,
      })
    else
      -- Quickfix, help, etc
      return "%( %h%) %f"
    end
  end
end

M.get_statusline = function()
  local mode = M.get_mode()
  local git = M.get_git_section()
  local tabinfo = M.get_tab_info()
  local filename = M.get_filename("statusline")
  local modified = M.get_modified_read_only()
  local filetype = M.get_filetype()
  local fileformat = M.get_format()
  local lines_columns = " %l/%L(%p%%):%c"
  local diag = M.get_diag_counts()

  if vim.bo.buftype == "terminal" then
    local ftbufs = vim.api.nvim_call_function("floaterm#buflist#gather", {})
    local cnt = #ftbufs

    if cnt > 0 then
      -- This is a floaterm buffer
      local cur = vim.api.nvim_call_function("floaterm#buflist#curr", {})
      local idx = vim.fn.index(ftbufs, cur) + 1
      local ftname = vim.api.nvim_call_function("floaterm#config#get", {cur, "title"})

      -- Transform "[ NAME ]" into "NAME"
      ftname = string.sub(string.sub(ftname, 3, -1), 0, -3)

      -- Or whatever vim.g.floaterm_title is set to (currently "[ $1 ]")
      if ftname == "$1" then
        ftname = ""
      else
        ftname = "\"" .. ftname .. "\" "
      end

      filename = table.concat({
        " floaterm ",
        ftname,
        "(",
        idx,
        "/",
        cnt,
        ")"
      })
    end

    filename = table.concat({
      filename
    })
  end

  local modules = {
    mode,
    -- '%{fnamemodify(getcwd(), ":~")}/ ',
    git,
    " ",
    "%<",
    filename,
    -- modified,
    "%=",
    tabinfo,
    -- diag,
    filetype,
    fileformat,
    lines_columns,
    " "
  }
  return table.concat(modules)
end

vim.cmd([[
  augroup GitBranchGroup
      autocmd!
      autocmd BufEnter * let b:git_branch = FugitiveHead()
  augroup END
]])

_G.winbar = M
vim.o.winbar="%{%v:lua.winbar.get_winbar()%}"
vim.o.statusline="%{%v:lua.winbar.get_statusline()%}"

return M
