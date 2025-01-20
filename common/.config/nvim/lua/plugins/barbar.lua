return {
	'romgrk/barbar.nvim',
	dependencies = {
		'nvim-web-devicons'
	},
	-- Calls setup function with opts
	opts = {
		animation = false,
		tabpages = true,
		icons = {
			buffer_index = true,
			filetype = {
				enabled = false,
			},
			pinned = { button = '' },
			button = '',
		},
		insert_at_end = true,
	}
}
