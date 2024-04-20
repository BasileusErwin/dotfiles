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
					"<Plug>RestNvim<CR>",
					"Run the request under the cursor",
				},
				p = {
					"<Plug>RestNivmPreview<CR>",
					"Preview the request cURL command",
				},
				l = {
					"<Plug>RestNvimLast<CR>",
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
			x = {
				function()
					require("dap").terminate()
					require("dap").clear_breakpoints()
					require("dapui").close()
				end,
				"Disconnect",
			},
		},

		b = {
			name = "Buffer",
			b = { "<Cmd>BufferLineSortByTab<CR>", "Sort buffer by buffer number" },
			d = { "<Cmd>BufferLineSortByDirectory<CR>", "Sort buffer by directory" },
			r = { "<Cmd>BufferLineSortByRelativeDirectory<CR>", "Sort buffer by relative directory" },
			l = { "<Cmd>BufferLineSortByExtension<CR>", "Sort buffer by extension" },
			w = { "<Cmd>BufferLineSortByWindowNumber<CR>", "Sort buffer by Window Number" },
		},

		i = {
			name = "Notes Obsidian",
			s = { "<cmd>ObsidianSearch<CR>", "Grep notes" },
			n = { "<cmd>ObsidianNew<CR>", "New note" },
			t = { "<cmd>ObsidianToday<CR>", "Today note" },
			f = { "<cmd>ObsidianQuickSwitch<CR>", "Search file note" },
		},

		f = {
			name = "Find",
			g = { '<cmd>lua require("telescope.builtin").live_grep()<CR>', "Live Grep" },
			f = { '<cmd>lua require("telescope.builtin").find_files()<CR>', "Find files" },
			b = { '<cmd>lua require("telescope.builtin").buffers()<CR>', "Find in buffer" },
		},

		G = {
			name = "Git",
			h = {
				name = "Hunk",
				s = {
					name = "Stage",
					'<Cmd>lua require("gitsigns").stage_hunk()<CR>',
				},
				S = {
					name = "Stage Buffer",
					'<Cmd>lua require("gitsigns").stage_buffer()<CR>',
				},
				u = {
					name = "Undo",
					'<Cmd>lua require("gitsigns").undo_stage_hunk()<CR>',
				},
				r = {
					name = "Reset",
					'<Cmd>lua require("gitsigns").stage_hunk(gs.reset_hunk {vim.fn.line("."), vim.fn.line("v")})<CR>',
				},
				p = {
					name = "Preview",
					'<Cmd>lua require("gitsigns").preview_hunk()<CR>',
				},
				d = {
					name = "Diff",
					'<Cmd>lua require("gitsigns").diffthis()<CR>',
				},
				D = {
					name = "Diff all",
					'<Cmd>lua require("gitsigns").diffthis("~")<CR>',
				},
			},
			t = {
				name = "Toggle line blame",
				'<Cmd>lua require("gitsigns").toggle_line_blame()<CR>',
			},
			c = {
				name = "Commit",
				'<Cmd>lua require("tinygit").smartCommit()<CR>',
			},
			p = {
				name = "Push",
				'<Cmd>lua require("tinygit").push()<CR>',
			},
			r = {
				name = "Github PR",
				'<Cmd>lua require("tinygit").ceateGithubPr()<CR>',
			},
			s = {
				name = "Status",
				'<Cmd>lua require("tinygit").status()<CR>',
			},
			S = {
				name = "Stash",
				p = {
					name = "Push",
					'<Cmd>lua require("tinygit").stashPop()<CR>',
				},
				P = {
					name = "Pop",
					'<Cmd>lua require("tinygit").stashPop()<CR>',
				},
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
