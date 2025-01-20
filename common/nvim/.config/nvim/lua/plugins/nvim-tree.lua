return {
	'nvim-tree/nvim-tree.lua',
	dependencies = {
		'nvim-tree/nvim-web-devicons'
	},
	opts = {
		disable_netrw = true,
		update_cwd = true,
		hijack_unnamed_buffer_when_opening = false,
		diagnostics = {
			-- enable = false,
			show_on_dirs = true,
		},
		git = {
			enable = true,
			ignore = false,
		},
		view = {
			-- side = 'left',
			-- preserve_window_proportions = false,
			float = {
				enable = true,
				open_win_config = function()
					local screen_w = vim.opt.columns:get()
					local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
					local window_w = screen_w - 6
					local window_h = screen_h - 6
					local window_w_int = math.floor(window_w)
					local window_h_int = math.floor(window_h)
					local center_x = (screen_w - window_w) / 2 - 1
					local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
					return {
						border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
						-- none, single, double, rounded, solid, shadow, array of 8 glyphs
						relative = 'editor',
						row = center_y,
						col = center_x,
						width = window_w_int,
						height = window_h_int,
					}
				end
			},
			width = function()
				return math.floor(vim.opt.columns:get() * 0.8)
			end
		},
		renderer = {
			group_empty = true,
			indent_width = 2,
			indent_markers = {
				enable = true,
			},
			icons = {
				show = {
					folder_arrow = false
				},
				git_placement = "after",
				glyphs = {
					bookmark = "﯂",
				-- 	-- git = {
				-- 	-- 	untracked = ""
				-- 	-- }
				},
			},
			special_files = {
				"Cargo.toml",
				"Makefile",
				"README.md",
				"readme.md",
			},
		},
		filters = {
			dotfiles = false,
		},
		live_filter = {
			always_show_folders = false,
		},
		actions = {
			open_file = {
				resize_window = false,
				quit_on_open = false,
				window_picker = {
					enable = false
				}
			}
		},
		-- remove_keymaps = true,
		on_attach = function(bufnr)
			local Api = require('nvim-tree.api')
			local myfuncs = require("functions.nvim-tree")
			local map = function(m, lhs, rhs)
				vim.keymap.set(m, lhs, rhs, { buffer = bufnr, remap = false, nowait = true })
			end

			-- Copied from nvim-tree.lua/lua/nvim-tree/api.lua:11
			local function inject_node(f)
				return function(node)
					node = node or require("nvim-tree.lib").get_node_at_cursor()
					f(node)
				end
			end

			map('n', '>', Api.tree.change_root_to_node)
			map('n', 'F', Api.live_filter.clear)
			map('n', 'q', Api.tree.close)
			map('n', 'C', Api.node.navigate.parent_close)
			-- map('n', 'W', Api.tree.collapse_directory)
			map('n', 'W', inject_node(myfuncs.collapse_directory))
			map('n', 'c', Api.fs.copy.node)
			map('n', 'ya', Api.fs.copy.absolute_path)
			map('n', 'yn', Api.fs.copy.filename)
			map('n', 'yr', Api.fs.copy.relative_path)
			map('n', 'n', Api.fs.create)
			map('n', 'x', Api.fs.cut)
			map('n', '<', Api.tree.change_root_to_parent)
			map('n', '<CR>', Api.node.open.edit)
			map('n', '<2-LeftMouse>', Api.node.open.edit)
			map('n', '<Tab>', Api.node.open.edit)
			map('n', 'O', Api.node.open.no_window_picker)
			map('n', 'E', Api.tree.expand_all)
			map('n', 'H', Api.node.navigate.sibling.first)
			map('n', 'L', Api.node.navigate.sibling.last)
			map('n', 'f', Api.live_filter.start)
			map('n', 'J', Api.node.navigate.sibling.next)
			map('n', '<BS>', Api.node.navigate.parent)
			map('n', 'p', Api.fs.paste)
			map('n', 'K', Api.node.navigate.sibling.prev)
			map('n', 'P', Api.node.open.preview)
			map('n', 'r', Api.fs.rename)
			map('n', 'R', Api.tree.reload)
			map('n', 'D', Api.fs.remove)
			map('n', 'a', Api.node.run.cmd)
			map('n', 'S', Api.tree.search_node)
			map('n', 's', Api.node.open.horizontal)
			map('n', 'o', Api.node.run.system)
			map('n', 't', Api.node.open.tab)
			map('n', 'gc', Api.tree.toggle_custom_filter)
			map('n', 'gh', Api.tree.toggle_hidden_filter)
			map('n', '<C-p>', Api.node.show_info_popup)
			map('n', 'I', Api.tree.toggle_gitignore_filter)
			map('n', 'g?', Api.tree.toggle_help)
			map('n', 'm', Api.marks.toggle)
			map('n', 'd', Api.fs.trash)
			map('n', 'v', Api.node.open.vertical)
			map('n', '[e', Api.node.navigate.diagnostics.prev)
			map('n', ']e', Api.node.navigate.diagnostics.next)
			map('n', '[g', Api.node.navigate.git.prev)
			map('n', ']g', Api.node.navigate.git.next)

			map('n', 'bmv', Api.marks.bulk.move)

			-- unmark all
			map('n', 'MM', Api.marks.clear)
			-- map('n', 'MD', myfuncs.somethingremove)

			-- copy marked nodes
			-- map('n', 'MC', myfuncs.copy_marked_nodes)
			-- map('n', 'MC', Api.marks.copy.node)

			-- cut marked nodes
			-- map('n', 'MX', myfuncs.cut_marked_nodes)
			-- map('n', 'MX', Api.marks.cut)

			-- mark visible nodes
			-- map('n', 'MF', myfuncs.mark_all_visible)
			-- map('n', 'MF', myfuncs.toggle_all_visible)

			-- rename marked nodes (very jank)
			-- map('n', 'MR', myfuncs.rename_marked)

			-- copy marked file names
			-- map('n', 'MYY', Api.marks.copy.filename)
			-- copy marked absolute paths
			-- map('n', 'MYA', Api.marks.copy.absolute_path)
			-- copy marked relative paths
			-- map('n', 'MYR', Api.marks.copy.relative_path)
			-- print clipboard
			map('n', 'M?', Api.fs.print_clipboard)
			-- clear clipboard
			map('n', 'M!', Api.fs.clear_clipboard)
		end,
	}
}
