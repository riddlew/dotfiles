return {
	'stevearc/oil.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {
		keymaps = {
			["g?"] = "actions.show_help",
			["<TAB>"] = "actions.select",
			["<CR>"] = "actions.select",
			["gs"] = "actions.select_vsplit",
			["gh"] = "actions.select_split",
			["gt"] = "actions.select_tab",
			["gp"] = "actions.preview",
			["<C-c>"] = "actions.close",
			["q"] = "actions.close",
			["gr"] = "actions.refresh",
			["-"] = "actions.parent",
			["_"] = "actions.open_cwd",
			["`"] = "actions.cd",
			["~"] = "actions.tcd",
			["gS"] = "actions.change_sort",
			["gx"] = "actions.open_external",
			["g."] = "actions.toggle_hidden",
			["g\\"] = "actions.toggle_trash",
		},
		use_default_keymaps = false,
		view_options = {
			show_hidden = true,
		},
		delete_to_trash = true
	}
}
