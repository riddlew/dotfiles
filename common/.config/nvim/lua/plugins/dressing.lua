return {
	'stevearc/dressing.nvim',
	dependencies = { 'nvim-telescope/telescope.nvim' }, 
	config = function()
		require('dressing').setup {
			input = {
				border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
				relative = "editor",
				prefer_width = 120,
				min_width = { 60, 0.8 },
				win_options = {
					winblend = 0,
					winhighlight = "Normal:Normal,FloatBorder:Normal",
				},
				override = function(conf)
					conf.anchor = "SW"
					return conf
				end,
			},
			select = {
				trim_prompt = true,
				telescope = require('telescope.themes').get_dropdown({
					borderchars = {
						prompt = { "━", "┃", "━", "┃", "┏", "┓", "┛", "┗" },
						results = { "━", "┃", "━", "┃", "┣", "┫", "┛", "┗" },
						preview = { "━", "┃", "━", "┃", "┏", "┓", "┛", "┗" },
					},
				}),
				builtin = {
					border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
					relative = "editor",
					prefer_width = 60,
					min_width = { 60, 0.8 },
					win_options = {
						winblend = 0,
						winhighlight = "Normal:Normal,FloatBorder:Normal",
					},
					override = function(conf)
						conf.anchor = "SW"
						return conf
					end
				},
			}
		}
	end
}
