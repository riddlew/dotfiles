return {
	'lewis6991/gitsigns.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	opts = {
		preview_config = {
			border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
		},
		-- currently in preview, show gitsigns for staged hunks.
		_signs_staged_enable = true,
		on_attach  = function(bufnr)
			local gs =  package.loaded.gitsigns

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			map('n', ']h', function()
				if vim.wo.diff then return ']c' end
				vim.schedule(function() gs.next_hunk() end)
				return '<Ignore>'
			end, {expr=true})

			map('n', '[h', function()
				if vim.wo.diff then return '[c' end
				vim.schedule(function() gs.prev_hunk() end)
				return '<Ignore>'
			end, {expr=true})

			map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>', { desc = "stage hunk" })
			map('n', '<leader>hS', gs.stage_buffer, { desc = "stage buffer" })
			-- Reset (delete)
			map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>', { desc = "reset hunk" })
			map('n', '<leader>hR', gs.reset_buffer, { desc = "reset buffer" })
			-- Unstage
			map({'n', 'v'}, '<leader>hu', gs.undo_stage_hunk, { desc = "unstage hunk" })
			-- Unstage the current file
			map('n', '<leader>hU', gs.reset_buffer_index, { desc = "unstage buffer" })
			map('n', '<leader>hp', gs.preview_hunk, { desc = "preview hunk" })
			map('n', '<leader>hb', function() gs.blame_line{full=true} end, { desc = "blame line" })
			map('n', '<leader>hd', require'functions.gitsigns'.diffthis_with_prompt, { desc = "diff this against rev" })
			-- map('n', '<leader>hd', gs.diffthis)
			-- map('n', '<leader>hD', function() gs.diffthis('~') end)
			-- List of hunks in buffer
			map('n', '<leader>hl', function() gs.setqflist(0, { use_location_list = true }) end, { desc = "loclist buffer hunks" })
			map('n', '<leader>hL', function() gs.setqflist("all", { use_location_list = false }) end, { desc = "quickfix all changes" })
			map('n', '<leader>htb', gs.toggle_current_line_blame, { desc = "toggle line blame" })
			map('n', '<leader>htd', gs.toggle_deleted, { desc = "toggle show deleted" })
			map('n', '<leader>htc', gs.toggle_word_diff, { desc = "toggle word diff" })
			-- Text object
			map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = "select hunk" })
		end

	}
}
