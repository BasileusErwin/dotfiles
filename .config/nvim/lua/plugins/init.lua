local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/package/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone", "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

vim.api.nvim_exec(
    [[
      augroup Packer
      autocmd!
      autocmd BufWritePost plugins.lua PackerCompile
      augroup end
    ]],
    false
)

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

local LSPInstallPlug = ":LspInstall ccls hls rust_analyzer tsserver vimls vuels eslint hls bashls html jsonls sumneko_lua pyright sqls lemminx cssls zls diagnosticls clangd cmake dockerls emmet_ls gopls"

return packer.startup(function(use) 
  
  use 'wbthomason/packer.nvim'

  -- Lines
  use {
    'nvim-lualine/lualine.nvim',
    config = require('plugins.config.lualine')
  }
 use {
    'akinsho/bufferline.nvim', 
    requires = 'kyazdani42/nvim-web-devicons',
    config = require('plugins.config.bufferline')
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
  use "ray-x/lsp_signature.nvim"
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
      "saadparwaiz1/cmp_luasnip",
    },
    config = require('plugins.config.cmp')
  }
  use { 'Saecki/crates.nvim', requires = { 'nvim-lua/plenary.nvim' } }

  -- snippets
  use "L3MON4D3/LuaSnip" 
  use "rafamadriz/friendly-snippets" 

  use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'} 

  -- Treeesitter
  use { 
    'nvim-treesitter/nvim-treesitter', 
    run = { ':TSUpdate' },
    config = require('plugins.config.treesitter')
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Explorer
  use {
    'kyazdani42/nvim-tree.lua',
    config = require('plugins.config.nvim_tree')
  }

  -- Autoclose tags
  use { 'windwp/nvim-ts-autotag' }

  -- CSS color
  use {
    'norcalli/nvim-colorizer.lua',
    config = require('plugins.config.colorize')
  }

  -- Commentary
  use {
    "numToStr/Comment.nvim",
    config = require('plugins.config.comments')
  }

  -- Autopairs
  use { 
    'jiangmiao/auto-pairs',
    config = require('plugins.config.autopairs')
  }

  -- Vim-matchup
  use { 'andymass/vim-matchup' }

  --
  use {'tpope/vim-surround'}

  -- Git integration
  use {
    "lewis6991/gitsigns.nvim",
    config = require('plugins.config.git')
  }
  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = require('plugins.config.telescope')
  }

  use {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = require('plugins.config.indent-blankline')
  }
  use 'mattn/emmet-vim'

  -- Markdown preview
  use {"ellisonleao/glow.nvim"}
  -- Icons
  use {
    'kyazdani42/nvim-web-devicons',
    config = require('plugins.config.icons')
  }

  use {
    'wakatime/vim-wakatime'
  }

  -- Themes
  use { 'navarasu/onedark.nvim' }
  use { 'marko-cerovac/material.nvim' }
  use { 'tomasiser/vim-code-dark' }
  use { 'crusoexia/vim-monokai' }
  use { 'ayu-theme/ayu-vim' }
  use { 'ghifarit53/tokyonight-vim' }
  use 'tiagovla/tokyodark.nvim'
  use { 'dracula/vim', as = 'dracula' }
  use { 'phanviet/vim-monokai-pro' }
end)
