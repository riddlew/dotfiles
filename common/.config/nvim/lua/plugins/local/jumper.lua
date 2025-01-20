return {
	dir = LOCAL_PLUGIN_DIR .. "jumper.nvim",
	config = function()
		require("jumper").setup()
	end
}
