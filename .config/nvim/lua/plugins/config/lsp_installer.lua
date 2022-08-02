local status_ok,lsp_installer = pcall(require,"nvim-lsp-installer")
if not status_ok then
  return
end

lsp_installer.settings({
  ensure_installed = {
    "jdtls",
    "intelephense",
    "ccls",
    "hls",
    "rust_analyzer",
    "tsserver",
    "vimls",
    "volar",
    "eslint",
    "hls",
    "bashls",
    "html",
    "jsonls",
    "sumneko_lua",
    "pyright",
    "sqls",
    "lemminx",
    "cssls",
    "zls",
    "diagnosticls",
    "clangd",
    "cmake",
    "dockerls",
    "emmet_ls",
    "gopls",
  },
  automatic_installation = true,
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    },
  install_root_dir = vim.fn.stdpath("data").."/lsp_servers"
})
