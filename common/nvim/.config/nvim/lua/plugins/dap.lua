return {
	{
		'mfussenegger/nvim-dap',
		config = function()
			local dap = require('dap')

			-- See DAPInstall.nvim plugin for more configurations.

			-- Debugs on local python version, but uses venv to run the program.
			-- Debugpy must be installed on host machine.
			-- CWD must be the root_dir with the venv file in it.
			dap.adapters.python = {
				type = "executable",
				-- command = "py",
				command = "python3",
				args = { "-m", "debugpy.adapter" },
			}
			dap.adapters.chrome = {
				type = 'executable',
				command = 'node',
				args = { os.getenv("HOME") .. "/.local/share/nvim/mason/packages/chrome-debug-adapter/out/src/chromeDebug.js" }
			}
			dap.adapters.node = {
				type = 'executable',
				command = 'node',
				args = { os.getenv("HOME") .. "/.local/share/nvim/mason/packages/node-debug2-adapter/out/src/nodeDebug.js" }
			}

			dap.configurations.python = {
				{
					type = "python";
					-- request = "launch";
					request = "defaultenv";
					name = "Launch default";
					program = "${file}";
					pythonPath = function()
						return "C:\\Python310\\python.exe"
					end;
				},
				{
					type = "python";
					request = "launch";
					name = "Launch local venv";
					program = "${file}";
					pythonPath = function()
						local cwd = vim.fn.getcwd()
						if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
							return cwd .. "/venv/bin/python"
						elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
							return cwd .. "/.venv/bin/python"
						elseif vim.fn.executable(cwd .. "\\venv\\Scripts\\python.exe") == 1 then
							return cwd .. "\\venv\\Scripts\\python.exe"
						elseif vim.fn.executable(cwd .. "\\.venv\\Scripts\\python.exe") == 1 then
							return cwd .. "\\.venv\\Scripts\\python.exe"
						end
					end;
				},
			}

			dap.configurations.typescriptreact = {
				{
					type = 'chrome',
					request = 'launch',
					name = 'Debug (Launch) Chrome',
					sourceMaps = true,
					protocol = "inspector",
					url = 'http://localhost:5100',
					trace = true,
					port = 9222,
					webRoot = '${workspaceFolder}',
				},
				{
					type = 'chrome',
					request = 'attach',
					name = 'Debug (Attach) Chrome',
					sourceMaps = true,
					protocol = "inspector",
					trace = true,
					port = 9222,
					webRoot = '${workspaceFolder}',
				},
			}

			dap.configurations.typescript = {
				{
					-- 1. Ensure tsconfig.json has sourceMaps enabled.
					-- 2. Build project to generate dist js files.
					-- 3. Change program name to entry point js file in
					--    dist folder.
					name = 'Debug (Launch) Node',
					type = 'node',
					request = 'launch',
					program = '${workspaceFolder}/server.ts',
					-- program = '${workspaceFolder}/dist/server.js',
					-- program = '${file}',
					-- cwd = "${workspaceRoot}",
					sourceMaps = true,
					protocol = 'inspector',
					console = 'integratedTerminal',
					outFiles = {"${workspaceFolder}/**/*.js"}
					-- outDir = "${workspaceRoot}/dist"
					-- trace = true,
					-- port = 9222,
				},
				{
					name = 'Debug (Attach PID) Node',
					type = 'node',
					request = 'attach',
					processId = require("dap.utils").pick_process,
				},
				{
					-- node / nodemon must be launched with --inspect flag 
					name = 'Debug (Attach Remote) Node',
					type = 'node',
					request = 'attach',
					port = 9229,
					address = "localhost",
					localRoot = "${workspaceFolder}",
					remoteRoot = "${workspaceFolder}",
				},
			}

			-- dap.adapters.ruby = {
			-- 	type = "executable",
			-- 	command = "rdbg",
			-- }
			--
			-- dap.configurations.ruby = {
			-- 	{
			-- 		type = "ruby",
			-- 		name = "Debug current file with rdbg",
			-- 		request = "launch",
			-- 		program = "${file}"
			-- 	},
			-- }

			-- dap.adapters.ruby = function(callback, config)
			-- 	callback {
			-- 		type = "server",
			-- 		host = "127.0.0.1",
			-- 		port = "${port}",
			-- 		executable = {
			-- 			command = "bundle",
			-- 			args = { "exec", "rdbg", "-n", "--open", "--port", "${port}",
			-- 				"-c", "--", "bundle", "exec", config.command, config.script,
			-- 			},
			-- 		},
			-- 	}
			-- end
			--
			-- dap.configurations.ruby = {
			-- 	{
			-- 		type = "ruby",
			-- 		name = "rdbg current file",
			-- 		request = "attach",
			-- 		localfs = true,
			-- 		command = "ruby",
			-- 		script = "${file}",
			-- 	},
			-- 	{
			-- 		type = "ruby",
			-- 		name = "run current spec file",
			-- 		request = "attach",
			-- 		localfs = true,
			-- 		command = "rspec",
			-- 		script = "${file}",
			-- 	},
			-- }
		end
	},
	{
		'rcarriga/nvim-dap-ui',
		dependencies = {
			'mfussenegger/nvim-dap',
			'nvim-neotest/nvim-nio',
		},
		config = function()
			local dap = require('dap')
			local dapui = require("dapui")

			dapui.setup({
				layouts = {
					{
						elements = {
							{
								id = 'scopes',
								size = 0.5
							},
							{
								id = 'watches',
								size = 0.5
							},
						},
						size = 20,
						position = 'left',
					},
					{
						elements = {
							{
								id = 'breakpoints',
								size = 0.5
							},
							{
								id = 'stacks',
								size = 0.5
							},
						},
						size = 20,
						position = 'right',
					},
					{
						elements = {
							'repl',
							'console',
						},
						size = 10,
						position = 'bottom'
					}
				},
			})

			-- Automatically open dap-ui
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end
	},
	{
		'nvim-telescope/telescope-dap.nvim',
		dependencies = {
			'mfussenegger/nvim-dap',
			'nvim-telescope/telescope.nvim'
		}
	},

	-- use {
	-- 	'suketa/nvim-dap-ruby',
	-- 	dependencies = { 'mfussenegger/nvim-dap' },
	-- }
}
