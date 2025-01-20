return {
	'ThePrimeagen/harpoon',
	opts = {
		menu = {
			width = vim.api.nvim_win_get_width(0) - 20
		},
		projects = {
			["$HOME/personal/vim-with-me/server"] = {
				term = {
					cmds = {
						"./env && npx ts-node src/index.ts"
					}
				}
			}
		}

	}
}
