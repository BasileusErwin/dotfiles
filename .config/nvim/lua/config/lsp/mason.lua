local M = {}
local servers = require("config.lsp.servers")

local get_package_name = function()
	local package_name = {}

	for _, server in ipairs(servers) do
		if
			server.enable
			and not server.package_name ~= nil
			and (not server.package_name == "clangd" or not server.package_name == "dartls")
		then
			table.insert(package_name, server.package_name)
		end
	end

	return package_name
end

M.setup = function()
	local _, mason_tool = pcall(require, "mason-tool-installer")

	mason_tool.setup({
		ensure_installed = get_package_name(),
		run_on_start = true,
		auto_update = false,
		start_delay = 3000,
	})

	require("mason-lspconfig").setup()
end

return M
