return {
	"akinsho/toggleterm.nvim",
	tag = "*",
	config = function()
		-- Use powershell instead of cmd
		if vim.fn.has("win32") == 1 then
			vim.cmd[[
				let &shell = 'powershell'
				let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
				let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
				let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
				set shellquote= shellxquote=
			]]
		end

		require'toggleterm'.setup {
			float_opts = {
				border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" }
			},
			shade_terminals = false,
			start_in_insert = true
		}

	end
}
