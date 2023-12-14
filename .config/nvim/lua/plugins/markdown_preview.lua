return {
  'iamcco/markdown-preview.nvim',
  event = "VeryLazy",
  enabled = false,
  build = function()
    vim.fn['mkdp#util#install']()
  end,
  ft = 'markdown',
  cmd = { 'MarkdownPreview' },
}
