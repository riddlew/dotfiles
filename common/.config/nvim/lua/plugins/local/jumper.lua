return {
	dir = LOCAL_PLUGIN_PATH .. "jumper.nvim",
	config = function()
		require("jumper").setup()
	end
}
