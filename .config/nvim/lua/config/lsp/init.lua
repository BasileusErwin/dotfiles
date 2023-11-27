local M = {}
local servers = require("config.lsp.servers")

vim.g.markdown_fenced_languages = {
	"ts=typescript",
}

M.on_attach = function(client, bufnr)
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	require("config.lsp.keymaps").setup(client, bufnr)
end

M.capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
M.capabilities.textDocument.completion.completionItem.snippetSupport = true

-- icon
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	-- This sets the spacing and the prefix, obviously.
	virtual_text = {
		spacing = 4,
		prefix = "",
	},
})

M.setup = function()
	M.opts = {
		on_attach = M.on_attach,
		capabilities = M.capabilities,
	}

	local status_ok_dls, dlsconfig = pcall(require, "diagnosticls-configs")
	if status_ok_dls then
		dlsconfig.init({
			on_attach = M.on_attach,
			capabilities = M.capabilities,
		})
	end

	require("config.lsp.none_ls").setup(M.opts)
	require("config.lsp.mason").setup()

	for _, server in ipairs(servers) do
		if server.enable then
			server.config(M.on_attach, M.capabilities)
		end
	end

	require("lsp-colors").setup({
		Error = "#db4b4b",
		Warning = "#e0af68",
		Information = "#0db9d7",
		Hint = "#10B981",
	})

	for name, icon in pairs(vim.g.config.icons.diagnostics) do
		name = "DiagnosticSign" .. name
		vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
	end
end

return M
