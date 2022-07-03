local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/package/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    'git',
    'clone', '--depth', '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
  print 'Installing packer close and reopen Neovim...'
  vim.cmd [[packadd packer.nvim]]
end

vim.api.nvim_exec(
  [[
      augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
      augroup end
    ]],
  true
)

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end,
  },
}

local LSPInstallPlug = ':LspInstall jdtls intelephense ccls hls rust_analyzer tsserver vimls volar eslint hls bashls html jsonls sumneko_lua pyright sqls lemminx cssls zls diagnosticls clangd cmake dockerls emmet_ls gopls'

return packer.startup(function(use)
  use {
    'wbthomason/packer.nvim'
  }

  -- Lines
  use {
    'nvim-lualine/lualine.nvim',
    config = require('plugins.config.lualine')
  }
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    opt = false,
    event = "BufWinEnter",
    branch = "main",
  }
  -- use({
  --   'noib3/nvim-cokeline',
  --   requires = 'kyazdani42/nvim-web-devicons',
  --   config = require('plugins.config.cokeline').setup()
  -- })
  use {
    'stevearc/dressing.nvim',
    opt = false,
    config = require('plugins.config.dressing').setup()
  }
  -- LSP
  use {
    'neovim/nvim-lspconfig',
    config = require('plugins.config.lsp')
  }
  use {
    'williamboman/nvim-lsp-installer',
    config = require('plugins.config.lsp_installer'),
    run = LSPInstallPlug
  }
  use 'onsails/lspkind-nvim'
  use 'ray-x/lsp_signature.nvim'
  use {
    'creativenull/diagnosticls-configs-nvim',
    config = require('plugins.config.diagnosticls')
  }
  use {
    'simrat39/rust-tools.nvim',
    config = require('plugins.config.rust_tool')
  }
  use 'rust-lang/rust.vim'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'MunifTanjim/prettier.nvim'
  use {
    'scalameta/nvim-metals',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  use {
    'StanAngeloff/php.vim'
  }

  use({
    "ghillb/cybu.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = require('plugins.config.cybu').setup()
  })

  -- CMP
  use {
    'hrsh7th/cmp-nvim-lsp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      'saadparwaiz1/cmp_luasnip',
    },
    config = require('plugins.config.cmp').setup()
  }
  use { 'Saecki/crates.nvim', requires = { 'nvim-lua/plenary.nvim' } }

  -- snippets
  use {
    'L3MON4D3/LuaSnip',
    config = require('plugins.config.luasnip')
  }
  use 'rafamadriz/friendly-snippets'

  use { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' }

  -- Treeesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = { ':TSUpdate' },
    config = require('plugins.config.treesitter')
  }
  use {
    'nvim-treesitter/nvim-tree-docs'
  }
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  use {
    'heavenshell/vim-jsdoc',
    run = 'make install'
  }

  -- Explorer
  use {
    'kyazdani42/nvim-tree.lua',
    config = require('plugins.config.nvim_tree').setup(),
    branch = 'master'
  }

  -- Autoclose tags
  use { 'windwp/nvim-ts-autotag' }

  -- CSS color
  use {
    'norcalli/nvim-colorizer.lua',
    opt = false,
    config = require('plugins.config.colorize')
  }

  -- Commentary
  use {
    'numToStr/Comment.nvim',
    opt = false,
    config = require('plugins.config.comments')
  }

  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = require('plugins.config.todo_comments').setup()
  }

  -- Autopairs
  use {
    'jiangmiao/auto-pairs',
    opt = false,
    config = require('plugins.config.autopairs')
  }
  use {
    'alvan/vim-closetag'
  }

  -- Vim-matchup
  use { 'andymass/vim-matchup' }

  --
  use {
    'ur4ltz/surround.nvim',
    opt = false,
    config = require('plugins.config.surround').setup()
  }

  -- 
  use {
    'mg979/vim-visual-multi',
    branch = 'master'
  }

  -- Git integration
  use {
    'lewis6991/gitsigns.nvim',
    opt = false,
    config = require('plugins.config.git')
  }
  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    opt = false,
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    },
    config = require('plugins.config.telescope')
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufRead',
    config = require('plugins.config.indent-blankline'),
    opt = true,
  }
  use 'mattn/emmet-vim'

  -- Markdown preview
  use { 'ellisonleao/glow.nvim' }
  use {
    'iamcco/markdown-preview.nvim',
    opt = false,
    run = 'cd app && yarn install'
  }
  -- Icons
  use {
    'kyazdani42/nvim-web-devicons',
    opt = false,
    config = require('plugins.config.icons')
  }
  use { 'ryanoasis/vim-devicons' }

  use {
    'nathom/filetype.nvim',
    opt = false,
    config = require('plugins.config.filetype')
  }
  use {
    'max397574/better-escape.nvim',
    opt = false,
    config = require('plugins.config.better_escape')
  }

  use {
    'simrat39/symbols-outline.nvim',
    opt = false,
    config = require('plugins.config.simbols_outline')
  }

  use {
    'karb94/neoscroll.nvim',
    opt = false,
    config = require('plugins.config.neoscroll')
  }
  use {
    'mfussenegger/nvim-jdtls',
    opt = false,
  }

  use {
    'jidn/vim-dbml',
    opt = false,
  }

  use {
    'elkowar/yuck.vim'
  }

  -- Themes
  use { 'navarasu/onedark.nvim' }
  use { 'marko-cerovac/material.nvim' }
  use { 'tomasiser/vim-code-dark' }
  use 'tanvirtin/monokai.nvim'
  use { 'ayu-theme/ayu-vim' }
  use { 'ghifarit53/tokyonight-vim' }
  use { 'tiagovla/tokyodark.nvim' }
  use { 'dracula/vim', as = 'dracula' }
  use { 'phanviet/vim-monokai-pro' }
  use { 'arcticicestudio/nord-vim' }
  use {
    'ellisonleao/carbon-now.nvim',
    config = function()
      require('carbon-now').setup()
    end
  }
  use { 'projekt0n/github-nvim-theme' }
  use { 'JoosepAlviste/palenightfall.nvim' }
  use { "VDuchauffour/neodark.nvim" }
  use({
    "catppuccin/nvim",
    as = "catppuccin"
  })
end)
