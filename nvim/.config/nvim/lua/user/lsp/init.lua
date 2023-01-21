-- local status_ok, lspconfig = pcall(require, "lspconfig")
-- if not status_ok then
-- 	return
-- end
--
-- require("user.lsp.mason")
-- require("user.lsp.handlers").setup()
-- require("user.lsp.null-ls")

-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
require("neodev").setup()
local lsp = require('lsp-zero')
lsp.preset('recommended')

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()
