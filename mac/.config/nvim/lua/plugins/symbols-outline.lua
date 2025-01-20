-- This works with LSP but doesn't work with ctags.

return {
	'simrat39/symbols-outline.nvim',
	opts = {
		symbols = {
			Array         = {icon = "", hl = "TSConstant"},
			Boolean       = {icon = "", hl = "TSBoolean"},
			Class         = {icon = "", hl = "TSType"},
			Constant      = {icon = "", hl = "TSConstant"},
			Constructor   = {icon = "", hl = "TSConstructor"},
			Enum          = {icon = "", hl = "TSType"},
			EnumMember    = {icon = "", hl = "TSField"},
			Event         = {icon = "", hl = "TSType"},
			Field         = {icon = "", hl = "TSField"},
			File          = {icon = "", hl = "TSURI" },
			Function      = {icon = "", hl = "TSFunction"},
			Interface     = {icon = "", hl = "TSType"},
			Key           = {icon = "", hl = "TSType"},
			Method        = {icon = "", hl = "TSMethod"},
			Module        = {icon = "", hl = "TSURI" },
			Namespace     = {icon = "﯂", hl = "TSNamespace"},
			Null          = {icon = "", hl = "TSType"},
			Number        = {icon = "", hl = "TSNumber"},
			Object        = {icon = "", hl = "TSType"},
			Operator      = {icon = "", hl = "TSOperator"},
			Package       = {icon = "", hl = "TSNamespace"},
			Property      = {icon = "", hl = "TSMethod"},
			String        = {icon = "", hl = "TSString"},
			Struct        = {icon = "פּ", hl = "TSType"},
			TypeParameter = {icon = "𝙏", hl = "TSParameter"},
			Variable      = {icon = "", hl = "TSConstant"},
		}
	}
}
