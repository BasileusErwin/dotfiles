local M = {}
local keymap = vim.api.nvim_set_keymap
local buf_keymap = vim.api.nvim_buf_set_keymap

M.setup = function(client, bufnr)
  local opts = { noremap = true, silent = true }

  -- Key mappings
  buf_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)
  keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  keymap("n", "[e", "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>", opts)
  keymap("n", "]e", "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>", opts)
  keymap('n', '<C-S-j>', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

  local status_ok, whichkey = pcall(require, 'which-key')

  if not status_ok then
    return
  end

  local keymap_l = {
    c = {
      name = 'Code',
      r = { '<cmd>lua vim.lsp.buf.rename()<CR>', "Raname" },
      a = { '<cmd>lua vim.lsp.buf.code_action()<CR>', 'Code Action' },
      d = { '<cmd>lua vim.diagnostic.open_float()<CR>', 'Line Diagnostics' },
      i = { '<cmd>LspInfo<CR>', 'Lsp info' },
    },
  }

  if client.server_capabilities.documentFormattingProvider then
    keymap_l.l.f = { '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', 'Format Document' }
  end

  local keymap_g = {
    name = 'Goto',
    r = { '<cmd>lua vim.lsp.buf.references()<CR>', 'Go References' },
    d = { '<cmd>lua vim.lsp.buf.definition()<CR>', 'Go Definition' },
    D = { '<cmd>lua vim.lsp.buf.declaration()<CR>', 'Go Declarantion' },
    s = { '<cmd>lua vim.lsp.buf.signature_help()<CR>', 'Signature Help' },
    i = { '<cmd>lua vim.lsp.buf.implementation()<CR>', 'Go Implementation' },
    t = { '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'Go Type Definition' },
  }

  whichkey.register(keymap_l, { buffer = bufnr, prefix = '<leader>',  })
  whichkey.register(keymap_g, { buffer = bufnr, prefix = 'g' })
end

return M
