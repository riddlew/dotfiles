return {
	{
		'nvim-treesitter/nvim-treesitter-textobjects',
		dependencies = {
			'nvim-treesitter/nvim-treesitter',
		}
	},
	{
		'nvim-treesitter/playground',
		dependencies = {
			'nvim-treesitter/nvim-treesitter',
		}
	},
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		config = function()
			require'nvim-treesitter.install'.compilers = {"clang", "gcc"}
			require'nvim-treesitter.configs'.setup {
				highlight = {
					-- Disabling syntax highlighting since there is no way to customize
					-- it now that they removed the TS* highlight groups.
					-- The documentation sucks and is just plain wrong, and doesn't work
					-- even when followed to the T. Fuck this garbage.
					-- Nevermind... can't even disable it with enable = false, that's
					-- how broken it is.
					enable = true,
					additional_vim_regex_highlighting = {'org'},
					disable = { "markdown" }
				},
				autotag = {
					enable = true
				},
				indent = {
					enable = false,
				},
				ensure_installed = {
					'bash',
					'c',
					'c_sharp',
					'cmake',
					'comment',
					'cpp',
					'css',
					'diff',
					'dockerfile',
					'git_rebase',
					'gitattributes',
					'gitcommit',
					'gitignore',
					'go',
					'gomod',
					'html',
					'java',
					'javascript',
					'jsdoc',
					'jq',
					'json',
					'lua',
					'luadoc',
					'make',
					'markdown',
					'markdown_inline',
					'meson',
					'ninja',
					'org',
					'php',
					'prisma',
					'python',
					'regex',
					'ruby',
					'rust',
					'scss',
					'toml',
					'tsx',
					'typescript',
					'yaml'
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = '<c-space>',
						node_incremental = '<c-space>',
						scope_incremental = '<c-f>',
						node_decremental = '<c-s-space>',
					},
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							['aa'] = '@parameter.outer',
							['ia'] = '@parameter.inner',
							['af'] = '@function.outer',
							['if'] = '@function.inner',
							['ac'] = '@class.outer',
							['ic'] = '@class.inner',
						},
					},
					move = {
						enable = true,
						set_jumps = true,
						goto_next_start = {
							[']m'] = '@function.outer',
							[']]'] = '@class.outer',
						},
						-- goto_next_end = {
						-- 	[']M'] = '@function.outer',
						-- 	[']['] = '@class.outer',
						-- },
						goto_previous_start = {
							['[m'] = '@function.outer',
							['[['] = '@class.outer',
						},
						-- goto_previous_end = {
						-- 	['[M'] = '@function.outer',
						-- 	['[['] = '@class.outer',
						-- },
					},
					swap = {
						enable = true,
						swap_next = {
							['\\x'] = '@parameter.inner',
						},
						swap_previous = {
							['\\X'] = '@parameter.inner',
						},
					},
				},
			}
		end
	},
}
