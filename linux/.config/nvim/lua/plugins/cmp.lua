return {
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'hrsh7th/cmp-cmdline',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-nvim-lua',
			'saadparwaiz1/cmp_luasnip',
			-- Github Source for cmp.
			'petertriho/cmp-git'
		},
		config = function()
			local cmp = require'cmp'
			local ng = require('neogen')
			local ls = require('luasnip')
			-- local cmp_ultisnips = require('cmp_nvim_ultisnips')
			-- cmp_ultisnips.setup{
			--     filetype_source = "ultisnips_default"
			-- }

			local src, formatdict

			local lspkind = require('lspkind')
			local types = require('cmp.types')
			require'lspkind'.init({
				node = "text",
				-- Either 'default' or 'codicons'.
				-- default requries nerd-fonts font
				-- codicons requires vscode-codicons fonts
				preset = 'default',

				-- These are default unicodes and should work with any font.
				symbol_map = {
						-- Class         = 'ﴯ',
						Class         = '',
						Color         = '',
						Constant      = '',
						-- Constructor   = '',
						Constructor   = '',
						Enum          = '',
						EnumMember    = '',
						Event         = '',
						-- Field         = '',
						Field         = '',
						File          = '',
						Folder        = '',
						Function      = '',
						Interface     = '',
						Keyword       = '',
						Method        = '',
						Module        = '',
						Operator      = '',
						-- Property      = '',
						-- Property      = '',
						Property      = '',
						Reference     = '',
						Snippet       = '',
						Struct        = 'פּ',
						Text          = '',
						TypeParameter = '𝙏',
						Unit          = '塞',
						Variable      = '',
						Value         = ''
				}
			})

			src = {
				-- { name = "gh_issues" },
				{ name = 'git' },
				{ name = 'nvim_lsp' },
				{ name = 'path' },
				{ name = 'luasnip' }, -- For luasnip users.
				-- { name = 'vsnip' }, -- For vsnip users.
				-- { name = 'ultisnips' }, -- For ultisnips users.
				-- { name = 'snippy' }, -- For snippy users.
			}

			formatdict =  {
				format = lspkind.cmp_format({
					-- mode = "text",
					mode = "symbol_text",
					maxwidth = 50,
					menu = {
						-- buffer = "[buf]",
						-- nvim_lsp = "[LSP]",
						-- path = "[path]",
						-- gh_issues = "[issue]",
						-- luasnip = "[snip]",
						-- ultisnips = "[snip]",
					},
					before = function(entry, vim_item)
						-- local word = entry.get_insert_text()
						-- if entry.completion_item.insertTextFormat  ==  types.lsp.InsertTextFormat.Snippet then
						--     word = vim.lsp.util.parse_snippet(word)
						-- end
						-- word = str.oneline(word)
						-- if entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet then
						--     word = word .. "~"
						-- end
						-- vim_item.abbr = word

						-- Remove the ~
						if entry.completion_item.kind == types.lsp.CompletionItemKind.Snippet then
							vim_item.abbr = vim_item.abbr:sub(1, -2)
						end
						return vim_item
					end
				})
			}

			-- src = {
			--   -- { name = "gh_issues" },
			--   { name = 'git' },
			--   { name = 'path' },
			--   { name = 'luasnip' }, -- For luasnip users.
			--   -- { name = 'vsnip' }, -- For vsnip users.
			--   -- { name = 'ultisnips' }, -- For ultisnips users.
			--   -- { name = 'snippy' }, -- For snippy users.
			-- }
			--
			-- formatdict = {
			--   fields = { 'abbr', 'kind', 'menu' },
			--   format = function(_, vim_item)
			--     return vim_item
			--   end,
			-- }

			cmp.setup({
				-- Uncomment this to hide code completion until C-n / C-p
				completion = {
					-- autocomplete={ "TextChanged" }
					autocomplete={}
				},
				preselect = cmp.PreselectMode.None,
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
					-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
					ls.lsp_expand(args.body) -- For `luasnip` users.
					-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
					-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
					end,
				},
				window = {
					-- completion = cmp.config.window.bordered(),
					-- documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
					['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
					['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
					-- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
					['<C-y>'] = cmp.mapping.confirm({ select = true }),
					['<C-c>'] = cmp.mapping({
						i = cmp.mapping.abort(),
						c = cmp.mapping.close(),
					}),
					-- ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					['<C-n>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							-- IF STACKOVERFLOW STLL OCCURS, IT SAYS ITS HAPPENING HERE
							cmp.select_next_item()
						else
							cmp.complete()
						end
					end, {"i", "s"}),
					['<C-p>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						else
							cmp.complete()
						end
					end, {"i", "s"}),
					['<C-f>'] = cmp.mapping(function(fallback)
						if ng.jumpable() then
							ng.jump_next()
						else
							fallback()
						end
					end, {"i", "s"}),
					['<C-b>'] = cmp.mapping(function(fallback)
						if ng.jumpable(true) then
							ng.jump_prev()
						else
							fallback()
						end
					end, {"i", "s"}),
					['<C-j>'] = cmp.mapping(function(fallback)
						-- Stack overflow
						-- fallback()
					end, {"i", "s"}),
					['<C-k>'] = cmp.mapping(function(fallback)
						-- Stack overflow
						-- fallback()
					end, {"i", "s"}),
					['<C-x>'] = cmp.mapping(function()
						local autocomplete = cmp.get_config().completion.autocomplete
						if #autocomplete == 0 then
							cmp.setup { completion = { autocomplete = { "TextChanged" } } }
						else
							cmp.setup { completion = { autocomplete = {} } }
						end
						-- print(vim.inspect(cfg.completion.autocomplete))
						--cmp.get_config().completion.autocomplete
						-- {}
						-- { "TextChanged" }
						-- cmp.setup { completion = { autocomplete = not cmp.completion.autocomplete }}
					end, {"i", "s"}),
				}),
				sources = cmp.config.sources(src, {
					-- Keyword length makes it so those sources don't spam the pum and don't show until word is at least 5 char long.
					{ name = 'buffer', keyword_length=5 },
					{ name = 'orgmode' }
				}),
				formatting = formatdict,
				experimental = {
					native_menu = false,
					ghost_text = false,
				},
			})

			-- Set configuration for specific filetype.
			cmp.setup.filetype('gitcommit', {
				sources = cmp.config.sources({
					{ name = 'git' }, -- You can specify the `cmp_git` source if you were installed it.
				}, {
					{ name = 'buffer' },
				})
			})

			-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline('/', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = 'buffer' }
				}
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(':', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = 'path' }
				}, {
					-- Keyword pattern stops it from locking up while gathering all possible
					-- OS commands.
					{ name = 'cmdline', keyword_pattern=[=[[^[:blank:]\!]*]=] }
				})
			})

			require('cmp_git').setup()
		end
	},
}
