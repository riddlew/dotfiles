return {
	dir = LOCAL_PLUGIN_PATH .. "nvim-dap-ruby",
	config = function()
		require("dap-ruby").setup()
	end
}
