return {
	'danymat/neogen',
	dependencies = { 'nvim-treesitter/nvim-treesitter' },
	opts = {
		snippet_engine = "luasnip",
		languages = {
			lua = {
				template = {
					annotation_convention = "ldoc"
				}
			},
			python = {
				template = {
					annotation_convention = "google_docstrings"
				}
			},
			ruby = {
				template = {
					annotation_convention = "yard"
				}
			},
			typescript = {
				template = {
					annotation_convention = "tsdoc"
				}
			},
			typescriptreact = {
				template = {
					annotation_convention = "tsdoc"
				}
			},
		},
	}
}
