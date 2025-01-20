return {
	'sindrets/diffview.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	opts = {
		file_panel = {
			tree_options = {
				flatten_dirs = false,
				folder_statuses = "always"
			}
		},
		hooks = {
			diff_buf_win_enter = function()
				require("indent_blankline.commands").disable()
			end,
		}
	}
}
