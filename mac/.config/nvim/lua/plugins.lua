-- overseer: works so far
-- asynctasks: doesn't work
-- toggletasks: relies on toggleterm and does not open float in foreground
-- projectlaunch: does not support variables such as the current file, so I cannot make commands like "stylua CURRENTFILE". No env variables like the vscode tasks.json ones either.
-- tasks.nvim: readme is shit, didn't even bother installing
-- vs-tasks: no global config

LOCAL_PLUGIN_PATH = "~/dotfiles/mac/nvim_plugins/"

local plugins = {
	-- require('plugins.barbar'),
	require('plugins.bbye'),
	require('plugins.bookmarks'),
	require('plugins.characterize'),
	require('plugins.cloak'),
	require('plugins.cmp'),
	require('plugins.colorizer'),
	require('plugins.colorschemes'),
	require('plugins.comment'),
	require('plugins.cyclist'),
	require('plugins.dap'),
	require('plugins.diffview'),
	require('plugins.dressing'),
	require('plugins.easy-align'),
	require('plugins.easymotion'),
	require('plugins.sleuth'),
	-- Using my fork to fix the clipboard error when using tommcdo's version.
	require('plugins.exchange'),
	-- require('plugins.fern'),
	require('plugins.fidget'),
	require('plugins.floaterm'),
	require('plugins.fugitive'),
	require('plugins.fzf'),
	require('plugins.gitsigns'),
	require('plugins.gv'),
	require('plugins.harpoon'),
	require('plugins.highlightedyank'),
	require('plugins.hydra'),
	require('plugins.icons'),
	require('plugins.indent-blankline'),
	require('plugins.indent-o-matic'),
	-- require('plugins.lexima'),
	-- require('plugins.lualine').plugins,
	require('plugins.luasnip'),
	require('plugins.magnum'),
	require('plugins.markdown'),
	-- require('plugins.misc'),
	require('plugins.neogen'),
	require('plugins.neogit'),
	-- require('plugins.nerdtree'),
	-- require('plugins.notes'),
	require('plugins.notify'),
	require('plugins.numb'),
	require('plugins.nvim-tree'),
	require('plugins.orgmode'),
	require('plugins.plenary'),
	require('plugins.popup'),
	-- require('plugins.rainbow-delimiters'),
	require('plugins.repeat'),
	-- require('plugins.ruby'),
	require('plugins.rust-tools'),
	require('plugins.sneak'),
	require('plugins.speeddating'),
	require('plugins.surround'),
	require('plugins.symbols-outline'),
	require('plugins.tabby'),
	require('plugins.table-mode'),
	require('plugins.tabular'),
	require('plugins.telescope'),
	require('plugins.tmux-navigator'),
	require('plugins.todo-comments'),
	require('plugins.toggleterm'),
	require('plugins.treesitter'),
	require('plugins.trouble'),
	require('plugins.ts-autotag'),
	-- require('plugins.ultisnips')
	require('plugins.undotree'),
	-- I really wanted to try magit, but unfortuantely the plugin is broken for me currently
	-- with a shell error as seen in issue #180.
	-- require('plugins.vimagit'),
	-- require('plugins.vimwiki'),
	require('plugins.vista'),
	require('plugins.visual-multi'),
	require('plugins.whichkey'),
	require('plugins.overseer'),
	require('plugins.oil'),
	require('plugins.heritage'),

	-- Mason and mason-lspconfig MUST come before lsp setup!
	require('plugins.mason'),
	require('plugins.lsp'),

	-- Local plugins
	require('plugins.local.asciitree'),
	require('plugins.local.jumper'),
	require("plugins.local.swap-split"),
	require("plugins.local.telescope-floaterm"),
--	require("plugins.local.overseer"),
	require("plugins.local.lush-colorschemes"),
	require("plugins.local.dap-ruby"),
}

local opts = {
	dev = {
		path = "~/dotfiles/mac/nvim_plugins",
	},
}

require("lazy").setup(plugins, opts)
