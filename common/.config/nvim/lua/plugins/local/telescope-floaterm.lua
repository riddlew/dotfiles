return {
	dir = LOCAL_PLUGIN_PATH .. "telescope-floaterm.nvim",
	config = function()
		require("telescope-floaterm").setup()
	end
}
