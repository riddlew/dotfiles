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
}
