INSTALL_MODE = false

vim.g.loaded_netrw = true
vim.g.loaded_netrwPlugin = true

HOME_DIR = ""
NOTES_DIR = ""
TEMP_DIR = ""
PYTHON_PROG = ""
LOCAL_PLUGIN_DIR = ""

if vim.fn.has('linux') == 1 or vim.fn.has('wsl') == 1 then
	HOME_DIR = vim.env.HOME .. '/.config/nvim/'
	NOTES_DIR = vim.env.HOME .. '/notes/'
	TEMP_DIR = vim.env.HOME .. '/.config/nvim/temp/'
	PYTHON_PROG = '/usr/bin/python3'
	LOCAL_PLUGIN_DIR = vim.env.HOME .. "/nvim_plugins/"

    if vim.fn.exists('+termguicolors') then
        vim.cmd('let &t_8f="\\<Esc>[38;2;%lu;%lu;%lum"')
        vim.cmd('let &t_8b="\\<Esc>[48;2;%lu;%lu;%lum"')
        vim.opt.termguicolors = true
    end

elseif vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1 then
	HOME_DIR = vim.env.NVIM_HOME .. '\\'
	NOTES_DIR = vim.env.NVIM_HOME .. '\\notes\\'
	TEMP_DIR = vim.env.NVIM_HOME .. '\\temp\\'
	PYTHON_PROG = vim.env.NVIM_PYTHON
	LOCAL_PLUGIN_DIR = "D:\\code\\nvim_plugins\\"

    if vim.fn.exists('+termguicolors') then
        vim.opt.termguicolors = true
    end

elseif vim.fn.has('mac') == 1 then
	HOME_DIR = vim.env.HOME .. '/.config/nvim/'
	NOTES_DIR = vim.env.HOME .. '/notes/'
	TEMP_DIR = vim.env.HOME .. '/.config/nvim/temp/'
	PYTHON_PROG = '/usr/bin/python3'
	LOCAL_PLUGIN_DIR = vim.env.HOME .. "/nvim_plugins/"

	if vim.fn.exists('+termguicolors') then
	vim.opt.termguicolors = true
	end
end

vim.g.nvim_folder = HOME_DIR
vim.g.init_path = HOME_DIR .. 'init.lua'
vim.g.ginit_path = HOME_DIR .. 'ginit.vim'
vim.g.notes_path = NOTES_DIR
vim.opt.backupdir = TEMP_DIR .. 'backup'
vim.opt.directory = TEMP_DIR .. 'swap'
vim.opt.undodir = TEMP_DIR .. 'undo'
vim.g.python3_host_prog = PYTHON_PROG

vim.cmd[[
	set background=dark
	if &term =~ '256color'
		" Disable Background Color Erase (BCE)
		set t_ut=
	endif

	" scriptencoding utf-8
	set t_Co=256
]]

-- Setup lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Set leader
vim.g.mapleader = vim.api.nvim_replace_termcodes('<SPACE>', true, true, true)
