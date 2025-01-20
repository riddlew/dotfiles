return {
	'anuvyklack/hydra.nvim',
	config = function()
		local hydra = require('hydra')
		-- local debug_hydra = [[
		-- _c_: continue / start    _n_: step over
		-- _q_: exit debug          _i_: step into
		-- ^ ^                      _o_: step out
		-- _r_: toggle repl
		-- _p_: inspect @ cursor    _b_: toggle breakpoint
		-- _t_: toggle dapui        _m_: breakpoint with message
		-- ^ ^                      _B_: breakpoint with condition
		-- _<Esc>_: Exit hydra
		-- ]]
		-- hydra({
		-- 	name = 'debug',
		-- 	hint = debug_hydra,
		-- 	config = {
		-- 		color = 'pink',
		-- 		invoke_on_body = true,
		-- 		hint = {
		-- 			border = 'rounded',
		-- 		}
		-- 	},
		-- 	mode = 'n',
		-- 	body = '\\t',
		-- 	heads = {
		-- 		{ 'c', '<cmd>DapContinue<CR>' },
		-- 		{ 'q', '<cmd>lua require"dap".close()<CR>' },
		-- 		{ 'r', '<cmd>DapToggleRepl<CR>' },
		-- 		{ 'p', '<cmd>lua require"dap.ui.widgets".hover()<CR>' },
		-- 		{ 't', '<cmd>lua require"dapui".toggle()<CR>' },
		-- 		{ 'n', '<cmd>DapStepOver<CR>' },
		-- 		{ 'i', '<cmd>DapStepInto<CR>' },
		-- 		{ 'o', '<cmd>DapStepOver<CR>' },
		-- 		{ 'b', '<cmd>DapToggleBreakpoint<CR>' },
		-- 		{ 'm', '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Message: "))<CR>' },
		-- 		{ 'B', '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Condition: "))<CR>' },
		-- 		{ '<Esc>', nil, { exit = true, nowait = true } },
		-- 	}
		-- })
	end
}
