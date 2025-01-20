return {
	dir = LOCAL_PLUGIN_DIR .. "telescope-floaterm.nvim",
	config = function()
		require("telescope-floaterm").setup()
	end
}
