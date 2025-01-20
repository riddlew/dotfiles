local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local m = require("luasnip.extras").m
local lambda = require("luasnip.extras").l
local postfix = require("luasnip.extras.postfix").postfix



-- FOR TESTING ----------------------------------------------------------------
local function column_count_from_string(descr)
	-- this won't work for all cases, but it's simple to improve
	-- (feel free to do so! :D )
	return #(descr:gsub("[^clm]", ""))
end

-- function for the dynamicNode.
local tab = function(args, snip)
	local cols = column_count_from_string(args[1][1])
	-- snip.rows will not be set by default, so handle that case.
	-- it's also the value set by the functions called from dynamic_node_external_update().
	if not snip.rows then
		snip.rows = 1
	end
	local nodes = {}
	-- keep track of which insert-index we're at.
	local ins_indx = 1
	for j = 1, snip.rows do
		-- use restoreNode to not lose content when updating.
		table.insert(nodes, r(ins_indx, tostring(j).."x1", i(1)))
		ins_indx = ins_indx+1
		for k = 2, cols do
			table.insert(nodes, t" & ")
			table.insert(nodes, r(ins_indx, tostring(j).."x"..tostring(k), i(1)))
			ins_indx = ins_indx+1
		end
		table.insert(nodes, t{"\\\\", ""})
	end
	-- fix last node.
	nodes[#nodes] = t""
	return sn(nil, nodes)
end
-- END TESTING ----------------------------------------------------------------









local function get_remaining_length()
	-- Get the position of cursor to account for indentation.
	local pos = vim.api.nvim_win_get_cursor(0)
	local y = pos[1]
	local x = pos[2]
	local length = 79 - x
	return length
end

local same = function(char, index, lengths)
	lengths = lengths or 0
	return f(function(arg)
		-- print(vim.inspect(arg))
		-- print(arg[1][1]:len())
		-- local len = arg[1][1]:len()
		local total = get_remaining_length() - lengths
		return string.rep(char, total)
	end, { index })
end

local function repeating(repstr, node_num, length)
	return f(function(arg)
		-- print(vim.inspect(arg))
		-- print(arg[1][1]:len())
		local len = arg[1][1]:len()
		return string.rep(repstr, length - len - 2)
	end, { node_num })
end

local function repeating_center_part(repstr, node_num, length, side, pad)
	return f(function(args)
		local len = args[1][1]:len()
		local halflen, halflength
		if side == 0 then
			halflen = len % 2 == 0 and len / 2 or math.floor(len / 2) + 1
			halflength = length % 2 == 0 and length / 2 or math.floor(length / 2)
			return string.rep(repstr, halflength - halflen - pad:len()) .. pad
		else
			halflen = len % 2 == 0 and len / 2 or math.floor(len / 2)
			halflength = length % 2 == 0 and length / 2 or math.floor(length / 2) + 1
			return pad .. string.rep(repstr, halflength - halflen - pad:len())
		end
	end, { node_num })
end

local function one_liner_left(begstr, midstr, endstr, neg)
	local neg = neg or 0
	local length = get_remaining_length() - endstr:len() - begstr:len()
	return sn(nil, {
		t(begstr),
		t(" "),
		i(1),
		t(" "),
		repeating(midstr, 1, length - neg),
		t(endstr)
	})
end

local function one_liner_center(begstr, midstr, endstr, neg, pad)
	local neg = neg or 0
	local pad = pad or " "
	local length = get_remaining_length() - endstr:len() - begstr:len()
	return sn(nil, {
		t(begstr),
		repeating_center_part(midstr, 1, length, 0, pad),
		i(1),
		repeating_center_part(midstr, 1, length - neg, 1, pad),
		t(endstr)
	})
end


local function create_line(begstr, midstr, endstr, neg)
	-- neg used to account for short strings, such as making a box with
	-- /* and */, where */ needs to stop 1 char earlier (otherwise it will go
	-- over the 79 char limit).
	local neg = neg or 0
	local midlen = begstr:len() + endstr:len() - neg
	return begstr .. string.rep(midstr, get_remaining_length() - midlen) .. endstr
end

-- local recursive
-- recursive = function(char)
-- 	return sn(
-- 		nil,
-- 		c(1, {
-- 			f(function() return create_line(char) end),
-- 			fmt([[
-- 			{} {}{} {}
-- 			{}
-- 			]], {
-- 				t(char),
-- 				i(1),
-- 				same(" ", 1),
-- 				t(char),
-- 				d(2, function() return recursive(char) end, {})
-- 			})
-- 		-- sn(
-- 		-- 	nil,
-- 		-- 	{
-- 		-- 		t("# "),
-- 		-- 		i(1),
-- 		-- 		same(1),
-- 		-- 		t({"",""}),
-- 		-- 		d(2, recursive, {}),
-- 		-- 	}
-- 		-- )
--     })
--   )
-- end

function create_middle(begstr, endstr, padchar, neg)
	local neg = neg or 0
	local lengths = endstr:len() - neg
	return sn(nil, {
		t(begstr),
		i(1),
		-- same(padchar, 1, lengths),
		-- t(endstr)
	})
end

function create_single_line(begstr, padchar, endstr)
	local lengths = endstr:len() + 1 -- add 2 for spaces
	return sn(nil, {
		t(begstr),
		t(" "),
		i(1),
		t(" "),
		same(padchar, 1, lengths),
		t(endstr)
	})
end

return {
	s(
		{
		trig = "#l",
		name = "Comment Line #",
		},
		fmt(
			[[
				{}
			]],
			{
				d(1, function() return one_liner_left("#", "#", "#") end),
			}
		)
	),
	s(
		{
		trig = "#lc",
		name = "Comment Line #",
		},
		fmt(
			[[
				{}
			]],
			{
				d(1, function() return one_liner_center("#", "#", "#") end),
			}
		)
	),
	s(
		{
		trig = "#b",
		name = "Comment Box #",
		},
		fmt(
			[[
				{}
				{}
				{}
			]],
			{
				f(function() return create_line("#", "#", "#") end),
				d(1, function() return create_middle("# ", " #", " ") end),
				f(function() return create_line("#", "#", "#") end),
			}
		)
	),
	s(
		{
		trig = "*b",
		name = "Comment Box *",
		},
		fmt(
			[[
				{}
				{}
				{}
			]],
			{
				f(function() return create_line("/*", "*", "*", -1) end),
				d(1, function() return create_middle(" * ", " *", " ", -1) end),
				f(function() return create_line(" *", "*", "*/") end),
			}
		)
	),
	s(
		{
		trig = "/*l",
		name = "Comment Line *",
		},
		fmt(
			[[
				{}
			]],
			{
				d(1, function() return one_liner_left("/***", "*", "*/") end),
			}
		)
	),
	s(
		{
		trig = "/*lc",
		name = "Comment Line *",
		},
		fmt(
			[[
				{}
			]],
			{
				d(1, function() return one_liner_center("/*", "*", "*/") end),
			}
		)
	),
	s(
		{
		trig = "/b",
		name = "Comment Box /",
		},
		fmt(
			[[
				{}
				{}
				{}
			]],
			{
				f(function() return create_line("//", "/", "/") end),
				d(1, function() return create_middle("// ", " //", " ") end),
				f(function() return create_line("//", "/", "/") end),
			}
		)
	),
	s(
		{
		trig = "//l",
		name = "Comment Line /",
		},
		fmt(
			[[
				{}
			]],
			{
				d(1, function() return one_liner_left("//", "/", "/") end),
			}
		)
	),
	s(
		{
		trig = "//lc",
		name = "Comment Line /",
		},
		fmt(
			[[
				{}
			]],
			{
				d(1, function() return one_liner_center("//", "/", "/") end),
			}
		)
	),
	s(
		{
		trig = "--b",
		name = "Comment box -",
		},
		fmt(
			[[
				{}
				{}
				{}
			]],
			{
				f(function() return create_line("-", "-", "-") end),
				d(1, function() return create_middle("-- ", " --", " ") end),
				f(function() return create_line("-", "-", "-") end),
			}
		)
	),
	s(
		{
		trig = "--bc",
		name = "Comment box centered -",
		},
		fmt(
			[[
				{}
				{}
				{}
			]],
			{
				f(function() return create_line("-", "-", "-") end),
				d(1, function() return one_liner_center("-- ", " ", " --", false) end),
				f(function() return create_line("-", "-", "-") end),
			}
		)
	),
	s(
		{
		trig = "--l",
		name = "Comment line -",
		},
		fmt(
			[[
				{}
			]],
			{
				d(1, function() return one_liner_left("--", "-", "-") end),
			}
		)
	),
	s(
		{
		trig = "--lc",
		name = "Comment line centered -",
		},
		fmt(
			[[
				{}
			]],
			{
				d(1, function() return one_liner_center("--", "-", "-") end),
			}
		)
	),

	s("test", fmt([[
	\begin{{tabular}}{{{}}}
	{}
	\end{{tabular}}
	]], {i(1, "c"), d(2, tab, {1}, {
		user_args = {
			-- Pass the functions used to manually update the dynamicNode as user args.
			-- The n-th of these functions will be called by dynamic_node_external_update(n).
			-- These functions are pretty simple, there's probably some cool stuff one could do
			-- with `ui.input`
			function(snip) snip.rows = snip.rows + 1 end,
			-- don't drop below one.
			function(snip) snip.rows = math.max(snip.rows - 1, 1) end
		}
	} )})),
}
