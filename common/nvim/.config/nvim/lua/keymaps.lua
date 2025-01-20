require('os')
local map = vim.keymap.set

-- Remap shift-del to also delete like backspace (what
-- I have mapped to shift-backspace on macos)
map('i', '<S-Del>', '<BS>', { noremap = true, silent = true })
-- Remap U to redo
map('n', 'U', '<C-r>', { noremap = true, silent = true, desc = "Redo" })
map('v', 'U', '<C-r>', { noremap = true, silent = true, desc = "Redo" })
-- Scroll left / right without having to be on the line.
map('n', '<M-l>', '10zl', { noremap = true, silent = true })
map('n', '<M-h>', '10zh', { noremap = true, silent = true })
-- Yank to end of line.
map('n', 'Y', 'y$', { noremap = true, silent = true })
-- Keeps cursor centered on screen when searching.
map('n', 'n', 'nzzzv', { noremap = true, silent = true })
map('n', 'N', 'Nzzzv', { noremap = true, silent = true })
-- Keeps cursor centered on screen during C-u / C-d.
map('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })
map('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })
-- Tab replaces %
map('n', '<Tab>', '<Plug>(MatchitNormalForward)', { noremap = true, silent = true })
map('v', '<Tab>', '<Plug>(MatchitVisualForward)', { noremap = true, silent = true })
-- <leader>Tab switches between last file.
map('n', '<leader><Tab>', '<C-^>', { noremap = true, silent = true, desc = "visit last file" })
map('v', '<leader><Tab>', '<C-^>', { noremap = true, silent = true, desc = "visit last file" })
-- Undo break points to make undos better for insert mode.
map('i', ',', ',<C-g>u', { noremap = true, silent = true })
map('i', '.', '.<C-g>u', { noremap = true, silent = true })
map('i', '!', '!<C-g>u', { noremap = true, silent = true })
map('i', '?', '?<C-g>u', { noremap = true, silent = true })
map('i', '[', '[<C-g>u', { noremap = true, silent = true })
map('i', '(', '(<C-g>u', { noremap = true, silent = true })
map('i', '{', '{<C-g>u', { noremap = true, silent = true })
map('i', '$', '$<C-g>u', { noremap = true, silent = true })
map('i', '%', '%<C-g>u', { noremap = true, silent = true })
map('i', '^', '^<C-g>u', { noremap = true, silent = true })
map('i', '&', '&<C-g>u', { noremap = true, silent = true })
map('i', '*', '*<C-g>u', { noremap = true, silent = true })
map('i', '-', '-<C-g>u', { noremap = true, silent = true })
map('i', '+', '+<C-g>u', { noremap = true, silent = true })
map('i', '=', '=<C-g>u', { noremap = true, silent = true })
map('i', '<CR>', '<CR><C-g>u', { noremap = true, silent = true })
-- Indent with < and > without exiting visual mode.
map('x', '<', '<gv', { noremap = true, silent = true })
map('x', '>', '>gv', { noremap = true, silent = true })
-- Remap ESC to also hide line highlights.
map('n', '<ESC>', ':noh<CR><ESC>', { noremap = true, silent = true })
-- Shift-ESC will clear out previous search so HL does not come back on.
if vim.fn.has('unix') == 1 then
    map('n', '', ':let @/=""<CR>', { noremap = true, silent = true })
else
    map('n', '<S-Esc>', ':let @/=""<CR>', { noremap = true, silent = true })
end
-- Move between splits with C-hjkl. Disabled because vim-tmux-navigator
-- will remap these for tmux use.
-- map('n', '<C-h>', '<C-w><C-h>', { noremap = true, silent = true })
-- map('n', '<C-j>', '<C-w><C-j>', { noremap = true, silent = true })
-- map('n', '<C-k>', '<C-w><C-k>', { noremap = true, silent = true })
-- map('n', '<C-l>', '<C-w><C-l>', { noremap = true, silent = true })
-- Resize splits.
map('n', '_', '5<C-w>-', { noremap = true, silent = true })
map('n', '+', '5<C-w>+', { noremap = true, silent = true })
map('n', '-', '5<C-w><', { noremap = true, silent = true })
map('n', '=', '5<C-w>>', { noremap = true, silent = true })
map('n', '<leader>_', '<C-w>-', { noremap = true, silent = true, desc = "- v size" })
map('n', '<leader>+', '<C-w>+', { noremap = true, silent = true, desc = "+ v size" })
map('n', '<leader>-', '<C-w><', { noremap = true, silent = true, desc = "- h size" })
map('n', '<leader>=', '<C-w>>', { noremap = true, silent = true, desc = "+ h size" })
-- j and k will work the same even if the line is wrapped.
map('n', 'j', 'gj', { noremap = true, silent = true })
map('n', 'k', 'gk', { noremap = true, silent = true })
map('x', 'j', 'gj', { noremap = true, silent = true })
map('x', 'k', 'gk', { noremap = true, silent = true })
-- Bookmark
map('n', '<leader>Bm', '<Plug>BookmarkToggle',   { desc = "toggle" })
map('n', '<leader>Ba', '<Plug>BookmarkAnnotate', { desc = "annotate" })
map('n', '<leader>Bn', '<plug>BookmarkNext',     { desc = "next" })
map('n', '<leader>Bp', '<plug>BookmarkPrev',     { desc = "prev" })
map('n', '<leader>Bc', '<plug>BookmarkClear',    { desc = "clear" })
map('n', '<leader>Bx', '<plug>BookmarkClearAll', { desc = "clear all" })
map('n', '<leader>Bj', '<plug>BookmarkMoveDown', { desc = "move down" })
map('n', '<leader>Bk', '<plug>BookmarkMoveUp',   { desc = "move up" })
-- Maximize current split
map('n', '<leader>m', '<cmd>lua MaximizeToggle()<CR>', { noremap = true, silent = true, desc = "maximize" })
map('n', '<leader>u', ':UndotreeToggle<CR>',           { noremap = true, silent = true, desc = "undo tree" })
-- Unbind Q because it's a pain in the ass.
-- Make it quickfix open instead
map('n', 'Q',         ':copen<CR>',     { noremap = true, silent = true, desc = "quickfix open" })
-- Cycle buffers.
map('n', '{', ':bp<CR>',        { noremap = true, silent = true, nowait = true, desc = "prev buffer" })
map('n', '[b',        ':bp<CR>',        { noremap = true, silent = true, nowait = true, desc = "prev buffer" })
map('n', '}', ':bn<CR>',        { noremap = true, silent = true, nowait = true, desc = "next buffer" })
map('n', ']b',        ':bn<CR>',        { noremap = true, silent = true, nowait = true, desc = "next buffer" })
map('n', '<leader>bo', ':%bd|e#|bd#<CR>',       { noremap = true, silent = true, nowait = true, desc = "close all but current or pinned" })
map('n', '<leader>bO', ':bufdo bwipeout<CR>', { noremap = true, silent = true, nowait = true, desc = "close all buffers" })
-- map('n', '<leader>0', ':BufferGoto 0<CR>',       { noremap = true, silent = true, nowait = true, desc = "goto buffer 0" })
-- map('n', '<leader>1', ':BufferGoto 1<CR>',       { noremap = true, silent = true, nowait = true, desc = "goto buffer 1" })
-- map('n', '<leader>2', ':BufferGoto 2<CR>',       { noremap = true, silent = true, nowait = true, desc = "goto buffer 2" })
-- map('n', '<leader>3', ':BufferGoto 3<CR>',       { noremap = true, silent = true, nowait = true, desc = "goto buffer 3" })
-- map('n', '<leader>4', ':BufferGoto 4<CR>',       { noremap = true, silent = true, nowait = true, desc = "goto buffer 4" })
-- map('n', '<leader>5', ':BufferGoto 5<CR>',       { noremap = true, silent = true, nowait = true, desc = "goto buffer 5" })
-- map('n', '<leader>6', ':BufferGoto 6<CR>',       { noremap = true, silent = true, nowait = true, desc = "goto buffer 6" })
-- map('n', '<leader>7', ':BufferGoto 7<CR>',       { noremap = true, silent = true, nowait = true, desc = "goto buffer 7" })
-- map('n', '<leader>8', ':BufferGoto 8<CR>',       { noremap = true, silent = true, nowait = true, desc = "goto buffer 8" })
-- map('n', '<leader>9', ':BufferGoto 9<CR>',       { noremap = true, silent = true, nowait = true, desc = "goto buffer 9" })
-- Cycle tabs.
map('n', '[t',        ':tabp<CR>',      { noremap = true, silent = true, nowait = true, desc = "prev tab" })
map('n', ']t',        ':tabn<CR>',      { noremap = true, silent = true, nowait = true, desc = "next tab" })
-- Next/prev quickfix
map('n', '[q',        ':cprevious<CR>', { noremap = true, silent = true, nowait = true, desc = "prev quickfix" })
map('n', ']q',        ':cnext<CR>',     { noremap = true, silent = true, nowait = true, desc = "next quickfix" })
-- Next/prev loclist
map('n', '[w',        ':lprevious<CR>', { noremap = true, silent = true, nowait = true, desc = "prev loclist" })
map('n', ']w',        ':lnext<CR>',     { noremap = true, silent = true, nowait = true, desc = "next loclist" })
-- CD shortcuts.
map('n', '<leader>cd', ':cd <C-r>=expand("%:p:h")<CR>', { noremap = true, desc = "cd current file" })
map('n', '<leader>cD', ':cd <C-r>=getcwd()<CR>',        { noremap = true, desc = "cd current cwd" })
-- Commonly used path shortcuts.
if vim.fn.has('unix') == 1 then
    map('n', '<leader>c1', ':cd ~/projects/<CR>',  { noremap = true, desc = "cd ~/projects" })
else
    map('n', '<leader>c1', ':cd D:/projects/<CR>', { noremap = true, desc = "cd D:/projects/" })
end
map('n', '<leader>c2', ':cd ~/<CR>',                          { noremap = true, desc = "cd to ~"  })
map('n', '<leader>c3', ':cd ' .. vim.g.nvim_folder .. '<CR>', { noremap = true, desc = "cd to config"  })
-- Disable because hitting ESC and j/k fast causes it to execute this movement.
-- It happens enough to be annoying...
-- map('v', '<M-j>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
-- map('v', '<M-k>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
-- Show past git versions of a file.
map('n', '<leader>gf', ':0Gclog<CR>',    { noremap = true, desc = "file past versions" })
-- Find past versions of this range
map('v', '<leader>gf', ':Gclog<CR>',     { noremap = true, desc = "range past versions" })
-- Git blame current line
map('n', '<leader>gl', ':Git blame<CR>', { noremap = true, desc = "blame current line" })
-- Show Git status.
map('n', '<leader>gs', ':G<CR>',         { noremap = true, desc = "fugitive" })
-- Neogit
map('n', '<leader>gg', ':Neogit<CR>',         { noremap = true, desc = "neogit (magit)" })
-- GV Commit Browser
map('n', '<leader>gv', ':GV --all --decorate --branches<CR>', { noremap = true, desc = "gv all" })
map('n', '<leader>gV', ':GV --branches<CR>',                  { noremap = true, desc = "gv branches" })
map('v', '<leader>gv', ':GV<CR>',                             { noremap = true, desc = "gv" })
-- Diffput 1 (middle file) in mergetool mode.
map('n', '<leader>d1', ':diffput 1<CR>', { noremap = true, desc = "diffput middle" })
map('v', '<leader>d1', ':diffput 1<CR>', { noremap = true, desc = "diffput middle" })
-- Gitdiff from left file.
map('n', '<leader>d[', ':diffget //2<CR>', { noremap = true, desc = "diffget right" })
map('v', '<leader>d[', ':diffget //2<CR>', { noremap = true, desc = "diffget right" })
-- Gitdiff from right file.
map('n', '<leader>d]', ':diffget //3<CR>', { noremap = true, desc = "diffget left" })
map('v', '<leader>d]', ':diffget //3<CR>', { noremap = true, desc = "diffget left" })
-- Diffput / Diffget for :windo diffthis
map('n', '<leader>dp', ':diffput<CR>', { noremap = true, desc = "diffput" })
map('v', '<leader>dp', ':diffput<CR>', { noremap = true, desc = "diffput" })
map('n', '<leader>dg', ':diffget<CR>', { noremap = true, desc = "diffget" })
map('v', '<leader>dg', ':diffget<CR>', { noremap = true, desc = "diffget" })
-- File Explorer
-- map('n', '<leader>n', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
-- map('n', '<leader>n', ':NvimTreeToggle<CR>',   { noremap = true, silent = true, desc = "nvim-tree" })
-- map('n', '<leader>N', ':NvimTreeFindFile<CR>', { noremap = true, silent = true, desc = "nvim-tree current file" })
map('n', '<leader>n', ':Oil<CR>',   { noremap = true, silent = true, desc = "oil" })
map('n', '<leader>N', ':Oil .<CR>', { noremap = true, silent = true, desc = "oil pwd" })
-- map('n', '<leader>n', ':Fern . -drawer -width=35 -toggle<CR>', { noremap = true, silent = true })
-- map('n', '<leader>N', ':Fern %:h -drawer -width=35 -toggle<CR>', { noremap = true, silent = true })
-- map('n', '<leader>fn', ':Fern . -opener=edit<CR>', { noremap = true, silent = true })
-- map('n', '<leader>fN', ':Fern %:h -opener=edit<CR>', { noremap = true, silent = true })
-- map('n', '<leader>bb', ':Fern bookmark:/// -drawer -width=35 -toggle<CR>', { noremap = true, silent = true })
-- Easy Align
-- Note: In order to use <Plug>, you cannot use noremap = true.
map('n', '<leader>e', '<Plug>(LiveEasyAlign)', { silent = true, nowait = true, desc = "live easyalign" })
map('x', '<leader>e', '<Plug>(LiveEasyAlign)', { silent = true, nowait = true, desc = "live easyalign" })
-- Easy Motion
map('n', '<leader>s', '<Plug>(easymotion-bd-f)',      { silent = true, desc = "easymotion" })
map('x', '<leader>s', '<Plug>(easymotion-bd-f)',      { silent = true, desc = "easymotion" })
map('n', '<leader>S', '<Plug>(easymotion-overwin-f)', { silent = true, desc = "easymotion overwin" })
-- map('n', '<leader>S', '<Plug>(easymotion-overwin-f2)', { silent = true })
-- Insert datetime (unix)
map('n', '<leader>id1',  ':put =strftime(\'%Y-%m-%d %H:%M:%S.%06u %z\')', { noremap = true, desc = "unix time" })
-- Insert datetime 24-hour (yyyy-mm-dd 23:00:00)
map('n', '<leader>id2',  ':put =strftime(\'%Y-%m-%d %H:%M:%S\')',         { noremap = true, desc = "yyyy-mm-dd 23:00:00" })
-- Insert datetime 12-hour (yyyy-mm-dd 11:00:00 PM)
map('n', '<leader>id3',  ':put =strftime(\'%Y-%m-%d %I:%M:%S %p\')',      { noremap = true, desc = "yyyy-mm-dd 11:00:00 PM" })
-- Insert datetime 24-hour (mm-dd-yyyy 23:00:00)
map('n', '<leader>id4',  ':put =strftime(\'%m-%d-%Y %H:%M:%S\')',         { noremap = true, desc = "mm-dd-yyyy 23:00:00" })
-- Insert datetime 12-hour (mm-dd-yyyy 11:00:00 PM)
map('n', '<leader>id5',  ':put =strftime(\'%m-%d-%Y %I:%M:%S %p\')',      { noremap = true, desc = "mm-dd-yyyy 11:00:00 PM" })
-- Insert date (yyyy-mm-dd)
map('n', '<leader>idd1', ':put =strftime(\'%Y-%m-%d\')',                  { noremap = true, desc = "yyyy-mm-dd" })
-- Insert date (mm-dd-yyyy)
map('n', '<leader>idd2', ':put =strftime(\'%m-%d-%Y\')',                  { noremap = true, desc = "mm-dd-yyyy" })
-- Insert time 24-hour (23:00:00)
map('n', '<leader>idt1', ':put =strftime(\'%H:%M:%S\')',                  { noremap = true, desc = "23:00:00" })
-- Insert time 12-hour (11:00:00 PM)
map('n', '<leader>idt2', ':put =strftime(\'%I:%M:%S %p\')',               { noremap = true, desc = "11:00:00 PM" })
-- Map gy and gp to yank and paste from clipboard register. gy will still allow for motions (such as gyy or gyiw).
if vim.fn.has('win32') or vim.fn.has('win64') then
    map('n', 'gp', '"+p', { noremap = true, silent = true, desc = "clipboard paste" })
    map('x', 'gp', '"+p', { noremap = true, silent = true, desc = "clipboard paste" })
    map('n', 'gy', '"+y', { noremap = true, silent = true, desc = "clipboard yank" })
    map('x', 'gy', '"+y', { noremap = true, silent = true, desc = "clipboard yank" })
else
    map('n', 'gp', '*+p', { noremap = true, silent = true, desc = "clipboard paste" })
    map('x', 'gp', '*+p', { noremap = true, silent = true, desc = "clipboard paste" })
    map('n', 'gy', '*+y', { noremap = true, silent = true, desc = "clipboard yank" })
    map('x', 'gy', '*+y', { noremap = true, silent = true, desc = "clipboard yank" })
end
-- Visual mode p will paste contents without overwritting the buffer.
map('x', 'p',          '"_dP',          { noremap = true, silent = true, desc = "paste no copy" })
-- Visual mode <leader>p will act as a normal paste.
map('x', '<leader>p',  'p',             { noremap = true, silent = true, desc = "paste copy" })
-- gd in normal and visual mode will delete without overwriting what we just yanked.
map('n', 'gd',         '"_d',           { noremap = true, silent = true, desc = "delete no copy" })
map('x', 'gd',         '"_d',           { noremap = true, silent = true, desc = "delete no copy" })
-- Close buffer without deleting window split.
map('n', '<leader>bd', ':Bdelete<CR>',  { noremap = true, silent = true, desc = "delete buffer"})
map('v', '<leader>bd', ':Bdelete<CR>',  { noremap = true, silent = true, desc = "delete buffer"})
map('n', '<leader>bD', ':Bdelete!<CR>', { noremap = true, silent = true, desc = "delete! buffer"})
map('v', '<leader>bD', ':Bdelete!<CR>', { noremap = true, silent = true, desc = "delete! buffer"})
-- Tab close / tab new.
map('n', '<leader>tc', ':tabc<CR>',   { noremap = true, silent = true, desc = "close tab" })
map('v', '<leader>tc', ':tabc<CR>',   { noremap = true, silent = true, desc = "close tab" })
map('n', '<leader>tn', ':tabnew<CR>', { noremap = true, silent = true, desc = "new tab" })
map('v', '<leader>tn', ':tabnew<CR>', { noremap = true, silent = true, desc = "new tab" })
-- Rename tab (requires tabby). Rename to _ for blank tab (since it can't reset to blank).
-- map('n', '<leader>tr', ':TabRename ', { noremap = true, silent = true, desc = "rename tab" })
-- map('v', '<leader>tr', ':TabRename ', { noremap = true, silent = true, desc = "rename tab" })
map('n', '<leader>tr', '<cmd>lua _tab_rename()<CR>', { noremap = true, silent = true, desc = "rename tab" })
map('v', '<leader>tr', '<cmd>lua _tab_rename()<CR>', { noremap = true, silent = true, desc = "rename tab" })
-- Jump to tab by number
for i=1, 9 do
	map('n', '<leader>t' .. i, i .. 'gt', { noremap = true, silent = true, desc = "open tab " .. i })
	map('v', '<leader>t' .. i, i .. 'gt', { noremap = true, silent = true, desc = "open tab " .. i })
end
-- Move tab left and right
map('n', '<leader>t[', ':tabmove -<CR>', { noremap = true, silent = true, desc = "move tab left" })
map('v', '<leader>t[', ':tabmove -<CR>', { noremap = true, silent = true, desc = "move tab left" })
map('n', '<leader>t]', ':tabmove +<CR>', { noremap = true, silent = true, desc = "move tab right" })
map('v', '<leader>t]', ':tabmove +<CR>', { noremap = true, silent = true, desc = "move tab right" })
map('n', '<leader>tc', ':tabc<CR>',      { noremap = true, silent = true, desc = "close tab" })
map('v', '<leader>tc', ':tabc<CR>',      { noremap = true, silent = true, desc = "close tab" })
map('n', '<leader>tn', ':tabnew<CR>',    { noremap = true, silent = true, desc = "new tab" })
map('v', '<leader>tn', ':tabnew<CR>',    { noremap = true, silent = true, desc = "new tab" })
-- Window close.
map('n', '<leader>wc', '<C-w>c', { noremap = true, silent = true, desc = "close window"})
map('v', '<leader>wc', '<C-w>c', { noremap = true, silent = true, desc = "close window"})

map('n', '<leader>t=', ':Tabularize /=<CR>' ,         { noremap = true, desc = "tabularize =" })
map('v', '<leader>t=', ':Tabularize /=<CR>',          { noremap = true, desc = "tabularize =" })
map('n', '<leader>t:', ':Tabularize /:\\zs<CR>',      { noremap = true, desc = "tabularize :" })
map('v', '<leader>t:', ':Tabularize /:\\zs<CR>',      { noremap = true, desc = "tabularize :" })
map('n', '<leader>t,', ':Tabularize /,\\zs/l0l1<CR>', { noremap = true, desc = "tabularize ," })
map('v', '<leader>t,', ':Tabularize /,\\zs/l0l1<CR>', { noremap = true, desc = "tabularize ," })

function _G.set_terminal_keymaps()
    local opts = {noremap = true}
    vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    -- vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
    -- vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
    -- vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
    -- vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- map('n', '<leader>aa', '<cmd>ToggleTerm direction=float<CR>', { noremap = true, silent = true, desc = "ToggleTerm" })
-- map('n', '<leader>as', '<cmd>TermSelect<CR>', { noremap = true, silent = true, desc = "ToggleTerm" })
-- map('n', '<leader>ar', ':ToggleTermSetName ', { noremap = true, silent = true, desc = "ToggleTerm" })
-- map('n', '<leader>a1', '<cmd>lua _toggleterm_lazygit()<CR>', { noremap = true, silent = true, desc = "ToggleTerm" })

map({'n', 'i', 'v', 't'}, '<F1>', '<cmd>FloatermToggle<CR>', { noremap = true, silent = true, desc = "ToggleTerm" })
map('n', '<leader>aa', '<cmd>FloatermToggle<CR>', { noremap = true, silent = true, desc = "ToggleTerm" })
map('n', '<leader>as', '<cmd>Telescope floaterm<CR>', { noremap = true, silent = true, desc = "ToggleTerm" })
-- map('n', '<leader>an', '<cmd>FloatermNew<CR>', { noremap = true, silent = true, desc = "ToggleTerm" })
map('n', '<leader>an', '<cmd>lua _new_floaterm_input()<CR>', { noremap = true, silent = true, desc = "ToggleTerm" })
map('n', '<leader>ad', '<cmd>FloatermKill<CR>', { noremap = true, silent = true, desc = "ToggleTerm" })
map('n', '<leader>a1', '<cmd>FloatermNew <CR>', { noremap = true, silent = true, desc = "ToggleTerm" })
map('n', ']a', '<cmd>FloatermNext<CR>', { noremap = true, silent = true, desc = "ToggleTerm" })
map('n', '[a', '<cmd>FloatermPrev<CR>', { noremap = true, silent = true, desc = "ToggleTerm" })

-- map('n', '<leader>aa', '<C-w>s:terminal<CR>', { noremap = true, silent = true, desc = "split terminal" })
-- map('n', '<leader>as', '<C-w>s:terminal<CR>', { noremap = true, silent = true, desc = "split terminal" })
-- map('n', '<leader>av', '<C-w>v:terminal<CR>', { noremap = true, silent = true, desc = "vsplit terminal" })
-- map('n', '<leader>at', '<C-w>t:terminal<CR>', { noremap = true, silent = true, desc = "tab terminal" })

-- Vimwiki
map('n', '<leader>Vw',  '<cmd>VimwikiIndex<CR>',                  { noremap = true, desc = "index" })
map('n', '<leader>Vws', '<cmd>VimwikiUISelect<CR>',               { noremap = true, desc = "select" })
map('n', '<leader>Vd',  '<cmd>VimwikiDiaryIndex<CR>',             { noremap = true, desc = "diary" })
map('n', '<leader>Vdc', '<cmd>VimwikiMakeDiaryNote<CR>',          { noremap = true, desc = "diary note" })
map('n', '<leader>Vdy', '<cmd>VimwikiMakeYesterdayDiaryNote<CR>', { noremap = true, desc = "yesterday's note" })
map('n', '<leader>Vdt', '<cmd>VimwikiMakeTomorrowDiaryNote<CR>',  { noremap = true, desc = "tomorrow's note" })

-- Only load font keymaps if we're using nvim-qt.
if vim.fn.exists('g:GuiLoaded') then
    map('n', '<C-=>', '<cmd>lua FontSize(1)<CR>',        { noremap = true, silent = true, desc = "increase font size" })
    map('n', '<C-->', '<cmd>lua FontSize(-1)<CR>',       { noremap = true, silent = true, desc = "decrease font size" })
    map('n', '<C-0>', '<cmd>lua FontSize(10, true)<CR>', { noremap = true, silent = true, desc = "reset font size" })
    map('n', '<C-9>', '<cmd>lua FontPrint()<CR>',        { noremap = true, silent = true, desc = "echo font info" })
end

map('n', '<leader>f1', ':e ' .. vim.g.init_path .. '<CR>',  { noremap = true, desc = "open init.lua" })
map('n', '<leader>f2', ':e ' .. vim.g.ginit_path .. '<CR>', { noremap = true, desc = "open ginit.vim" })

-- LSP / Telescope
map('n', '<leader>ff',       '<cmd>lua require("telescope.builtin").find_files({ hidden = true, no_ignore = true })<CR>', { noremap = true, silent = true, desc = 'find files' })
map('n', '<leader>fF',       '<cmd>lua require("telescope.builtin").git_files()<CR>',                       { noremap = true, silent = true, desc = 'find git files' })
map('n', '<leader>fr',       '<cmd>lua require("telescope.builtin").oldfiles()<CR>',                         { noremap = true, silent = true, desc = 'recent files' })
-- map('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<CR>',                        { noremap = true, silent = true })
map('n', '<leader>fg',       '<cmd>lua require("telescope").extensions.live_grep_args.live_grep_args()<CR>', { noremap = true, silent = true, desc = 'grep' })
map('n', '<leader><leader>', '<cmd>lua require("telescope.builtin").buffers()<CR>',                          { noremap = true, silent = true, desc = 'buffers' })
map('n', '<leader>fb',       '<cmd>lua require("telescope.builtin").buffers()<CR>',                          { noremap = true, silent = true, desc = 'buffers' })
map('n', '<leader>fB',       '<Plug>BookmarkShowAll',  { desc = "bookmarks" })
map('n', '<leader>fh',       '<cmd>lua require("telescope.builtin").help_tags()<CR>',                        { noremap = true, silent = true, desc = 'help' })
map('n', '<leader>fq',       '<cmd>lua require("telescope.builtin").quickfix()<CR>',                         { noremap = true, silent = true, desc = 'quickfix' })
map('n', '<leader>ft',       ':TodoTelescope<CR>',                                                           { noremap = true, silent = true, desc = 'todos' })
map('n', '<leader>fj',       ':Telescope jumper<CR>',                                                        { noremap = true, silent = true, desc = 'jumper' })
map('n', '<leader>M',        '<cmd>lua require("telescope.builtin").marks()<CR>',                            { noremap = true, silent = true, desc = 'marks' })
map('n', '<leader>"',        '<cmd>lua require("telescope.builtin").registers()<CR>',                        { noremap = true, silent = true, desc = 'registers' })
map('n', '<leader>/',        '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>',        { noremap = true, silent = true, desc = 'swiper' })
map('n', '<leader>gcc',      '<cmd>lua require("telescope.builtin").git_commits()<CR>',                      { noremap = true, silent = true, desc = 'commits' })
map('n', '<leader>gcb',      '<cmd>lua require("telescope.builtin").git_bcommits()<CR>',                     { noremap = true, silent = true, desc = 'branch commits' })
map('n', '<leader>gb',       '<cmd>lua require("telescope.builtin").git_branches()<CR>',                     { noremap = true, silent = true, desc = 'branches' })

-- Harpoon
map('n', '<leader>pm', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', { noremap = true, silent = true, desc = 'menu' })
map('n', '<leader>pa', '<cmd>lua require("harpoon.mark").add_file()<CR>',        { noremap = true, silent = true, desc = 'add' })
map('n', '<leader>pp', '<cmd>!tmux neww tmux-sessionizer<CR>',                   { noremap = true, desc = 'tmux-sessionizer' })
map('n', '[p', '<cmd>lua require("harpoon.ui").nav_prev()<CR>',          { noremap = true, silent = true, desc = 'prev' })
map('n', ']p', '<cmd>lua require("harpoon.ui").nav_next()<CR>',          { noremap = true, silent = true, desc = 'next' })
for i=1, 9 do
    -- map('n', '<leader>p' .. i, '<cmd>lua require("harpoon.ui").nav_file(' .. i .. ')<CR>', { noremap = true, silent = true, desc = 'goto ' .. i })
    map('n', '<leader>p' .. i, '<cmd>lua require("harpoon.ui").nav_file(' .. i .. ')<CR>', { noremap = true, silent = true, desc = 'harpoon ' .. i })
end

map('n', '\\s',   ':SymbolsOutline<CR>',                                                { noremap = true, silent = true, desc = 'SymbolsOutline' })
map('n', '\\jr',  '<cmd>lua require("telescope.builtin").lsp_references()<CR>',         { noremap = true, silent = true, desc = 'references' })
map('n', '\\r',   '<cmd>lua vim.lsp.buf.rename()<CR>',                                  { noremap = true, silent = true, desc = 'rename' })
map('n', '\\jd',  '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>',        { noremap = true, silent = true, desc = "definitions" })
map('n', '\\\\',  '<cmd>lua vim.diagnostic.open_float({scope = "cursor"})<CR>',                           { noremap = true, silent = true, nowait = true, desc = "line diagnostics" })
map('n', '\\DF',  '<cmd>lua require("telescope.builtin").diagnostics({ bufnr=0 })<CR>', { noremap = true, silent = true, desc = "file diagnostics" })
map('n', '\\DD',  '<cmd>lua require("telescope.builtin").diagnostics()<CR>',            { noremap = true, silent = true, desc = "project diagnostics" })
map('n', '\\DT',  '<cmd>lua ToggleDiagnosticVirtualText()<CR>',                         { noremap = true, silent = true, desc = "toggle virtual text" })
map('n', '[e',    '<cmd>lua vim.diagnostic.goto_prev()<CR>',                            { noremap = true, silent = true, desc = "prev error" })
map('n', ']e',    '<cmd>lua vim.diagnostic.goto_next()<CR>',                            { noremap = true, silent = true, desc = "next error" })
map('n', '\\js',  '<cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>',   { noremap = true, silent = true, desc = "buffer symbols" })
map('n', '\\jS',  '<cmd>lua require("telescope.builtin").lsp_workplace_symbols()<CR>',  { noremap = true, silent = true, desc = "project symbols" })
map('n', '\\a',   '<cmd>lua vim.lsp.buf.code_action()<CR>',                             { noremap = true, silent = true, desc = "code action" })
map('n', '\\ji',  '<cmd>lua require("telescope.builtin").lsp_implementations()<CR>',    { noremap = true, silent = true, desc = "implementations"})
map('n', '\\jt',  '<cmd>lua require("telescope.builtin").lsp_type_definitions()<CR>',   { noremap = true, silent = true, desc = "type definitions" })
map('n', '\\f',   '<cmd>lua vim.lsp.buf.format({ timeout=5000 })<CR>',                         { noremap = true, silent = true, desc = "format" })
map('x', '\\f',   '<cmd>lua vim.lsp.buf.format({ timeout=5000 })<CR>',                        { noremap = true, silent = true, desc = "format range" })
map('n', '\\F',   '<cmd>lua ToggleFormatFileOnSave()<CR>',                              { noremap = true, silent = true, desc = "toggle format on save" })
map('x', '\\F',   '<cmd>lua ToggleFormatFileOnSave()<CR>',                              { noremap = true, silent = true, desc = "toggle format on save" })
map('n', '\\gd',  '<cmd>Neogen<CR>',                                                    { noremap = true, desc = "neogen" })
map('n', '\\q',   '<cmd>Trouble document_diagnostics<CR>',                              { noremap = true, desc = "buffer diagnostics" })
map('n', '\\Q',   '<cmd>Trouble workspace_diagnostics<CR>',                             { noremap = true, desc = "project diagnostics" })
map('n', '\\w',   '<cmd>lua vim.diagnostic.setloclist()<CR>',                             { noremap = true, desc = "loclist buffer diagnostics" })
map('n', '\\W',   '<cmd>lua vim.diagnostic.setqflist()<CR>',                              { noremap = true, desc = "quickfix project diagnostics" })
map('n', '<C-p>', '<cmd>lua vim.lsp.buf.hover()<CR>',                                   { noremap = true, silent = true, desc = "inspect" })
map('v', '<C-p>', '<cmd>lua vim.lsp.buf.hover()<CR>',                                   { noremap = true, silent = true, desc = "inspect" })
-- Shows signature for function.
map('i', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>',                          { noremap = true, silent = true, desc = "view signature" })

-- Swap window splits
map('n', '<leader>wS', '<cmd>lua require("swap-split").swap()<CR>', { noremap = true, silent = true, desc = "swap windows" })
map('n', '<leader>;c', '<plug>CyclistNext',                         { noremap = true, silent = true, desc = "cyclist: next" })
map('n', '<leader>;C', '<plug>CyclistPrev',                         { noremap = true, silent = true, desc = "cyclist: prev" })

--------------------------------------------------------------------------------
-- Toggle settings
--------------------------------------------------------------------------------
-- Toggle between absolute and relative line numbers.
map('n', '<Leader>;ln',      '<cmd>lua ToggleLineNumbers()<CR>',                              { noremap = true, silent = true, nowait = true, desc = "toggle relative numbers" })
-- Toggle visibility of line numbers.
map('n', '<Leader>;lN',      '<cmd>lua ToggleNoNumbers()<CR>',                                { noremap = true, silent = true, nowait = true, desc = "toggle numbers" })
-- Toggle highlighting over 80 chars.
map('n', '<leader>;o',       '<cmd>lua ToggleOverLength()<CR>',                               { noremap = true, silent = true, desc = "toggle overlength" })
map('n', '<leader>;<CR>',    '<cmd>lua ToggleWrap()<CR>',                                     { noremap = true, silent = true, desc = "toggle wordwrap" })
map('n', '<leader>;<tab>',   '<cmd>lua TabsSpaces()<CR>',                                     { noremap = true, silent = true, desc = "toggle tabs/spaces" })
map('n', '<leader>;`',       '<cmd>lua ConvertTabsSpaces()<CR>',                              { noremap = true, silent = true, desc = "convert tabs/spaces" })
-- Remove trailing spaces.
map('n', '<leader>;<space>', ':%s/\\s\\+$//<CR>:let @/=\'\'<CR>',                             { noremap = true, silent = true, desc = "remove trailing spaces" })
-- Tabstops
map('n', '<leader>;1',       ':set tabstop=1<CR>:set shiftwidth=1<CR>:set softtabstop=1<CR>', { noremap = true, silent = true, desc = "set tabwidth to 1" })
map('n', '<leader>;2',       ':set tabstop=2<CR>:set shiftwidth=2<CR>:set softtabstop=2<CR>', { noremap = true, silent = true, desc = "set tabwidth to 2" })
map('n', '<leader>;3',       ':set tabstop=3<CR>:set shiftwidth=3<CR>:set softtabstop=3<CR>', { noremap = true, silent = true, desc = "set tabwidth to 3" })
map('n', '<leader>;4',       ':set tabstop=4<CR>:set shiftwidth=4<CR>:set softtabstop=4<CR>', { noremap = true, silent = true, desc = "set tabwidth to 4" })
map('n', '<leader>;5',       ':set tabstop=5<CR>:set shiftwidth=5<CR>:set softtabstop=5<CR>', { noremap = true, silent = true, desc = "set tabwidth to 5" })
map('n', '<leader>;6',       ':set tabstop=6<CR>:set shiftwidth=6<CR>:set softtabstop=6<CR>', { noremap = true, silent = true, desc = "set tabwidth to 6" })
map('n', '<leader>;7',       ':set tabstop=7<CR>:set shiftwidth=7<CR>:set softtabstop=7<CR>', { noremap = true, silent = true, desc = "set tabwidth to 7" })
map('n', '<leader>;8',       ':set tabstop=8<CR>:set shiftwidth=8<CR>:set softtabstop=8<CR>', { noremap = true, silent = true, desc = "set tabwidth to 8" })
map('n', '<leader>;9',       ':set tabstop=9<CR>:set shiftwidth=9<CR>:set softtabstop=9<CR>', { noremap = true, silent = true, desc = "set tabwidth to 9" })

--------------------------------------------------------------------------------
-- Move splits
--------------------------------------------------------------------------------
map('n', '<leader>H', '<C-w>H',      { noremap = true, silent = true, desc = "move buffer far left" })
map('v', '<leader>H', '<ESC><C-w>H', { noremap = true, silent = true, desc = "move buffer far left" })
map('n', '<leader>J', '<C-w>J',      { noremap = true, silent = true, desc = "move buffer far right" })
map('v', '<leader>J', '<ESC><C-w>J', { noremap = true, silent = true, desc = "move buffer far right" })
map('n', '<leader>K', '<C-w>K',      { noremap = true, silent = true, desc = "move buffer top" })
map('v', '<leader>K', '<ESC><C-w>K', { noremap = true, silent = true, desc = "move buffer top" })
map('n', '<leader>L', '<C-w>L',      { noremap = true, silent = true, desc = "move buffer bottom" })
map('v', '<leader>L', '<ESC><C-w>L', { noremap = true, silent = true, desc = "move buffer bottom" })

--------------------------------------------------------------------------------
-- Other window commands
--------------------------------------------------------------------------------
map('n', '<leader>ws', '<C-w>s',      { noremap = true, silent = true, desc = "split" })
map('v', '<leader>ws', '<ESC><C-w>s', { noremap = true, silent = true, desc = "split" })
map('n', '<leader>wv', '<C-w>v',      { noremap = true, silent = true, desc = "vsplit" })
map('v', '<leader>wv', '<ESC><C-w>v', { noremap = true, silent = true, desc = "vsplit" })
map('n', '<leader>wr', '<C-w>r',      { noremap = true, silent = true, desc = "rotate CW" })
map('v', '<leader>wr', '<ESC><C-w>r', { noremap = true, silent = true, desc = "rotate CW" })
map('n', '<leader>wR', '<C-w>R',      { noremap = true, silent = true, desc = "rotate CCW" })
map('v', '<leader>wR', '<ESC><C-w>R', { noremap = true, silent = true, desc = "rotate CCW" })
map('n', '<leader>wo', '<C-w>o',      { noremap = true, silent = true, desc = "only this window" })
map('v', '<leader>wo', '<ESC><C-w>o', { noremap = true, silent = true, desc = "only this window" })
map('n', '<leader>wh', '<C-w>h',      { noremap = true, silent = true, desc = "left" })
map('v', '<leader>wh', '<ESC><C-w>h', { noremap = true, silent = true, desc = "left" })
map('n', '<leader>wj', '<C-w>j',      { noremap = true, silent = true, desc = "down" })
map('v', '<leader>wj', '<ESC><C-w>j', { noremap = true, silent = true, desc = "down" })
map('n', '<leader>wk', '<C-w>k',      { noremap = true, silent = true, desc = "up" })
map('v', '<leader>wk', '<ESC><C-w>k', { noremap = true, silent = true, desc = "up" })
map('n', '<leader>wl', '<C-w>l',      { noremap = true, silent = true, desc = "right" })
map('v', '<leader>wl', '<ESC><C-w>l', { noremap = true, silent = true, desc = "right" })

-- Telescope DAP
map('n', '\\dTc', ':Telescope dap commands<CR>',         { noremap = true, silent = true, desc = "commands" })
map('n', '\\dTb', ':Telescope dap list_breakpoints<CR>', { noremap = true, silent = true, desc = "breakpoints" })
map('n', '\\dTv', ':Telescope dap variables<CR>',        { noremap = true, silent = true, desc = "variables" })
map('n', '\\dTf', ':Telescope dap frames<CR>',           { noremap = true, silent = true, desc = "frames" })

-- Dap commands
map('n', '\\dc', '<cmd>DapContinue<CR>',                                                           { noremap = true, silent = true, desc = "Continue" })
map('n', '\\dq', '<cmd>lua require"dap".close()<CR>',                                              { noremap = true, silent = true, desc = "Quit" })
map('n', '\\dp', '<cmd>lua require"dap.ui.widgets".hover()<CR>',                                   { noremap = true, silent = true, desc = "Cursor Inspect" })
map('n', '\\dn', '<cmd>DapStepOver<CR>',                                                           { noremap = true, silent = true, desc = "Step Over" })
map('n', '\\di', '<cmd>DapStepInto<CR>',                                                           { noremap = true, silent = true, desc = "Step Into" })
map('n', '\\do', '<cmd>DapStepOut<CR>',                                                            { noremap = true, silent = true, desc = "Step Out" })
map('n', '\\db', '<cmd>DapToggleBreakpoint<CR>',                                                   { noremap = true, silent = true, desc = "Toggle Breakpoint" })
map('n', '\\dm', '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Message: "))<CR>',            { noremap = true, silent = true, desc = "Breakpoint with msg" })
map('n', '\\dB', '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Condition: "))<CR>',{ noremap = true, silent = true, desc = "Breakpoint with condition" })
map('n', '\\dtr', '<cmd>DapToggleRepl<CR>',                                                        { noremap = true, silent = true, desc = "Toggle Repl" })
map('n', '\\dtt', '<cmd>lua require"dapui".toggle()<CR>',                                          { noremap = true, silent = true, desc = "Toggle UI" })

-- Ruby Seeing is Believing
vim.g.xmpfilter_cmd = "seeing_is_believing"
map('n', '<leader>rr', '<Plug>(seeing_is_believing-run_-x)', { noremap = true, silent = true, desc = "run" })
map('n', '<leader>rm', '<Plug>(seeing_is_believing-mark)',   { noremap = true, silent = true, desc = "mark" })
map('n', '<leader>rc', '<Plug>(seeing_is_believing-clean)',  { noremap = true, silent = true, desc = "clean" })

-- Vim Sneak
map('n', 'f', '<Plug>Sneak_f', { noremap = true, silent = true })
map('x', 'f', '<Plug>Sneak_f', { noremap = true, silent = true })
map('o', 'f', '<Plug>Sneak_f', { noremap = true, silent = true })
map('n', 'F', '<Plug>Sneak_F', { noremap = true, silent = true })
map('x', 'F', '<Plug>Sneak_F', { noremap = true, silent = true })
map('o', 'F', '<Plug>Sneak_F', { noremap = true, silent = true })
map('n', 't', '<Plug>Sneak_t', { noremap = true, silent = true })
map('x', 't', '<Plug>Sneak_t', { noremap = true, silent = true })
map('o', 't', '<Plug>Sneak_t', { noremap = true, silent = true })
map('n', 'T', '<Plug>Sneak_T', { noremap = true, silent = true })
map('x', 'T', '<Plug>Sneak_T', { noremap = true, silent = true })
map('o', 'T', '<Plug>Sneak_T', { noremap = true, silent = true })
map('n', ';', '<Plug>Sneak_;', { noremap = true, silent = true })
map('x', ';', '<Plug>Sneak_;', { noremap = true, silent = true })
map('o', ';', '<Plug>Sneak_;', { noremap = true, silent = true })
map('n', ',', '<Plug>Sneak_,', { noremap = true, silent = true })
map('x', ',', '<Plug>Sneak_,', { noremap = true, silent = true })
map('o', ',', '<Plug>Sneak_,', { noremap = true, silent = true })

-- Remap jump list navigation from <C-I> / <C-O>
map('n', '[j', '<C-O>', { noremap = true, silent = true })
map('n', ']j', '<C-I>', { noremap = true, silent = true })

-- Remove annoying command popup when pressing q:
map('n', 'q:', '<NOP>', { noremap = true, silent = true })

map({'n', 'i', 's', 'v'}, '<C-q>', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
map({'n', 'i', 's', 'v'}, '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { noremap = true, silent = true })
