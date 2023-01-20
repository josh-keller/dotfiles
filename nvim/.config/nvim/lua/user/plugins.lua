local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
  git = {
    clone_timeout = 300, -- Timeout, in seconds, for git clones
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- General Plugins
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use 'nvim-lua/popup.nvim' -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim"
  use "kyazdani42/nvim-web-devicons"
  use 'tpope/vim-repeat' -- Repeat with '.' for additional actions
  use 'tpope/vim-surround' -- Surround objects with quote, brackets, etc
  use 'romainl/vim-cool' -- Handles search highlighting automatically
  use 'wellle/targets.vim' -- More text objects
  use 'steven-liou/console-puts' -- comment plugin
  use "lukas-reineke/indent-blankline.nvim"
  use "moll/vim-bbye"
  use "akinsho/toggleterm.nvim"
  use "lewis6991/impatient.nvim"
  -- use "tpope/vim-vinegar"
  use "folke/which-key.nvim"
  use "ahmedkhalf/project.nvim"
  use "goolord/alpha-nvim"

  -- Colorschemes
  --[[ use "folke/tokyonight.nvim" ]]
  --[[ use "lunarvim/darkplus.nvim" ]]
  use "joshdick/onedark.vim"

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  use { 'petertriho/cmp-git', requires = 'nvim-lua/plenary.nvim' }
  use 'hrsh7th/cmp-cmdline' -- cmdline completions

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use { "williamboman/mason.nvim"}
  use "williamboman/mason-lspconfig.nvim"
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "RRethy/vim-illuminate"

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use 'nvim-telescope/telescope-media-files.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- TreeSitter
  use "nvim-treesitter/nvim-treesitter"
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "p00f/nvim-ts-rainbow"
  use "nvim-treesitter/playground"
  use "nvim-treesitter/nvim-treesitter-textobjects"

  -- Nvim-tree
  use { "kyazdani42/nvim-tree.lua",
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    }
  }


  -- Lualine
  use { "nvim-lualine/lualine.nvim",
    requires = { 'kyazdani42/nvim-web-devicons',
    opt = true }
  }

  -- Bufferline
  use { "akinsho/bufferline.nvim",
    requires = 'kyazdani42/nvim-web-devicons'
  }

  --[[ -- DAP ]]
  --[[ use "mfussenegger/nvim-dap" ]]
  --[[ use "rcarriga/nvim-dap-ui" ]]
  --[[ use "ravenxrz/DAPInstall.nvim" ]]

  -- Git
  use "tpope/vim-fugitive" -- Git integration
  use { "lewis6991/gitsigns.nvim",
    requires = {
      'nvim-lua/plenary.nvim'
    },
  }


  -- Languages
  use "fatih/vim-go"
  use "Raimondi/vim-io"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
