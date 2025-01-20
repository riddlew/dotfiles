-- stylua: ignore
local colors = {
	background  = '#151515',
	gray = '#403c41',
	green   = '#c5f467',
	red     = '#ff8484',
	yellow  = '#ffcc5c',
	blue    = '#5cb2ff',
	white   = '#e8e8d3',
	inactive= '#504945',
}

return {
	normal = {
		a = { bg = colors.green, fg = colors.background, gui = 'bold' },
		b = { bg = colors.gray, fg = colors.white },
		c = { bg = colors.gray, fg = colors.white },
		x = { bg = colors.gray, fg = colors.white },
		y = { bg = colors.gray, fg = colors.white },
		z = { bg = colors.gray, fg = colors.white },
	},
	insert = {
		a = { bg = colors.blue, fg = colors.background, gui = 'bold' },
		b = { bg = colors.gray, fg = colors.white },
		c = { bg = colors.gray, fg = colors.white },
		x = { bg = colors.gray, fg = colors.white },
		y = { bg = colors.gray, fg = colors.white },
		z = { bg = colors.gray, fg = colors.white },
	},
	visual = {
		a = { bg = colors.yellow, fg = colors.background, gui = 'bold' },
		b = { bg = colors.gray, fg = colors.white },
		c = { bg = colors.gray, fg = colors.white },
		x = { bg = colors.gray, fg = colors.white },
		y = { bg = colors.gray, fg = colors.white },
		z = { bg = colors.gray, fg = colors.white },
	},
	replace = {
		a = { bg = colors.red, fg = colors.background, gui = 'bold' },
		b = { bg = colors.gray, fg = colors.white },
		c = { bg = colors.gray, fg = colors.white },
		x = { bg = colors.gray, fg = colors.white },
		y = { bg = colors.gray, fg = colors.white },
		z = { bg = colors.gray, fg = colors.white },
	},
	command = {
		a = { bg = colors.green, fg = colors.background, gui = 'bold' },
		b = { bg = colors.gray, fg = colors.white },
		c = { bg = colors.gray, fg = colors.white },
		x = { bg = colors.gray, fg = colors.white },
		y = { bg = colors.gray, fg = colors.white },
		z = { bg = colors.gray, fg = colors.white },
	},
	inactive = {
		a = { bg = colors.gray, fg = colors.white, gui = 'bold' },
		b = { bg = colors.gray, fg = colors.white },
		c = { bg = colors.gray, fg = colors.white },
		x = { bg = colors.gray, fg = colors.white },
		y = { bg = colors.gray, fg = colors.white },
		z = { bg = colors.gray, fg = colors.white },
	},
}
