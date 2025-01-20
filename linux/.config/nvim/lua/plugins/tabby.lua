return {
	'nanozuki/tabby.nvim',
	config = function()
		require("tabby.tabline").set(function(line)
			return {
				line.tabs().foreach(function(t)
					local name = t.name()
					local number = t.number()
					local hl

					if t.is_current() then
						hl = "TabLineSel"
					else
						hl = "TabLineFill"
					end

					if name == '' or name == '_' or name == '%' then
						name = string.format('%d', number)
					end

					return {
						--line.sep(' ', 'GruvBoxGreen', hl),
						line.sep(' ', 'String', hl),
						name,
						--line.sep(' ', 'GruvBoxGreen', hl),
						line.sep(' ', 'String', hl),
						hl = hl
					}
				end),
				--line.sep('', 'TabLineSel', 'GruvBoxGreen'),
				line.sep('', 'TabLineSel', 'String'),
				line.spacer(),
				-- hl = 'TabLineFill'
			}
		end, {
			tab_name = {
				name_fallback = function(tabid)
					return "_"
				end
			},
		})
	end
}
