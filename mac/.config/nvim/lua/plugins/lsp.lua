local lsp_setup = function()
	local lspconfig = require("lspconfig")
	-- This is needed to fix broken LSP issues after update. Waiting for Neovim
	-- team to fix. https://github.com/neovim/nvim-lspconfig/issues/1907
	local is_win = vim.loop.os_uname().version:find('Windows')

	local navic = require("nvim-navic")

	local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

	capabilities.textDocument.completion.completionItem.snippetSupport = true

	-- local root_dir = require'lspconfig'.util.root_pattern("Gemfile", "compile_commands.json", ".ccls", ".git", "*.sln", ".vs", ".vscode", "Makefile", "CMakeLists.txt", "composer.json")
	local root_dirs = {
		common = {
			".git",
			"*.sln",
			".vs",
			".vscode",
		},
		pyright = {
			"pyproject.toml",
			"setup.py",
			"setup.cfg",
			"requirements.txt",
			"Pipfile",
			"pyrightconfig.json",
		},
		html = {
			"package.json",
		},
		cssls = {
			"package.json",
		},
		tsserver = {
			"package.json",
			"jsconfig.json",
			"tsconfig.json",
		},
		tailwindcss = {
			"tailwind.config.js",
			"tailwind.config.ts",
			"postcss.config.js",
			"postcss.config.ts",
			"package.json",
			"node_modules",
		},
		-- null_ls = {
		-- },
		clangd = {
			".clangd",
			".clagd-tidy",
			".clangd-format",
			"compile_commands.json",
			"compile_flags.txt",
			"configure.ac",
		},
		gopls = {
			"go.mod"
		},
		sumneko_lua = {
			".luarc.json",
			".luarc.jsonc",
			".luacheckrc",
			".stylua.toml",
			"stylua.toml",
			"selene.toml",
			"selene.yml",
		},
		solargraph = {
			"Gemfile",
		},
		cmake = {
			"CMakePresets.json",
			"CTestConfig.cmake",
			"build",
			"cmake"
		},
		sqlls = {
			"sqllsrc.json",
		},
		intelephense = {
			"composer.json",
		},
	}

	local function get_root_dirs(key)
		local lsp_roots = root_dirs[key]

		if not lsp_roots  then
			return lspconfig.util.root_pattern(table.concat(root_dirs.common, ","))
		end

		-- local extended = vim.tbl_extend("force", root_dirs.common, root_dirs[key])
		local extended = lsp_roots
		vim.list_extend(extended, root_dirs.common)
		return lspconfig.util.root_pattern(unpack(extended))
	end

	function on_attach(client, bufnr)
		navic.attach(client, bufnr)

		-- if client.name == "tsserver" then
		--   client.resolved_capabilities.document_formatting = false
		-- end

		-- client.server_capabilities.document_formatting = false
		-- client.server_capabilities.document_range_formatting = false

		-- Format on save
		-- if client.resolved_capabilities.document_formatting then
		--     vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
		-- end

		-- vim.cmd('autocmd BufWritePre <buffer> lua FormatFileOnSaveIfEnabled()')
	end

	local null_ls = require('null-ls')
	null_ls.setup({
		sources = {
			--null_ls.builtins.code_actions.eslint_d,
			--null_ls.builtins.diagnostics.eslint_d,
			null_ls.builtins.diagnostics.rubocop,
			--null_ls.builtins.formatting.eslint_d,
			null_ls.builtins.formatting.prettier,
			-- Example with args, not sure if .prettierrc takes precedence or not.
			-- null_ls.builtins.formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote" } }),
			null_ls.builtins.formatting.rubocop,
			null_ls.builtins.formatting.stylua,
		},
		diagnostics_format = "[#{s}] #{m} (#{c})",
		root_dir = lspconfig.util.root_pattern("Gemfile", "compile_commands.json", ".ccls", ".git", "*.sln", ".vs", ".vscode", "Makefile", "CMakeLists.txt"),
		detached = not is_win
	})

	lspconfig.angularls.setup{
		capabilities = capabilities,
	}

	lspconfig.bashls.setup{
		capabilities = capabilities,
	}

	-- require'lspconfig'.ccls.setup{
	--     root_dir = require'lspconfig'.util.root_pattern("compile_commands.json", ".ccls", ".git", "*.sln", ".vs", ".vscode", "Makefile", "CMakeLists.txt"),
	--     init_options = {
	--         compilationDatabaseDirectory = "build",
	--     },
	--     detached = not is_win
	--
	-- }

	lspconfig.clangd.setup{
		-- root_dir = root_dir,
		root_dir = get_root_dirs("clangd"),
		capabilities = capabilities,
		detached = not is_win
	}

	lspconfig.cmake.setup{
		capabilities = capabilities,
		root_dir = root_dir,
		detached = not is_win
	}

	lspconfig.cssls.setup{
		capabilities = capabilities,
		filetypes = {
			"css",
			"scss",
			"less",
			"liquid"
		}
	}

	lspconfig.cssmodules_ls.setup{
		capabilities = capabilities,
	}

	lspconfig.docker_compose_language_service.setup{
		capabilities = capabilities,
	}

	lspconfig.dockerls.setup{
		capabilities = capabilities,
	}

	-- lspconfig.emmet_ls.setup{
	-- 	capabilities = capabilities,
	-- 	detached = not is_win,
	-- 	filetypes = {
	-- 		'astro',
	-- 		'css',
	-- 		'eruby',
	-- 		'html',
	-- 		'htmldjango',
	-- 		'javascriptreact',
	-- 		'less',
	-- 		'pug',
	-- 		'sass',
	-- 		'scss',
	-- 		'svelte',
	-- 		'typescriptreact',
	-- 		'vue',
	-- 		'liquid'
	-- 	}
	-- }
	--
	lspconfig.emmet_language_server.setup{
		capabilities = capabilities,
		filetypes = {
		'astro',
		'css',
		'eruby',
		'html',
		'htmldjango',
		'javascriptreact',
		'less',
		'pug',
		'sass',
		'scss',
		'svelte',
		'typescriptreact',
		'vue',
		'liquid'
		},
	}

	lspconfig.gopls.setup{
		capabilities = capabilities,
		-- root_dir = root_dir,
		root_dir = get_root_dirs("gopls"),
		detached = not is_win
	}

	lspconfig.html.setup{
		capabilities = capabilities,
		-- root_dir = root_dir,
		root_dir = get_root_dirs("html"),
		detached = not is_win,
		-- filetypes = { "html", "eruby", "typescriptreact", "javascriptreact" }
		filetypes = { "html", "eruby", "liquid" }
	}

	lspconfig.intelephense.setup{
		capabilities = capabilities,
		root_dir = root_dir,
		detached = not is_win
	}

	lspconfig.jdtls.setup{
		capabilities = capabilities,
	}

	lspconfig.jsonls.setup{
		capabilities = capabilities,
		settings = {
			json = {
				schemas = {
					fileMatch = { 'package.json' },
					url = 'https://json.schemastore.org/package.json'
				}
			}
		}
	}

	lspconfig.lua_ls.setup {
		-- cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
		capabilities = capabilities,
		settings = {
			Lua = {
				runtime = {
					version = 'LuaJIT',
					-- path = vim.split(package.path, ';'),
				},
				diagnostics = {
					globals = {'vim'},
				},
				-- workspace = {
				--     library = {
				--         [vim.fn.expand('$VIMRUNTIME/lua')] = true,
				--         [vim.fn.expand('VIMRUNTIME/lua/vim/lsp')] = true,
				--     },
				-- },
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
					checkThirdParty = false,
				},
				telemetry = {
					enable = false,
				},
				completion = {
					workspaceWord = false,
					showWord = "Disable"
				}
			},
		},
		-- root_dir = root_dir,
		root_dir = get_root_dirs("sumneko_lua"),
		detached = not is_win
	}

	lspconfig.omnisharp.setup{
		capabilities = capabilities,
		-- cmd = {
		-- 	"dotnet",
		-- 	vim.fn.stdpath('data') .. "/mason/bin/omnisharp"
		--
		-- }
		cmd = { "omnisharp" }
	}

	lspconfig.prismals.setup{
		capabilities = capabilities,
	}

	lspconfig.pyright.setup{
		capabilities = capabilities,
		-- root_dir = root_dir,
		root_dirs = get_root_dirs("pyright"),
		detached = not is_win
	}

	-- ensure correct ruby version is being used by rvm (if you changed default, you have to restart WSL or new terminal sessions will not use the new default until WSL is restarted).
	-- gem install --user-install solargraph
	lspconfig.solargraph.setup{
		capabilities = capabilities,
		-- root_dir = root_dir,
		root_dir = get_root_dirs("solargraph"),
	}

	lspconfig.sqlls.setup{
		capabilities = capabilities,
		root_dir = get_root_dirs('sqlls'),
		detached = not is_win
	}

	lspconfig.tailwindcss.setup{
		capabilities = capabilities,
		-- root_dir = root_dir,
		root_dir = get_root_dirs("tailwindcss"),
	}

	lspconfig.tsserver.setup{
		capabilities = capabilities,
		-- root_dir = root_dir,
		root_dir = get_root_dirs("tsserver"),
		on_attach = on_attach,
		detached = not is_win
	}

	lspconfig.yamlls.setup{
		capabilities = capabilities,
	}

	-- Turn off virtual text on side (cannot scroll to view offscreen). Instead,
	-- use underline and display diagnostics using \d or \D.
	vim.diagnostic.config({
		virtual_text = false,
		-- virtual_text = true,
		signs = true,
		update_in_insert = true,
		underline = true
	})

	require'rust-tools'.setup({
		tools = {
			inlay_hints = {
				-- parameter_hints_prefix = " <- ",
				parameter_hints_prefix = "  ",
				-- other_hints_prefix = " -> ",
				other_hints_prefix = "  ",
			},
		},
		detached = not is_win
	})

	-- Conflicts with rust-tools
	-- require'lspconfig'.rls.setup{ capabilities = capabilities }

	require'lsp_signature'.setup({
		bind = true,
		handler_opts = {
			border = 'none'
		},
		max_width = 80,
		-- hi_parameter = "LspDiagnosticsInformation",
		floating_window = false, -- Turning off by default because it's doesn't work 100% of the time in python.
		floating_window_above_cur_line = false,
		hint_enable = false,
		-- toggle_key = '<C-s>',
		select_signature_key = '<C-a>',
	})
end

return {
	{
		'neovim/nvim-lspconfig',
		config = lsp_setup
	},
	{
		'ray-x/lsp_signature.nvim'
	},
	{
		'hrsh7th/cmp-nvim-lsp'
	},
	{
		'hrsh7th/cmp-nvim-lsp-document-symbol'
	},
	{
		'onsails/lspkind-nvim'
	},
	{
		'jose-elias-alvarez/null-ls.nvim'
	},
	{
		'SmiteshP/nvim-navic',
		dependencies = { 'neovim/nvim-lspconfig' },
	}
}
