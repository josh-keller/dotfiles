--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- local execute = vim.api.nvim_command

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
end)

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Searching
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

--Decrease update time
vim.opt.updatetime = 250
vim.opt.signcolumn = 'yes'

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.textwidth = 80

-- Set mouse
vim.opt.mouse = 'a'

--Enable break indent
vim.opt.breakindent = true

--Save undo history
vim.opt.undofile = true
-- Remaps

-- Press <esc> to clear search highlighting
vim.cmd("nnoremap <silent><esc> <esc>:nohlsearch<CR>")

--Window commands
vim.cmd("nnoremap <C-h> :wincmd h<CR>")
vim.cmd("nnoremap <C-j> :wincmd j<CR>")
vim.cmd("nnoremap <C-k> :wincmd k<CR>")
vim.cmd("nnoremap <C-l> :wincmd l<CR>")

--System clipboard cut and paste
vim.cmd([[nnoremap <leader>p "+p]])
vim.cmd([[nnoremap <leader>y "+y]])
vim.cmd([[vnoremap <leader>y "+y]])
vim.cmd([[inoremap <A-p> <ESC>"+pa]])

--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- Highlight on yank
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
  false
)

