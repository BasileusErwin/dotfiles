return {
  "ThePrimeagen/refactoring.nvim",
  enabled = false,
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
              "<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>",
              "Extract Function",
            },
            f = {
              "<Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>",
              "Extract Function To File",
            },
            v = {
              "<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>",
              "Extract Variable"
            },
            i = {
              "<Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>",
              "Inline Variable",
            },
          },
        },
        require('config.whichkey').v_opts

      )

      whichkey.register({
          r = {
            name = 'Refactoring',
            b = {
              "<Cmd>lua require('refactoring').refactor('Extract Block')<CR>",
              "Extract Block",
            },
            f = {
              "<Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>",
              "Extract Block To File",
            },
            i = {
              "<Cmd>lua require('refactoring').refactor('Inline Variable')<CR>",
              "Inline Variable",
            }
          },
        },
        require('config.whichkey').opts
      )
    end
  end
}
