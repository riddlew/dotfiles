return {
	-- New version, currently broken, does not auto update
	'HiPhish/rainbow-delimiters.nvim',
	branch = 'use-children', -- required to prevent deprecation error until this branch is merged into main
	dependencies = {
		'nvim-treesitter/nvim-treesitter',
	},
	config = function()
		local rainbow_delimiters = require('rainbow-delimiters')
		vim.g.rainbow_delimiters = {
			strategy = {
				[''] = rainbow_delimiters.strategy['global'],
				vim = rainbow_delimiters.strategy['local'],
			},
			query = {
				[''] = 'rainbow-delimiters',
				lua = 'rainbow-blocks',
			},
			highlight = {
				'RainbowDelimiterRed',
				'RainbowDelimiterYellow',
				'RainbowDelimiterBlue',
				'RainbowDelimiterOrange',
				'RainbowDelimiterGreen',
				'RainbowDelimiterViolet',
				'RainbowDelimiterCyan',
			},
		}
	end
}
