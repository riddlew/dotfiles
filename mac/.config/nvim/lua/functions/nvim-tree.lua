local Core = require("nvim-tree.core")
local Api = require("nvim-tree.api")
local Marks = require("nvim-tree.marks")
local Utils = require("nvim-tree.utils")
local CopyPaste = require("nvim-tree.actions.fs.copy-paste")
local Rename = require("nvim-tree.actions.fs.rename-file")
local notify = require('nvim-tree.notify')
local Renderer = require('nvim-tree.renderer')
local Iterator = require('nvim-tree.iterators.node-iterator')
local CopyPaste = require('nvim-tree.actions.fs.copy-paste')

local M = {}

-- Used as part of name for mass rename buffer.
local function guid()
    local seed={'e','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'}
    local tb={}
    for _=1,32 do
        table.insert(tb,seed[math.random(1,16)])
    end
    local sid=table.concat(tb)
    return string.format('%s%s%s%s%s',
        string.sub(sid,1,8),
        string.sub(sid,9,12),
        string.sub(sid,13,16),
        string.sub(sid,17,20),
        string.sub(sid,21,32)
    )
end

-- -- Unmark all nodes.
-- function M.unmark_all()
--   local marks = Marks.get_marks()
--   for _, n in ipairs(marks) do
--     Api.marks.toggle(n)
--   end
-- end

-- Handler for the mass rename marked files function.
local function handle_rename_save(buf, marks)
  local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
  for _, l in ipairs(lines) do
    -- Split each line  (before <- after)
    -- local sep = string.find(l, " <- ")
    local sep_start, sep_end = string.find(l, " << ")
    if sep_start ~= nil and sep_end ~= nil then
      local after = string.sub(l, 0, sep_start)
      local before = string.sub(l, sep_end + 1)
      for _, n in ipairs(marks) do
        print(n.absolute_path)
        -- Check to ensure nothing's changed in the before part.
        if(n.absolute_path == before) then
          -- Rename and toggle mark.
          Rename.rename(n, after)
          Api.marks.toggle(n)
        end
      end
    end
  end
  vim.api.nvim_buf_delete(buf, { force = true })
  Marks.clear_marks()
end

-- Recurse visible directories and perform action_func on visible non-directories.
local function visible_recurse(nodes, action_func)
  for _, node in pairs(nodes) do
    if node.type == "directory" then
      visible_recurse(node.nodes)
    else
      action_func(node)
    end
  end
end

-- Mark all files that are not hidden, such as those still shown after a live
-- filter.
function M.mark_all_visible()
  local root = Core.get_explorer()
  visible_recurse(root.nodes, function(node)
    if node.hidden == false and not Marks.get_mark(node) then
      Api.marks.toggle(node)
    end
  end)
end

-- Unmark all files that are not hidden, such as those still shown after a live
-- filter.
function M.unmark_all_visible()
  local root = Core.get_explorer()
  visible_recurse(root.nodes, function(node)
    if node.hidden == false and Marks.get_mark(node) then
      Api.marks.toggle(node)
    end
  end)
end

-- Toggle marks on all files that are not hidden, such as those still shown
-- after a live filter.
function M.toggle_all_visible()
  local root = Core.get_explorer()
  visible_recurse(root.nodes, function(node)
    if node.hidden == false then
      Api.marks.toggle(node)
    end
  end)
end

-- Mass rename all marked files. Opens a new buffer with a filepath format of:
--
--    path/before/rename/filename -> path/after/rename/filename
--
-- If the buffer is deleted, the rename is cancelled. Save the buffer to execute
-- the rename.

-- @todo: Need a better solution than "before -> after". Files with varying
-- filename lengths make it hard to mass-rename with <C-v>.
-- 
-- 1. Put the after first instead?
--          /some/path/after.rb << /some/path/before.rb
--          or
--          /some/path/after.rb (/some/path/before.rb)

-- @note: hypen doesn't work in string.find?

-- @todo: when renaming files, you have to hit enter multiple times. Make it
-- so they all execute at once instead.
-- @todo: when renamed, it doesn't seem to save the filetype. But normal
-- single file rename works. What does that function do to keep the filetype?
function M.rename_marked()
  local marks = Marks.get_marks()

  if #marks == 0 then
    notify.warn "no files are marked, aborting mass rename."
    return
  end

  local bufname = "nvim-tree://rename/" .. guid()

  vim.cmd('vsplit')
  local win = vim.api.nvim_get_current_win()
  local buf = vim.api.nvim_create_buf(true, false)
  vim.api.nvim_buf_set_name(buf, bufname)
  vim.api.nvim_win_set_buf(win, buf)

  local names = {}
  for _, n in ipairs(marks) do
    table.insert(names, string.format("%s << %s", n.absolute_path, n.absolute_path))
  end

  vim.api.nvim_buf_set_lines(buf, 0, 0, false, names)
  vim.api.nvim_win_set_cursor(win, {1, 0})

  vim.api.nvim_create_autocmd({"BufWrite"}, {
    pattern = { bufname },
    callback = function() 
        handle_rename_save(buf, marks) end
  })
  vim.api.nvim_create_autocmd({"BufDelete"}, {
    pattern = { bufname },
    callback = function()
      vim.notify("Renaming cancelled", vim.log.levels.INFO)
    end
  })
end

-- -- Copy the filename of marked nodes.
-- function M.copy_marked_filenames()
--   local marks = Marks.get_marks()
--
--   if #marks == 0 then
--     notify.info("No files are marked.")
--   else
--     -- copy marked
--     local info = {}
--     for _, n in ipairs(marks) do
--       table.insert(info, n.name)
--     end
--
--     if CopyPaste.use_system_clipboard == true then
--       vim.fn.setreg("+", info)
--       vim.fn.setreg('"', info)
--       notify.info(string.format("Copied %d filenames to system clipboard!", #marks))
--     else
--       vim.fn.setreg('"', info)
--       vim.fn.setreg("1", info)
--       notify.info(string.format("Copied %d filenames to neovim clipboard!", #marks))
--     end
--   end
-- end
--
-- -- Copy the relative filepaths of marked nodes.
-- function M.copy_marked_filepaths()
--   local marks = Marks.get_marks()
--
--   if #marks == 0 then
--     notify.info("No files are marked.")
--   else
--     -- copy marked
--     local info = {}
--     for _, n in ipairs(marks) do
--       -- table.insert(info, n.absolute_path)
--       local rel_path = Utils.path_relative(n.absolute_path, Core.get_cwd())
--       local content = n.nodes ~= nil and Utils.path_add_trailing(rel_path) or rel_path
--       table.insert(info, content)
--     end
--
--     if CopyPaste.use_system_clipboard == true then
--       vim.fn.setreg("+", info)
--       vim.fn.setreg('"', info)
--       notify.info(string.format("Copied %d filepaths to system clipboard!", #marks))
--     else
--       vim.fn.setreg('"', info)
--       vim.fn.setreg("1", info)
--       notify.info(string.format("Copied %d filepaths to neovim clipboard!", #marks))
--     end
--   end
-- end
--
-- -- Copy the absolute filepaths of marked nodes.
-- function M.copy_marked_absolute_filepaths()
--   local marks = Marks.get_marks()
--
--   if #marks == 0 then
--     notify.info("No files are marked.")
--   else
--     -- copy marked
--     local info = {}
--     for _, n in ipairs(marks) do
--       table.insert(info, n.absolute_path)
--     end
--
--     if CopyPaste.use_system_clipboard == true then
--       vim.fn.setreg("+", info)
--       vim.fn.setreg('"', info)
--       notify.info(string.format("Copied %d absolute filepaths to system clipboard!", #marks))
--     else
--       vim.fn.setreg('"', info)
--       vim.fn.setreg("1", info)
--       notify.info(string.format("Copied %d absolute filepaths to neovim clipboard!", #marks))
--     end
--   end
-- end

-- Add marked nodes to the clipbaord to be copied.
-- function M.copy_marked_nodes()
--   local marks = Marks.get_marks()
--
--   if #marks == 0 then
--     Utils.notify.info("No files are marked.")
--   else
--     -- copy marked
--     for _, n in ipairs(marks) do
--       CopyPaste.copy(n)
--     end
--
--     CopyPaste.print_clipboard()
--   end
-- end

-- Add marked nodes to the clipbaord to be cut.
-- function M.cut_marked_nodes()
--   local marks = Marks.get_marks()
--
--   if #marks == 0 then
--     Utils.notify.info("No files are marked.")
--   else
--     -- copy marked
--     for _, n in ipairs(marks) do
--       CopyPaste.cut(n)
--     end
--
--     CopyPaste.print_clipboard()
--   end
-- end

-- @todo: delete_marked_nodes function and map it to MD
-- @todo: trash_marked_nodes function and map it to MT

-- Collapse selected directory and child directories recursively.
function M.collapse_directory(node)
    if node.name == ".." then
        node = Core.get_explorer()
    elseif node.type ~= "directory" then
        node = node.parent
    end

    Iterator.builder(node.nodes)
        :hidden()
        :applier(function(n)
            if n.nodes ~= nil then
                n.open = false
            end
        end)
        :recursor(function(n)
            return n.nodes
        end)
        :iterate()

    node.open = false
    Renderer.draw()
end

return M
