return {
	'norcalli/nvim-colorizer.lua',
	config = function()
		require'colorizer'.setup({
			'*';
			css = {
				rgb_fn = true,
				hsl_fn = true
			};
			html = {
				rgb_fn = true,
				hsl_fn = true,
			}
		},
		{
			RGB = true,
			RRGGBB = true,
			names = false,
			RRGGBBAA = true,
			rgb_fn = true,
			hsl_fn = true,
		})
	end
}
