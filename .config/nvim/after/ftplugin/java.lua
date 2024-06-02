if vim.g.vscode then
	return
end

local jdtls_ok, jdtls = pcall(require, "jdtls")
if not jdtls_ok then
	return
end

vim.bo.shiftwidth = 2
vim.bo.tabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.cmdheight = 2

local MASON_HOME = vim.fn.stdpath("data") .. "/mason"
local JDTLS_LOCATION = MASON_HOME .. "/packages/jdtls"
local JAVA_DEBUG_ADAPTER_LOCATION = MASON_HOME .. "/packages/java-debug-adapter/extension/server"

local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local config = {
	cmd = {
    JDTLS_LOCATION .. "/jdtls"
	},
	on_attach = function(client, bufnr)
		require("jdtls").setup_dap({ hotcodereplace = "auto" })
		require("jdtls.dap").setup_dap_main_class_configs()
		require("config.lsp").on_attach(client, bufnr)
	end,
	capabilities = require("config.lsp").capabilities,
	root_dir = vim.fs.dirname(vim.fs.find({ ".git", "gradlew", "mvnw" }, { upward = true})[1]),
	init_options = {
		bundles = {
			vim.fn.glob(JAVA_DEBUG_ADAPTER_LOCATION .. "/com.microsoft.java.debug.plugin-*.jar"),
			vim.fn.glob(MASON_HOME .. "/packages/java-test/extension/server/*.jar"),
		},
	},
}

jdtls.start_or_attach(config)
