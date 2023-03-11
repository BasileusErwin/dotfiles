return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter"
  },
  opts = {
    prompt_func_return_type = {
      go = true,
      java = true,
      cpp = true,
      c = true,
      h = true,
      hpp = true,
      cxx = true,
    },
    prompt_func_param_type = {
      go = true,
      java = true,
      cpp = true,
      c = true,
      h = true,
      hpp = true,
      cxx = true,
    },
    printf_statements = {},
    print_var_statements = {},
  },
  config = function(_, opts)
    require('refactoring').setup(opts)

    local status_ok, whichkey = pcall(require, 'which-key')
    if status_ok then
      whichkey.register({
          r = {
            name = 'Refactoring',
            e = {
              name = "Extract Function",
              "<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>"
            },
            f = {
              name = "Extract Function To File",
              "<Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>"
            },
            v = {
              name = "Extract Variable",
              "<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>"
            },
            i = {
              name = "Inline Variable",
              "<Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>"
            },
          },
        },
        require('config.whichkey').v_opts

      )

      whichkey.register({
          r = {
            name = 'Refactoring',
            b = {
              name = "Extract Block",
              "<Cmd>lua require('refactoring').refactor('Extract Block')<CR>"
            },
            f = {
              name = "Extract Block To File",
              "<Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>"
            },
            i = {
              name = "Inline Variable",
              "<Cmd>lua require('refactoring').refactor('Inline Variable')<CR>"
            }
          },
        },
        require('config.whichkey').opts
      )
    end
  end
}
