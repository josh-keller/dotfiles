local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
-- Install packer

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
  false
)

local use = require('packer').use
require('packer').startup(function ()
  use 'wbthomason/packer.nvim' -- Package manager

  -- Colors
  use 'joshdick/onedark.vim'

  -- Git
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns').setup()
    end
  }

  -- Nice to have
  use 'tpope/vim-repeat'   -- Repeat with '.' for additional actions
  use 'tpope/vim-surround' -- Surround objects with quote, brackets, etc
  use 'romainl/vim-cool'   -- Handles search highlighting automatically
  use 'steven-liou/console-puts'  -- comment plugin
  use 'wellle/targets.vim' -- More text objects

  -- Lightline
  use 'itchyny/lightline.vim'

  -- Commenting
  use 'tpope/vim-commentary'
  
  -- Indentation tracking
  use 'lukas-reineke/indent-blankline.nvim'

  -- Tags
  use 'ludovicchabant/vim-gutentags' -- Automatic tags management

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Language Specific
  use { 'fatih/vim-go' }

  -- To Try
  -- * vim-vinegar or vim-dirvish
      -- Enhances or replaces netrw, the file manager
  -- * vim-sleuth
      -- auto-detects the indent rules for your project
  -- 


end)

-- Lighline config
vim.g.lightline = {
  colorscheme = 'onedark',
  active = { left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } } },
  component_function = { gitbranch = 'fugitive#head' },
}

-- Telescope config
require('telescope').load_extension('fzf')
