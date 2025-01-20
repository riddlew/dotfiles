local telescope_setup = function()
	local telescope = require("telescope")
	local actions = require('telescope.actions')
	local action_state = require('telescope.actions.state')
	local action_layout = require('telescope.actions.layout')

	function fzf_multi_select(prompt_bufnr)
		local picker = action_state.get_current_picker(prompt_bufnr)
		local num_selections = table.getn(picker:get_multi_selection())

		if num_selections > 1 then
			local picker = action_state.get_current_picker(prompt_bufnr)
			for _, entry in ipairs(picker:get_multi_selection()) do
				vim.cmd(string.format("%s %s", ":e!", entry.value))
			end
			vim.cmd('stopinsert')
		else
			actions.file_edit(prompt_bufnr)
		end
	end


	function make_picker_settings()
		local defaults = {
			preview_title = "",
			disable_devicons = true,
		}

		local settings = {
			find_files = "> Find Files <",
			git_files = "> Find Git Files <",
			oldfiles = "> Recent Files <",
			live_grep = "> Grep <",
			-- fix: not sure what key this should be
			live_grep_args = "> Live Grep Args <",
			buffers = "> Buffers <",
			help_tags = "> Help <",
			quickfix = "> Quickfix <",
			-- fix: not sure what key this should be
			todo_comments = "> TODOs <",
			marks = "> Marks <",
			registers = "> Registers <",
			current_buffer_fuzzy_find = "> Swiper <",
			git_commits = "> Git Commits <",
			git_bcommits = "> Git Commits - Buffer <",
			git_branches = "> Git Branches <",
			-- fix: not sure what key this should be
			jumper = "> Jumper <",
		}

		local M = {}

		for k, v in pairs(settings) do
			M[k] = { prompt_title = v }

			for j,w in pairs(defaults) do
			M[k][j] = w
			end
		end

		M["buffers"]["mappings"] = {
			i = {
				["<C-x>"] = actions.delete_buffer
			},
			n = {
				["<C-x>"] = actions.delete_buffer
			},
		}

		return M
	end

	telescope.setup {
		defaults = {
			file_ignore_patterns = {
				"node_modules",
				"venv",
				".venv",
				".hg",
				".svn",
				"\\.git",
				"__pycache__",
				"dist",
			},
			prompt_prefix = "❯ ",
			-- selection_caret = "❯ ",
			selection_caret = "  ",
			winblend = 0,
			dynamic_preview_title = false,
			results_title = false,
			path_display = { "truncate", },
			layout_strategy = "vertical",
			borderchars = {
			-- prompt = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
			-- results = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
			-- preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
			prompt = { "━", "┃", "━", "┃", "┏", "┓", "┛", "┗" },
			results = { "━", "┃", "━", "┃", "┏", "┓", "┛", "┗" },
			preview = { "━", "┃", "━", "┃", "┏", "┓", "┛", "┗" },
			},
			layout_config = {
				width = 0.99,
				height = 0.99,
				prompt_position = "top",
				center = {
				preview_cutoff = 1,
				width = function(_, max_columns, _)
					return math.min(max_columns - 2, 80)
				end,
				height = function(_, _, max_lines)
					return math.min(max_lines, 20)
				end,
				},
				horizontal = {
					preview_width = 0.5,
					-- preview_width = function(_, cols, _)
					--     if cols > 200 then
					--         return math.floor(cols * 0.5)
					--     else
					--         return math.floor(cols * 0.5)
					--     end
					-- end,
				},
				vertical = {
					width = function(_, max_columns, _)
					return math.min(max_columns - 2, 120)
					end,
					height = 0.95,
					preview_height = 0.5,
					preview_cutoff = 1,
				},
				flex = {
					horizontal = {
						preview_width = 0.9,
					},
				},
			},
			selection_strategy = "reset",
			--sorting_strategy = "ascending",
			sorting_strategy = "ascending",
			scroll_strategy = "cycle",
			color_devicons = true,
			preview = {
				hide_on_startup = true
			},
			mappings = {
				i = {
					['<esc'] = actions.close,
					['<C-j>'] = actions.move_selection_next,
					['<C-n>'] = actions.move_selection_next,
					['<C-k>'] = actions.move_selection_previous,
					['<C-p>'] = actions.move_selection_previous,
					['<C-h>'] = action_layout.toggle_preview,
					['<tab>'] = actions.toggle_selection + actions.move_selection_next,
					['<s-tab>'] = actions.toggle_selection + actions.move_selection_previous,
					["<C-s>"] = actions.select_horizontal,
					["<C-v>"] = actions.select_vertical,
				},
				n = {
					['<esc'] = actions.close,
					['<tab>'] = actions.toggle_selection + actions.move_selection_next,
					['<s-tab>'] = actions.toggle_selection + actions.move_selection_previous,
					['<C-h>'] = action_layout.toggle_preview,
					["<C-s>"] = actions.select_horizontal,
					["<C-v>"] = actions.select_vertical,
				},
			},
			file_previewer = require("telescope.previewers").vim_buffer_cat.new,
			grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
			qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		},
		pickers = make_picker_settings(),
		extensions = {
			file_browser = {
				-- theme = "ivy",
				-- mappings = {
				-- },
			},
			command_palette = {
				{ "Test",
					{ "Tips Help", ':help tips' },
				},
				{ "Test 2",
					{ "test me 2", ':echo "Test2"' },
				}
			}
		}
	}

	-- telescope.load_extension('dap')
	telescope.load_extension("notify")
	telescope.load_extension("file_browser")
	telescope.load_extension("command_palette")
	telescope.load_extension("jumper")
	telescope.load_extension("harpoon")
	telescope.load_extension("floaterm")
end

return {
	{
		'nvim-telescope/telescope.nvim',
		config = telescope_setup
	},
	{
		-- NOTE: Currently detects root dir and does not allow you to use
		-- subdirectories. To have subdirectories, need to manually edit
		-- ".local/share/nvim/telescope-project.txt" or
		-- "~/AppData/Local/nvim-data/telescope-projects.txt"
		'nvim-telescope/telescope-project.nvim'
	},
	{
		'nvim-telescope/telescope-file-browser.nvim'
	},
	{
		'nvim-telescope/telescope-live-grep-args.nvim'
	},
	{
		'LinArcX/telescope-command-palette.nvim'
	}
}
