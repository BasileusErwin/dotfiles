return {
	"rcarriga/nvim-dap-ui",
	event = {
		"BufRead *.ts",
		"BufRead *.js",
		"BufRead *.rs",
	},
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",
		"mxsdev/nvim-dap-vscode-js",
		"nvim-telescope/telescope-dap.nvim",
		"rcarriga/cmp-dap",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapStopped", { text = "▶", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapBreakpointRejected", { text = "🚫", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapBreakpointCondition", { text = "❓", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapLogPoint", { text = "💬", texthl = "", linehl = "", numhl = "" })

		dapui.setup({
			icons = { expanded = "▾", collapsed = "▸" },
			layouts = {
				{
					elements = {
						"scopes",
						"breakpoints",
						"stacks",
						"watches",
					},
					size = 80,
					position = "right",
				},
				{
					elements = {
						"repl",
						"console",
					},
					size = 10,
					position = "bottom",
				},
			},
		})

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open({})
		end

		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			name = "codelldb",
			executable = {
				command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
				args = { "--port", "${port}" },
			},
		}

		dap.configurations.rust = {
			{
				name = "launch",
				type = "codelldb",
				request = "launch",
				program = function()
					local dir = vim.fn.getcwd()
					return dir .. "/target/debug/" .. vim.fs.basename(dir)
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = function()
					local resp = vim.fn.input("Arguments: ")
					if resp == "" then
						return {}
					end

					return vim.fn.split(resp, " ")
				end,
			},
			{
				name = "custom",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = function()
					local resp = vim.fn.input("Arguments: ")
					if resp == "" then
						return {}
					end

					return vim.fn.split(resp, " ")
				end,
			},
		}

		require("dap-vscode-js").setup({
			debugger_cmd = { "js-debug-adapter" },
			adapters = {
				"pwa-node",
				"pwa-chrome",
				"node-terminal",
			},
		})

		for _, language in ipairs({ "typescript", "javascript" }) do
			dap.configurations[language] = {
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					cwd = "${workspaceFolder}",
				},
				{
					type = "pwa-node",
					request = "attach",
					name = "Attach",
					processId = require("dap.utils").pick_process,
					cwd = "${workspaceFolder}",
				},
			}
		end

		for _, language in ipairs({ "typescriptreact", "javascriptreact" }) do
			dap.configurations[language] = {
				{
					type = "pwa-chrome",
					name = "Attach - Remote Debugging",
					request = "attach",
					program = "${file}",
					cwd = vim.fn.getcwd(),
					sourceMaps = true,
					protocol = "inspector",
					port = 9222,
					webRoot = "${workspaceFolder}",
				},
				{
					type = "pwa-chrome",
					name = "Launch Chrome",
					request = "launch",
					url = "http://localhost:3000",
				},
			}
		end

		local telescope_status, telescope = pcall(require, "telescope")

		if telescope_status then
			telescope.load_extension("dap")
		end
	end,
}
