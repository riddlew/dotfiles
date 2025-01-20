return {
	'tjdevries/cyclist.vim',
	config = function()
		vim.fn['cyclist#add_listchar_option_set']('default', {
			-- tab = ' ',
			tab = '> ',
			-- tab = '>.',
			-- tab = '┃.',
			trail = '·',
			extends = '❯',
			precedes = '❮',
			nbsp = '¬',
			eol = '$',
			space = ''
		})

		vim.fn['cyclist#add_listchar_option_set']('all', {
			-- tab = ' ',
			-- tab = '> ',
			-- tab = '>.',
			tab = '>_',
			-- tab = '┃.',
			trail = '·',
			extends = '❯',
			precedes = '❮',
			nbsp = '¬',
			-- Replaced with nerdfont return char.
			-- eol = '﬋',
			eol = '$',
			space = '·'
		})

		vim.fn['cyclist#add_listchar_option_set']('hidden', {
			eol = '',
			tab = '  ',
			trail = '',
			extends = '',
			precedes = '',
			nbsp = '',
			space = ''
		})

		vim.fn['cyclist#add_listchar_option_set']('minimal', {
			tab = '  ',
			trail = '·',
			extends = '❯',
			precedes = '❮',
			nbsp = '¬',
			eol = '',
			space = ''
		})

		vim.fn['cyclist#add_listchar_option_set']('no tabs', {
			tab = '  ',
			trail = '·',
			extends = '❯',
			precedes = '❮',
			nbsp = '¬',
			eol = '$',
			space = ''
		})
	end
}
