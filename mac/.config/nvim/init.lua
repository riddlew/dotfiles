require("startup")
require("plugins")

if INSTALL_MODE == false then
	require('keymaps')
	require('settings')
	require('autocmds')
	require('functions')
	require('winbar')
	require('colors')
end

-- This is a hack. Loading colorscheme after neogit setup causes no colors.
-- Neogit seems depend on the colorscheme to setup, as it will also wipeout
-- colors if you change colorscheme at any time. So instead, set neogit to
-- lazy load and then load it after everything else has ran, including
-- colorschemes.
-- require('neogit')
