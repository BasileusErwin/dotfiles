local M = {}

M.opts = {
	mode = "n", -- Normal mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = false, -- use `nowait` when creating keymaps
}

M.v_opts = {
	mode = "v", -- Visual mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = false, -- use `nowait` when creating keymaps
}

M.code_keymap = function(whichkey)
	vim.cmd("autocmd FileType * lua CodeRunner()")

	function CodeRunner()
		local bufnr = vim.api.nvim_get_current_buf()
		local file_type = vim.api.nvim_buf_get_option(bufnr, "filetype")
		local keymap = nil
		local visual_keymap = nil

		if file_type == "http" then
			keymap = {
				name = "HTTP Client",
				r = {
					"<cmd>Rest run<CR>",
					"Run the request under the cursor",
				},
				o = {
					"<cmd>Rest logs<CR>",
					"Show rest logs",
				},
				l = {
					"<cmd>Rest last<CR>",
					"Re-run the last request",
				},
			}

			whichkey.register({ l = keymap }, {
				mode = "v", -- Visual mode
				prefix = "<leader>",
				buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
				silent = true, -- use `silent` when creating keymaps
				noremap = true, -- use `noremap` when creating keymaps
				nowait = false, -- use `nowait` when creating keymaps
			})
		elseif file_type == "jdtls" then
			keymap = {
				name = "Code",
				o = { '<cmd>lua require("jdtls").organize_imports()<CR>', "Sort Imports" },
				u = { "<cmd>JdtUpdateConfig<CR>", "Update Config" },
			}
		end

		if keymap ~= nil then
			whichkey.register(
				{ l = keymap },
				{ mode = "n", silent = true, noremap = true, buffer = bufnr, prefix = "<leader>" }
			)
		elseif visual_keymap ~= nil then
		end
	end
end

M.setup = function(_, conf)
	local status_ok, whichkey = pcall(require, "which-key")

	if not status_ok then
		return
	end

	local mappings = {
		["w"] = { "<cmd>update!<CR>", "Save" },
		["q"] = { "<cmd>q!<CR>", "Quit" },

		e = {
			require("oil").open_float,
			"Explorer",
		},

		a = {
			"<cmd>AerialToggle!<CR>",
			"Aerial",
		},

		d = {
			"DAP",
			r = { '<cmd>lua require("dap").eval<CR>', "Eval" },
			R = { '<cmd>lua require("dap").run_to_cursor<CR>', "Run to cursor" },
			c = { "<cmd>DapContinue<CR>", "Continue" },
			s = { "<cmd>DapStepOver<CR>", "Step Over" },
			i = { "<cmd>DapStepInto<CR>", "Step Into" },
			o = { '<cmd>lua require("dap").step_out<CR>', "Step Out" },
			b = { "<cmd>DapToggleBreakpoint<CR>", "Toggle Breakpoint" },
			B = {
				'<cmd>lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>',
				"Set Breakpoint",
			},
			u = { "<cmd> lua require('dapui').toggle()<CR>", "Toggle UI" },
			x = {
				function()
					require("dap").terminate()
					require("dap").clear_breakpoints()
					require("dapui").close()
				end,
				"Disconnect",
			},
		},

		f = {
			name = "Find",
			g = { "<cmd>FzfLua grep<CR>", "Live Grep" },
			f = { "<cmd>FzfLua files<CR>", "Find files" },
			b = { "<cmd>FzfLua buffers<CR>", "Find in buffer" },
			G = {
				name = "Git",
				s = { "<cmd>FzfLua git_status<CR>", "Git status" },
				r = { "<cmd>FzfLua <CR>", "Reset hunk" },
				p = { '<cmd>lua require("gitsigns").preview_hunk()<CR>', "Preview hunk" },
			},
			l = {
				name = "LSP",
				i = { "<cmd>FzfLua lsp_implementations<CR>", "lsp_implementations" },
				t = { "<cmd>FzfLua lsp_type_definitions<CR>", "Type Definitions" },
				d = { "<cmd>FzfLua lsp_definitions<CR>", "Definitions" },
				r = { "<cmd>FzfLua lsp_references<CR>", "References" },
				D = { "<cmd>FzfLua lsp_declarations", "Declarations" },
			},
		},
	}

	local visual_keymap = {}

	whichkey.setup(conf)
	whichkey.register(mappings, M.opts)
	whichkey.register(visual_keymap, M.v_opts)
	M.code_keymap(whichkey)
end

return M
