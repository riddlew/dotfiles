
return {
	-- Converts numbers with gA (show all opts), crd (dec), crx(hex), cro(oct),
	-- and crb(bin).
	{
		'glts/vim-magnum'
	},
	{
		'glts/vim-radical',
		dependencies = { 'glts/vim-magnum' }
	}
}
