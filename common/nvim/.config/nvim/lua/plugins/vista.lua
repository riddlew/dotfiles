-- This works with ctags but isn't great with LSP.

return {
	'liuchengxu/vista.vim',
	config = function()
		vim.cmd[[
			let g:vista#renderer#enable_icon=1
		]]
	end
}
