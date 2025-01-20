return {
	{
		'preservim/vim-markdown'
	},
	{
		'iamcco/markdown-preview.nvim',
		build = function()
			vim.fn['mkdp#util#install']()
		end
	}
}
