return {
	'numToStr/Comment.nvim',
	config = function()
		require'Comment'.setup()
		require'Comment.ft'({
			'javascriptreact',
			'typescriptreact'
		}, {
			'// %s',
			'{/* %s */}'
		})
	end
}
