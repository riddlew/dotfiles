return {
	{
		'rktjmp/lush.nvim'
	},
	{
		'audibleblink/hackthebox.vim',
		lazy = true
	},
	{
		'bluz71/vim-nightfly-guicolors',
		lazy = true
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = true
	},
	{
		'folke/tokyonight.nvim',
		lazy = true
	},
	{
		'NLKNguyen/papercolor-theme',
		lazy = true
	},
	{
		'rakr/vim-one',
		lazy = true
	},
	{
		'metalelf0/jellybeans-nvim',
		lazy = true
	},
	{
		'marko-cerovac/material.nvim',
		lazy = true,
		config = function()
			vim.g.material_style = "darker"
			require('material').setup{}
		end
	},
	{
		'ellisonleao/gruvbox.nvim',
		lazy = true,
		config = function()
			require('gruvbox').setup {
				undercurl = false,
				italic = {
					strings = false,
					comments = false,
					folds = false,
				}
			}
		end
	},
	{
		'owickstrom/vim-colors-paramount',
		lazy = true
	},
	{
		'fxn/vim-monochrome',
		lazy = true
	},
	{
		'askfiy/visual_studio_code',
		priority = 100,
		config = function()
			require('visual_studio_code').setup {
				mode = 'dark'
			}
		end
	},
	{
		'catppuccin/nvim',
		name = 'catppuccin',
		priority = 1000,
		config = function()
			require('catppuccin').setup({
				flavour = "macchiato",
				term_colors = false,
				background = {
					light = "macchiato",
					dark = "macchiato",
				},
				-- dim_inactive = {
				-- 	enabled = true,  -- dims the background color of inactive window
				-- 	shade = "dark",
				-- 	percentage = 0.01, -- percentage of the shade to apply to the inactive window
				-- },
				transparent_background = false,

				no_italic = true,
				no_bold = false,
				styles = {
					comments = {},
					conditionals = { "bold" },
					loops = {},
					functions = { "bold" },
					keywords = {},
					strings = { "bold" },
					variables = {},
					numbers = { "bold" },
					booleans = { "bold" },
					properties = {},
					types = { "bold" },
				},
				color_overrides = {
					all = {
						-- base = "#080808",
						base = "#080808",
						crust = "#080808",
						--	crust = "#080808",
					},
				},
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
					notify = false,
					mini = {
						enabled = true,
						indentscope_color = "",
					},
					-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
				},
				highlight_overrides = {
					macchiato = function(C)
						return {
							NvimTreeNormal = { bg = C.none },
							CmpBorder = { fg = C.none },
							Pmenu = { bg = C.none },
							NormalFloat = { bg = C.none },
							WinSeparator = { bg = C.none, fg = C.none },
							TelescopeBorder = { link = "FloatBorder" },
							CursorLine = { bg = C.none },
							Cursor = { bg = "#FFFFFF" },
							LuaLine = { bg = C.none }
						}
					end,
				},
			})
		end
	}
}
