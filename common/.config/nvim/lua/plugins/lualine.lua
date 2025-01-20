local M = {}

M.plugins = {
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'kyazdani42/nvim-web-devicons' },
	},
	{
		'arkav/lualine-lsp-progress',
		dependencies = 'nvim-lualine/lualine.nvim'
	},
}

M.setup = function()
	local lualine_modestrings = {
		["NORMAL"] = "N",
		["INSERT"] = "I",
		["REPLACE"] = "R",
		["V-REPLACE"] = "VR",
		["VISUAL"] = "V",
		["V-LINE"] = "VL",
		["V-BLOCK"] = "VB",
		["SELECT"] = "S",
		["S-LINE"] = "SL",
		["COMMAND"] = ":",
		["EX"] = "EX",
		["MORE"] = "MORE",
		["CONFIRM"] = "CONFIRM",
		["TERMINAL"] = "TERM",
	}

	-- local gps = require('nvim-gps')
	-- local gps = require('nvim-navic')

	function is_full_width()
		return vim.fn.winwidth(0) >= 110
	end

	require'lualine'.setup{
		options = {
			icons_enabled = true,
			theme = 'tedious',
			component_separators = { left = '|', right = '|' },
			section_separators = { left = '', right = '' },
			disabled_filetypes = {},
			always_divide_middle = true,
			globalstatus = true,
		},
		sections = {
			lualine_a = {
				{
					'mode', fmt=function(mode)
						local modestr = lualine_modestrings[mode]
						if modestr then
							return modestr
						end
					end
				}
			},
			lualine_b = { 'branch'},
			lualine_c = {
				{
					'filename',
					file_status = true,
					path = 1, -- 1 = relative path, 2 = absolute path.
					shorting_target = 40,
					symbols = {
						modified = '[+]',
						readonly = '[-]',
						unnamed = '[No Name]'
					}
				},
				-- { gps.get_location, cond = (gps.is_available and is_full_width) }
			},
			lualine_x = {
				-- {
				--     'lsp_progress',
				--     -- In future, check if option has been added to disable the timer to hide the LSP name.
				--     -- Currently waiting for PR from tamirzb issue #12
				--     display_components = { 'lsp_client_name', 'spinner' }
				-- },
				'diff',
				'filetype',
				{
					'encoding',
					cond = is_full_width
				},
				{
					'fileformat',
					cond = is_full_width
				}
			},
			lualine_y = {
				{
					'location',
					cond = is_full_width
				},
				{
					'progress',
					cond = is_full_width
				}
			},
			lualine_z = {
			{
				'diagnostics',
				symbols = {
				errors = ' ',
				warn = ' ',
				info = ' ',
				},
				diagnostics_colors = {
				color_error = { fg = '#ff8484' },
				color_warn = { fg = '#ffcc5c' },
				color_info = { fg = '#53a7f3' },
				}
			}
			}
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { 'filename' },
			lualine_x = { 'filetype' },
			lualine_y = {},
			lualine_z = { 'diagnostics' }
		},
		tabline = {},
		extensions = {}
	}
end

return M
