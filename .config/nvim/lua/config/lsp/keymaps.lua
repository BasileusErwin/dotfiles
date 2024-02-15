local M = {}
local keymap = vim.api.nvim_set_keymap

M.setup = function(client, bufnr)
  local opts = { noremap = true, silent = true }

  local status_ok, whichkey = pcall(require, "which-key")

  if not status_ok then
    return
  end

  -- Key mappings
  keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  keymap("n", "[e", "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>", opts)
  keymap("n", "]e", "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>", opts)
  keymap("n", "<C-S-j>", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)


  local keymap_l = {
    c = {
      name = "Code",
      r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Raname" },
      a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
      d = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Line Diagnostics" },
      i = { "<cmd>LspInfo<CR>", "Lsp info" },
      f = { '<cmd>lua require("conform").format({ async = true, lsp_fallback = true })<CR>', 'Format Document' }
    },
    g = {
      name = "Goto diagnostic",
      d = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Previous Diagnostic" },
      D = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Next Diagnostic" },
      e = { "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>", "Previous Error" },
      E = { "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>", "Next Error" },
      w = { "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.WARN})<CR>", "Previous Warning" },
      W = { "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.WARN})<CR>", "Next Warning" },
    }
  }

  local keymap_g = {
    name = "Goto",
    r = { "<cmd>lua vim.lsp.buf.references()<CR>", "Go References" },
    d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go Definition" },
    D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Go Declarantion" },
    s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
    i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Go Implementation" },
    t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Go Type Definition" },
  }

  whichkey.register(keymap_l, { buffer = bufnr, prefix = "<leader>" })
  whichkey.register(keymap_g, { buffer = bufnr, prefix = "g" })
end

return M
