-- use vim.g.??? for setting plugin g: variables.
-- for regular set commands, use vim.opt.???
vim.opt.signcolumn = "yes"
-- Vim scrolls to the side 1 char at a time instead of chunky jumping.
vim.opt.sidescroll = 1
vim.opt.cmdheight = 1
vim.opt.updatetime = 300
-- Turn off wrapping lines when they reach the highlight column
vim.opt.formatoptions:remove('t')
-- Turn off wrapping comments (sometimes incorrectly detects code as a comment)
vim.opt.formatoptions:remove('c')
vim.opt.encoding = "utf-8"
vim.opt.compatible = false
vim.opt.display = "lastline"
vim.opt.backspace = "indent,eol,start"
vim.opt.autoread = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.cmd('filetype indent plugin on')
vim.opt.history = 10000
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.laststatus = 3
vim.opt.list = true
-- Disabled this because I don't need both showbreak and eol, just one or the other. I prefer showbreak.
-- vim.opt.listchars = { tab = '▸ ', trail = '·', extends = '❯', precedes = '❮', nbsp = '¬', eol = '↲' }
vim.opt.foldcolumn = "1"
-- Any changes to listchars must be made in settings/cyclist.lua too since it replaces default listchars.
vim.opt.listchars = { tab = ' ', trail = '·', extends = '❯', precedes = '❮', nbsp = '¬', eol = ' ' }
-- Or diff = ╱ if it looks better than / in some fonts.
vim.opt.fillchars = { fold = '─', foldopen = '○', foldclose = '●', vert = '│', diff = '/' }
-- vim.opt.fillchars = { fold = '─', foldopen = '○', foldclose = '●', vert = '│', diff = '-' }
-- vim.opt.showbreak = '  ❯ '
vim.opt.showbreak = '│'
-- Indents wrapped line from start of indented line when set to true.
vim.opt.breakindent = false
vim.opt.breakindentopt = 'shift:0,min:10,sbr'
-- Mouse support = all.
vim.opt.mouse = 'a'
-- Disable right click popup
vim.opt.mousemodel = "extend"
-- How Ctrl-a and Ctrl-z act.
vim.opt.nrformats = 'bin,hex,alpha,unsigned'
-- Max # of tabs.
vim.opt.tabpagemax = 50
-- Search for tags  file in current file directory, then working directory.
vim.cmd('set tags=./tags;,tags')
-- When jumping in the middle of the jump list, erase future
-- jumps so it'll act the way I expect (:h jumplist-stack)
vim.opt.jumpoptions:append("stack")

-- viminfo deprecated alias to shada. Saves variables across sessions.
-- Not Win32
vim.opt.shada = "!,'500,<300,s10,h"
-- Win32
if(vim.fn.has('win32')) then
    vim.opt.shada:append("rA:,rB:")
end

vim.opt.shiftround = true
vim.opt.wildmenu = true
-- When at least 2 tabs open.
vim.opt.showtabline = 2
vim.opt.showmode = false
vim.cmd('syntax enable')
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- vim.opt.expandtab = true
vim.opt.expandtab = false
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.undolevels = 1000
vim.opt.showmatch = true
-- Turn off chime.
vim.opt.visualbell = true
vim.opt.cursorline = true
-- vim.opt.cursorlineopt = "number"
vim.opt.cursorlineopt = "both"
-- true = don't update screen when executing macros. false = update screen while executing macros.
-- When enabled, it causes the cursor to lag behind the text that is being typed.
vim.opt.lazyredraw = false
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.foldmethod = 'manual'
vim.opt.foldlevel = 99
vim.opt.wrap = false
vim.opt.linebreak = true
-- Adding n will make linenumbers wrap / force break char to stay in gutter.
-- vim.opt.cpoptions:append('n')
vim.opt.textwidth = 79
vim.opt.colorcolumn="+1,+41"
vim.opt.showcmd = true
vim.opt.backup = false
vim.opt.writebackup = true
vim.opt.swapfile = false
vim.opt.scrolloff = 0
vim.opt.hidden = true
-- If the buffer is already open, switch to it instead of a new split.
-- Does not work with edit cmd, only buffer cmds like :sb<buffer>
vim.opt.switchbuf = 'useopen'
-- Allow subdirectory searching.
vim.opt.path:append('**')
-- Show substitute in real time.
vim.opt.inccommand = 'split'
-- Prevent node files from showing up in file search.
vim.opt.wildignore:append('**/node_modules/**', '*/.hg/*', '*/.svn/*')
-- Will prevent from saving pwd to each file when autoloading code folds within restore-view plugin.
vim.opt.viewoptions = "folds,cursor"
vim.opt.conceallevel = 2
-- Turns off concealment in json files caused by indent-blankline
vim.g.vim_json_syntax_conceal = 0
vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'noselect' }
vim.opt.shortmess:append('c')
vim.opt.pumheight = 10


--- Multi Cursor Theme --------------------------------------------------------
vim.g.VM_theme = 'ocean'

--- Highlighted Yank ----------------------------------------------------------
vim.g.highlightedyank_highlight_duration = 100

--- Colorizer -----------------------------------------------------------------
vim.g.colorizer_skip_comments = 0

--- Bookmarks -----------------------------------------------------------------
-- Disabled vim-bookmarks default keybindings
vim.g.bookmark_no_default_key_mappings = 1

--- Gitgutter -----------------------------------------------------------------
-- vim.g.gitgutter_map_keys = 0

--- Notes ---------------------------------------------------------------------
vim.g.notes_directories = { vim.g.notes_path }

--- Ultisnips -----------------------------------------------------------------
-- vim.g.UltiSnipsExpandTrigger = '<C-y>'
-- I never use C-f and C-b anyways.
-- vim.g.UltiSnipsJumpForwardTrigger = '<C-f>'
-- vim.g.UltiSnipsJumpBackwardTrigger = '<C-b>'
-- vim.g.UltiSnipsListSnippets = ''

--- Vimwiki -------------------------------------------------------------------
vim.g.vimwiki_global_ext = 0

--- EasyMotion ----------------------------------------------------------------
--  Disable default mappings
vim.g.EasyMotion_do_mapping = 0

--- Vim-Sneak -----------------------------------------------------------------
--  Disable default mappings
vim.cmd[[ let g:sneak#default_mappings=0 ]]

--- Rainbow -------------------------------------------------------------------
vim.g.rainbow_active = 1
vim.g.rainbow_conf = {
    guifgs = {
        '#ffcc5c',
        '#11f0c3',
        '#ff77ff',
    }
}

--- Markdown ------------------------------------------------------------------
vim.g.table_mode_corner = '|'
vim.g.vim_markdown_conceal = 0
vim.g.vim_markdown_conceal_code_blocks = 0
vim.g.vim_markdown_auto_insert_bullets = 0
vim.g.vim_markdown_new_list_item_indent = 0
vim.g.vim_markdown_strikethrough = 1
vim.g.vim_markdown_follow_anchor = 1
vim.g.vim_markdown_frontmatter = 1
vim.g.vim_markdown_toml_frontmatter = 1
vim.g.vim_markdown_json_frontmatter = 1

--- Markdown Preview ----------------------------------------------------------
vim.g.mkdp_auto_close = 0
vim.g.mkdp_browser = 'firefox'

--- Gundo ---------------------------------------------------------------------
if vim.fn.has('python3') then
    vim.g.gundo_prefer_python3 = 1
end

--- FZF -----------------------------------------------------------------------
vim.g.fzf_layout = {
    window = 'silent  botright 16split enew'
}
vim.cmd [[
command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'cat {}']}, <bang>0)
command! -bang -nargs=* Rg call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1, {'options': ['--layout=reverse', '--info=inline', '--preview', 'cat {}']}, <bang>0)
]]

--- Nvim Tree -----------------------------------------------------------------
-- vim.g.nvim_tree_indent_markers = 1
-- vim.g.nvim_tree_add_trailing = 1
-- vim.g.nvim_tree_add_trailing = 1
-- vim.g.group_empty = 0
-- -- vim.g.nvim_tree_symlink_arrow = '  '
-- vim.g.nvim_tree_symlink_arrow = ' >> '
-- vim.g.nvim_tree_special_files = {
--     ['README.md'] = 1,
--     ['Makefile'] = 1,
--     ['MAKEFILE'] = 1,
-- }
-- vim.g.nvim_tree_show_icons = {
--     git = 1,
--     folders = 0,
--     files = 0,
--     folder_arrows = 0
-- }
-- vim.g.nvim_tree_icons = {
--     folder = {
--         open = "",
--         default = "",
--         empty_open = "",
--         empty = "",
--         symlink = "S",
--         symlink_open = "S"
--     }
-- }

--- Lexima --------------------------------------------------------------------
-- Disable closing parens, quoates, etc. Still autocompletes brackets on <CR>
-- vim.g.lexima_enable_basic_rules = 0
vim.g.lexima_enable_basic_rules = 1

--- Symbols Outline -----------------------------------------------------------
-- Symbols outline settings.
vim.g.symbols_outline = {
    relative_width = false,
    width = 50,
    highlight_hovered_item = false,
    keymaps = {
        focus_location = '<CR>',
        goto_location = '<S-CR>',
        hover_symbol = '<C-p>',
    },
    symbols = {
        File = { icon = "file" },
        Module = { icon = "module" },
        Namespace = { icon = "namespace" },
        Package = { icon = "package" },
        Class = { icon = "class" },
        Method = { icon = "method" },
        Property = { icon = "prop" },
        Field = { icon = "field" },
        Constructor = { icon = "constructor" },
        Enum = { icon = "enum" },
        Interface = { icon = "interface" },
        Function = { icon = "func" },
        Variable = { icon = "var" },
        Constant = { icon = "const" },
        String = { icon = "str" },
        Number = { icon = "num" },
        Boolean = { icon = "bool" },
        Array = { icon = "array" },
        Object = { icon = "obj" },
        Key = { icon = "key" },
        Null = { icon = "null" },
        EnumMember = { icon = "enum val" },
        Struct = { icon = "struct" },
        Event = { icon = "event" },
        Operator = { icon = "operator" },
        TypeParameter = { icon = "type" },
    }
}

--- Floaterm ------------------------------------------------------------------
vim.g.floaterm_borderchars = "━┃━┃┏┓┛┗"
vim.g.floaterm_width = 0.9
vim.g.floaterm_height = 0.9
vim.g.floaterm_autoinsert = false

--- Visual Multi Cursors ------------------------------------------------------
-- Disable default keymaps
-- vim.g.VM_default_mappings = 0
vim.g.VM_leader = '<leader>.'
