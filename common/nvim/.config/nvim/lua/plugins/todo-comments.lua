-- TODO: Do something
-- TODO (me): Do something
-- TODO(me): Dsdfsdf
-- FIX:
-- NOTE: sdf
-- INFO:
-- WARN:

return {
	'folke/todo-comments.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	opts = {
		signs = false,
		keywords = {
			-- TODO:
			TODO = {
				icon = "",
				color= "yellow",
				alt = { "todo" }
			},
			-- FIX:
			FIX = {
				icon = "",
				color = "red",
				alt = { "FIXME", "BUG", "DEBUG", "HACK", "IMPORTANT", "CANCELLED", "fix", "fixme", "bug", "debug", "hack", "important", "cancelled" }
			},
			-- NOTE:
			NOTE = {
				icon = "",
				color = "blue",
				alt = { "REVIEW", "INFO", "PLAN", "note", "review", "info", "plan" }
			},
			-- IDEA:
			IDEA = {
				icon = "",
				color = "purple",
				alt = { "EXAMPLE", "idea", "example" }
			},
			DONE = {
				icon = "",
				color = "green",
				alt = { "done" }
			},
		},
		gui_style = {
			fg = "BOLD",
			bg = "BOLD",
		},
		merge_keywords = false,
		highlight = {
			multiline = true,
			multiline_pattern = "^.",
			multiline_context = 10,
			before = "",
			-- Use bg because wide swallows characters next to the keyword.
			keyword = "fg",
			-- Do not color text because they have not yet implemented
			-- coloring for multiple lines (issue #37).
			after = "fg",
			-- pattern = [[.*<(KEYWORDS)(\s?\([^\)]*\))?:]],
			-- pattern = [[.*[@\\]{1}<(KEYWORDS)\s*|.*<(KEYWORDS)\s*:]],
			pattern = [[.*<([@\\]?KEYWORDS)(\s?\([^\)]*\))?:]],
			comments_only = true,
		},
		search = {
			command = "rg",
			args = {
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
			},
			-- pattern = [[\b(KEYWORDS)(\s?\([^\)]*\))?:]],
			-- pattern = [[[\\\\@]*\b(KEYWORDS)(\s|:)]],
			pattern = [[[\\\\@]*\b(KEYWORDS)(\s?\([^\)]*\))?:]],
		},
		colors = {
			red = { "CommentRed", "#DC2626" },
			yellow = { "CommentYellow", "#FBBF24" },
			blue = { "CommentBlue", "#2563EB" },
			cyan = { "CommentCyan", "#10B981" },
			purple = { "CommentPurple", "#7C3AED" },
			green = { "CommentGreen", "#c5f467" },
			white = { "CommentWhite", "#e8e8d3" },
		}

	}
}
