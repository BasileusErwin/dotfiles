return {
  'mfussenegger/nvim-dap',
  enabled = false,
  dependencies = {
    'theHamsta/nvim-dap-virtual-text',
    'rcarriga/nvim-dap-ui',
    'leoluz/nvim-dap-go',
    'mxsdev/nvim-dap-vscode-js',
    'anuvyklack/hydra.nvim',
    'nvim-telescope/telescope-dap.nvim',
    'rcarriga/cmp-dap',
    'Pocco81/DAPInstall.nvim',
    'mfussenegger/nvim-dap-python',
    'nvim-telescope/telescope-dap.nvim',
  },
  config = function()
    require('config.dap').setup()
  end
}
