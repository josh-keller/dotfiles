require('plugins')

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.api.nvim_set_keymap('n', '<leader>rn', ':set relativenumber!<CR>', { noremap = true, silent = true })

-- Searching
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

--Decrease update time
vim.opt.updatetime = 250
vim.opt.signcolumn = 'yes'

--Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

--Tab stop and indent
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.textwidth = 80

--Enable break indent
vim.opt.breakindent = true
vim.opt.wrap = false

-- Set mouse
vim.opt.mouse = 'a'

--Save undo history
vim.opt.undofile = true


--Set colorscheme (order is important here)
vim.o.termguicolors = true
vim.g.onedark_terminal_italics = 2
vim.cmd [[colorscheme onedark]]


--Add move line shortcuts
-- vim.api.nvim_set_keymap('n', '<A-j>', ':m .+1<CR>==', { noremap = true})
-- vim.api.nvim_set_keymap('n', '<A-k>', ':m .-2<CR>==', { noremap = true})
-- vim.api.nvim_set_keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { noremap = true})
-- vim.api.nvim_set_keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi', { noremap = true})
-- vim.api.nvim_set_keymap('v', '<A-j>', ':m \'>+1<CR>gv=gv', { noremap = true})
-- vim.api.nvim_set_keymap('v', '<A-k>', ':m \'<-2<CR>gv=gv', { noremap = true})

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

vim.g.gutentags_exclude_filetypes = {'gitcommit','gitconfig','gitrebase','gitsendemail','git'}
vim.g.gutentags_ctags_exclude = {'exclude-pat-one-*', 'exclude-pat-two-*'}
vim.g.gutentags_ctags_extra_args = {'--languages="c,c++"'}

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

