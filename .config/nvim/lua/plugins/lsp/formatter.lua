local function formatterJS()
	local util = require("lspconfig.util")
	if util.root_pattern("rome.json")(vim.fn.expand("%:p")) then
		return {
			exe = "rome",
			args = { "format", vim.api.nvim_buf_get_name(0) },
			stdin = true,
		}
	else
		return {
			exe = "prettier",
			args = { vim.api.nvim_buf_get_name(0) },
			stdin = true,
		}
	end
end

return {
	"mhartington/formatter.nvim",
	config = function()
		-- Utilities for creating configurations
		local util = require("formatter.util")

		-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
		require("formatter").setup({
			-- Enable or disable logging
			logging = true,
			-- Set the log level
			log_level = vim.log.levels.WARN,
			-- All formatter configurations are opt-in
			filetype = {
				javascript = {
					formatterJS,
				},
				javascriptreact = {
					formatterJS,
				},
				typescript = {
					formatterJS,
				},
				typescriptreact = {
					formatterJS,
				},
				json = {
					formatterJS,
				},
				vue = {
					formatterJS,
				},
				html = {
					formatterJS,
				},
				css = {
					formatterJS,
				},
				scss = {
					formatterJS,
				},
        rust = {
					require("formatter.filetypes.rust").rustfmt,
          function()
						if util.get_current_buffer_file_name() == "special.lua" then
							return nil
						end
						return {
							exe = "rustfmt",
							args = {
								util.escape_path(util.get_current_buffer_file_path()),
							},
							stdin = true,
						}
          end
        },
				java = {
					require("formatter.filetypes.java").clangformat,
        },
				lua = {
					require("formatter.filetypes.lua").stylua,
					function()
						if util.get_current_buffer_file_name() == "special.lua" then
							return nil
						end
						return {
							exe = "stylua",
							args = {
								"--search-parent-directories",
								"--stdin-filepath",
								util.escape_path(util.get_current_buffer_file_path()),
								"--",
								"-",
							},
							stdin = true,
						}
					end,
				},
				["*"] = {
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			},
		})
	end,
}
