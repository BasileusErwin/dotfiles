local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/package/start/packer.nvim'

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
      augroup Packer
      autocmd!
      autocmd BufWritePost plugins.lua PackerCompile
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

local load_config = function (package)
   local ok, err = pcall(require, package)
   return ok
end

local LSPInstallPlug = ':LspInstall intelephense ccls hls rust_analyzer tsserver vimls vuels eslint hls bashls html jsonls sumneko_lua pyright sqls lemminx cssls zls diagnosticls clangd cmake dockerls emmet_ls gopls'

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Lines
  use {
    'nvim-lualine/lualine.nvim',
    config = load_config('plugins.config.lualine')
  }
 use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = load_config('plugins.config.bufferline')
  }
  -- LSP
  use {
    'neovim/nvim-lspconfig',
    config = load_config('plugins.config.lsp')
  }
  use {
    'williamboman/nvim-lsp-installer',
    config = load_config('plugins.config.lsp_installer'),
    run = LSPInstallPlug
  }
  use 'onsails/lspkind-nvim'
  use 'ray-x/lsp_signature.nvim'
  use {
    'creativenull/diagnosticls-configs-nvim',
    config = load_config('plugins.config.diagnosticls')
  }
  use {
    'simrat39/rust-tools.nvim',
    config = load_config('plugins.config.rust_tool')
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
    config = load_config('plugins.config.cmp')
  }
  use { 'Saecki/crates.nvim', requires = { 'nvim-lua/plenary.nvim' } }

  -- snippets
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'

  use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}

  -- Treeesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = { ':TSUpdate' },
    config = load_config('plugins.config.treesitter')
  }
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- Explorer
  use {
    'kyazdani42/nvim-tree.lua',
    config = load_config('plugins.config.nvim_tree')
  }

  -- Autoclose tags
  use { 'windwp/nvim-ts-autotag' }

  -- CSS color
  use {
    'norcalli/nvim-colorizer.lua',
    config = load_config('plugins.config.colorize')
  }

  -- Commentary
  use {
    'numToStr/Comment.nvim',
    config = load_config('plugins.config.comments')
  }

  -- Autopairs
  use {
    'jiangmiao/auto-pairs',
    config = load_config('plugins.config.autopairs')
  }
  use {
    'alvan/vim-closetag'
  }

  -- Vim-matchup
  use { 'andymass/vim-matchup' }

  --
  use {'tpope/vim-surround'}

  -- Git integration
  use {
    'lewis6991/gitsigns.nvim',
    config = load_config('plugins.config.git')
  }
  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    },
    config = load_config('plugins.config.telescope')
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufRead',
    config = load_config('plugins.config.indent-blankline')
  }
  use 'mattn/emmet-vim'

  -- Markdown preview
  use {'ellisonleao/glow.nvim'}
  use {
  'iamcco/markdown-preview.nvim',
   run= 'cd app && yarn install'
  }
  -- Icons
  use {
    'kyazdani42/nvim-web-devicons',
    config = load_config('plugins.config.icons')
  }
  use { 'ryanoasis/vim-devicons' }

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
  use { 'arcticicestudio/nord-vim' }
  use {"ellisonleao/carbon-now.nvim", config = function() require('carbon-now').setup() end}
end)
