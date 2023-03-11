return {
  "mfussenegger/nvim-dap",
  event = 'VaryLazy',
  enabled = false,
  dependencies = {
    "theHamsta/nvim-dap-virtual-text",
    "rcarriga/nvim-dap-ui",
    "leoluz/nvim-dap-go",
    "mxsdev/nvim-dap-vscode-js",
    "anuvyklack/hydra.nvim",
    "nvim-telescope/telescope-dap.nvim",
    "rcarriga/cmp-dap",
  },
  config = function()
    require("config.dap").setup()

    local ok_telescope, telescope = pcall(require, "telescope")
    if ok_telescope then
      telescope.load_extension("dap")
    end

    local ok_cmp, cmp = pcall(require, "cmp")
    if ok_cmp then
      cmp.setup.filetype({ "dap-repl", "dapui_watches" }, {
        sources = cmp.config.sources({
          { name = "dap" },
        }, {
          { name = "buffer" },
        }),
      })
    end

    local status_ok, whichkey = pcall(require, 'which-key')
    if status_ok then
      whichkey.register({
        name = "Debug",
        d = { "<cmd>lua require'dap'.toggle_breakpoint()" }
      }, require('config.whichkey').opts)
    end

  end
}
