local M = {}

_G.dump = function(...)
  print(vim.inspect(...))
end
local packer_bootstrap = false

local conf = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'rounded' })
    end
  },
  compile_on_sync = false,
  transitive_opt = false,
}

local packer_init = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

  if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
      'git',
      'clone', '--depth', '1',
      'https://github.com/wbthomason/packer.nvim',
      install_path,
    }
    print 'Installing packer close and reopen Neovim...'
    -- vim.cmd [[packadd packer.nvim]]
  end
end

local plugins = function(use)
  use({ 'wbthomason/packer.nvim' })

  -- Performance
  use({ "nathom/filetype.nvim" })
  use({ "lewis6991/impatient.nvim" })

  -- Git
  use({
    'TimUntersberger/neogit',
    opt = false,
    requires = 'nvim-lua/plenary.nvim',
    config = require('config.neogit').setup()
  })

  use({
    'folke/which-key.nvim',
    opt = false,
    config = require('config.whichkey').setup()
  })

  -- IndentLine
  use({
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufReadPre',
    opt = false,
    config = require('config.indent_blankline').setup()
  })

  -- Load only when require
  use { 'nvim-lua/plenary.nvim', module = 'plenary' }

  -- Better icons
  use({
    'kyazdani42/nvim-web-devicons',
    module = 'nvim-web-devicons',
    opt = false,
    config = function()
      local status_ok, devicons = pcall(require, 'nvim-web-devicons')

      if not status_ok then
        return
      end

      devicons.setup({ default = true })
    end
  })

  -- Better Comment
  use({
    'numToStr/Comment.nvim',
    opt = false,
    keys = { 'gc', 'gcc', 'gbc' },
    opt = false,
    config = function()
      local status_ok, comment = pcall(require, 'Comment')

      if not status_ok then
        return
      end

      comment.setup({})
    end
  })

  -- Markdown
  use({
    'iamcco/markdown-preview.nvim',
    run = function()
      vim.fn['mkdp#util#install']()
    end,
    ft = 'markdown',
    opt = false,
    cmd = { 'MarkdownPreview' },
  })

  use({
    'nvim-lualine/lualine.nvim',
    event = 'VimEnter',
    opt = false,
    config = require('config.lualine').setup(),
    requires = { 'nvim-web-devicons' },
  })

  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    opt = false,
    event = 'BufRead',
    config = require('config.treesitter').setup(),
  })

  use({
    'SmiteshP/nvim-navic',
    opt = false,
    requires = 'neovim/nvim-lspconfig'
  })

  use({
    'kyazdani42/nvim-tree.lua',
    opt = false,
    requires = { 'kyazdani42/nvim-web-devicons' },
    cmd = { 'NvimTreeToggle', 'NvimTreeClose' },
    config = require('config.nvim_tree').setup()
  })

  use({
    'akinsho/nvim-bufferline.lua',
    opt = false,
    event = 'BufReadPre',
    wants = 'nvim-web-devicons',
    config = require('config.bufferline').setup()
  })

  use({
    'chaoren/vim-wordmotion',
    opt = false,
  })

  use({
    'hrsh7th/cmp-nvim-lsp',
    opt = false,
    requires = {
      'hrsh7th/cmp-buffer',
      'onsails/lspkind-nvim',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      'saadparwaiz1/cmp_luasnip',
      {
        'L3MON4D3/LuaSnip',
        wants = 'friendly-snippets',
        opt = false,
      },
      'rafamadriz/friendly-snippets',
      {
        'tzachar/cmp-tabnine',
        run = './install.sh',
      }
    },
    config = require('config.cmp').setup()
  })

  use {
    'windwp/nvim-ts-autotag',
    wants = 'nvim-treesitter',
    event = 'InsertEnter',
    config = function()
      local status_ok, autotag = pcall(require, 'nvim-ts-autotag')

      if not status_ok then
        return
      end

      autotag.setup { enable = true }
    end,
  }
  use({
    'windwp/nvim-autopairs',
    wants = 'nvim-treesitter',
    module = {
      'nvim-autopairs.completion.cmp',
      'nvim-autopairs'
    },
    config = require('config.autopairs').setup()
  })

  use({
    'neovim/nvim-lspconfig',
    opt = false,
    event = 'BufReadPre',
    wants = { 'nvim-lsp-installer' },
    config = require('config.lsp').setup(),
    requires = {
      {
        'williamboman/mason.nvim',
        opt = false,
        config = require('config.lsp.mason').setup(),
        requires = {
          -- 'williamboman/mason-lspconfig.nvim',
          'WhoIsSethDaniel/mason-tool-installer.nvim'
        }
      },
      'jose-elias-alvarez/null-ls.nvim',
      'b0o/schemastore.nvim',
    }
  })

  use({
    'nvim-telescope/telescope.nvim',
    opt = false,
    config = require('config.telescope').setup(),
    cmd = { 'Telescope' },
    module = 'telescope',
    keys = { '<leader>f', '<leader>p' },
    wants = {
      'plenary.nvim',
      'telescope-fzf-native.nvim',
      'plenary.nvim',
      'telescope-file-browser.nvim',
      'telescope-ui-select.nvim',
    },
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
      }
    },
  })

  use({
    'simrat39/rust-tools.nvim',
    requires = { 'nvim-lua/plenary.nvim', 'rust-lang/rust.vim' },
    module = 'rust-tools',
    ft = { 'rust' },
    config = function()
      local status_ok, rust = pcall(require, 'rust-tools')
      if not status_ok then
        return
      end

      rust.setup()
    end
  })

  use({
    'ray-x/go.nvim',
    ft = { 'go' },
    config = function()
      local status_ok, go = pcall(require, 'go')
      if not status_ok then
        return
      end

      go.setup()
    end
  })

  use({
    'norcalli/nvim-colorizer.lua',
    cmd = 'ColorizerToggle',
    config = require('config.colorize').setup()
  })

  use({
    'max397574/better-escape.nvim',
    config = require('config.better_escape').setup()
  })

  use({
    "ThePrimeagen/refactoring.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" }
    },
    module = { 'refactoring', 'telescope' },
    watch = { 'telescope.nvim' },
    config = require('config.refactoring').setup()
  })

  use({
    'danymat/neogen',
    -- config = 
    cmd = { 'Neogen' },
    module = 'neogen',
  })

  use({
    'mfussenegger/nvim-jdtls',
    ft = { 'java' }
  })

  use({
    'lewis6991/gitsigns.nvim',
    config = require('config.git').setup()
  })

  use({
    'ur4ltz/surround.nvim',
    config = require('config.surround').setup()
  })


  use({
    "akinsho/toggleterm.nvim",
    config = require('config.toggleterm').setup()
  })

  use({ 'navarasu/onedark.nvim' })
  use({ 'marko-cerovac/material.nvim' })
  use({ 'tomasiser/vim-code-dark' })
  use({ 'tanvirtin/monokai.nvim' })
  use({ 'Shatur/neovim-ayu' })
  use({ 'ghifarit53/tokyonight-vim' })
  use({ 'tiagovla/tokyodark.nvim' })
  use({ 'dracula/vim', as = 'dracula' })
  use({ 'phanviet/vim-monokai-pro' })
  use({ 'shaunsingh/nord.nvim' })
  use({ 'ellisonleao/carbon-now.nvim', config = function() require('carbon-now').setup() end })
  use({ 'projekt0n/github-nvim-theme' })
  use({ 'JoosepAlviste/palenightfall.nvim' })
  use({ 'VDuchauffour/neodark.nvim' })
  use({ 'catppuccin/nvim', as = 'catppuccin' })

  if packer_bootstrap then
    print('Restart Neovim required after installation')
    require('packer').sync()
  end
end

M.setup = function()
  local status_ok, packer = pcall(require, 'packer')
  if not status_ok then
    return
  end

  packer_init()

  pcall(require, 'impatient')

  packer.init(conf)
  packer.startup(plugins)
end

return M
