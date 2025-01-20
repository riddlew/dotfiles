return {
	'lukas-reineke/indent-blankline.nvim',
	config = function()
		require('ibl').setup {
			scope = {
				enabled = false
			},
			indent = {
				char = '┊',
				tab_char = '│'
			},
			exclude = {
				filetypes = {'fern', 'NvimTree', 'diff'}
			}
		}
	end
}
