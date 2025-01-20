return {
	dir = LOCAL_PLUGIN_DIR .. "nvim-dap-ruby",
	config = function()
		require("dap-ruby").setup()
	end
}
