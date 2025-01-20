return {
	dir = LOCAL_PLUGIN_PATH .. "overseer.nvim",
	config = function()
		require('overseer').setup({
			task_list = {
				bindings = {
					["<C-h>"] = false,
					["<C-l>"] = false,
				}
			},
			component_aliases = {
				default_with_notify = {
					{ "display_duration", detail_level = 2 },
					"on_output_summarize",
					"on_exit_set_status",
					"mycomponents.on_complete_notify_notify",
					"on_complete_dispose",
				}
			},
			default_template_prompt = "always"
		})

		require('overseer').register_template({
			name = "Stylua",
			builder = function(params)
				local target
				if params.target == "file" then
					target = vim.fn.expand("%")
				else
					target = vim.fn.getcwd()
				end

				return {
					cmd = {'stylua'},
					args = {'-c', '-s', target},
					-- components = { "mycomponents.on_complete_notify_notify" }
					components = { "default_with_notify" }
				}
			end,
			params = {
				target = {
					desc = "Stylua target (file or cwd)",
					type = "enum",
					choices = { "file", "cwd" },
					default = "file"
				}
			}
		})
	end
}
