local M = {}

function M.diffthis_with_prompt()
	vim.ui.input({
		prompt = "Diff this against:",
		default = "~",
	}, function(inp)
		if inp ~= nil then
			require('gitsigns').diffthis(inp)
		end
	end)
end

function M.show_with_prompt()
	vim.ui.input({
		prompt = "Show version:",
		default = "~",
	}, function(inp)
		if inp ~= nil then
			require('gitsigns').show(inp)
		end
	end)
end

return M
