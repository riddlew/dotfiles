return {
	'folke/which-key.nvim',
	config = function()
		local wk = require('which-key')
		wk.setup {
			presets = {
				operators = false,
				motions = false,
				text_objects = false
			}
		}
		wk.register({
			['<leader>b']   = { name = '+buffer / bookmark' },
			['<leader>c']   = { name = '+cd' },
			['<leader>d']   = { name = '+diff' },
			['<leader>f']   = { name = '+file' },
			['<leader>g']   = { name = '+git' },
			['<leader>gc']  = { name = '+commits' },
			['<leader>h']   = { name = '+hunk' },
			['<leader>ht']  = { name = '+toggle' },
			['<leader>i']   = { name = '+insert' },
			['<leader>id']  = { name = '+date / time' },
			['<leader>idd'] = { name = '+date' },
			['<leader>idt'] = { name = '+time' },
			['<leader>V']   = { name = '+vimwiki' },
			-- TODO: Remap this to something like <leader>mr..
			['<leader>r']   = { name = '+seeing_is_believing' },
			['<leader>a']   = { name = '+terminal' },
			['<leader>t']   = { name = '+t' },
			['<leader>w']   = { name = '+window' },
			['<leader>.']   = { name = '+multiple cursors' },
			['<leader>.g']  = { name = '+selection' },
			['\\D']         = { name = '+diagnostic' },
			['\\g']         = { name = '+generate' },
			['\\j']         = { name = '+jump' },
			['\\d']         = { name = '+dap' },
			['\\dt']        = { name = '+toggle' },
			['\\dT']        = { name = '+telescope' },
			['<leader>;']   = { name = "+settings" },
			['<leader>;l']  = { name = "+line numbers" },
			['<leader>9']   = { 'colorscheme inspect' },
			['<leader>tm']  = { 'table mode toggle' },
			['<leader>tt']  = { 'convert to table' },
			['<leader>./']  = { 'select with regex' },
			['<leader>.\\'] = { 'add cursor @ pos' },
			['<leader>.A']  = { 'select all @ pos' },
			['<leader>.gS'] = { 'last selection' },
		}, { mode = 'n', prefix = '' })

		wk.register({
			['<leader>b']   = { name = '+buffer / bookmark' },
			['<leader>d']   = { name = '+diff' },
			['<leader>g']   = { name = '+git' },
			['<leader>h']   = { name = '+hunk' },
			['<leader>t']   = { name = '+t' },
			['<leader>w']   = { name = '+window' },
			['<leader>.']   = { name = '+multiple cursors' },
			['<leader>.g']  = { name = '+selection' },
			['<leader>T']   = { 'convert delim to table' },
			['<leader>tm']  = { 'table mode toggle' },
			['<leader>tt']  = { 'convert to table' },
			['<leader>./']  = { 'select with regex' },
			['<leader>.\\'] = { 'add cursor @ pos' },
			['<leader>.A']  = { 'select all @ pos' },
			['<leader>.gS'] = { 'last selection' },
		}, { mode = 'v', prefix = '' })
	end
}
