-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

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

  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'

  -- Commenting
  use 'tpope/vim-commentary'

  -- Tags
  use 'ludovicchabant/vim-gutentags' -- Automatic tags management

  --


end)


