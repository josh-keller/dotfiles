local colorscheme = "onedark"

vim.o.termguicolors = true

if colorscheme == "onedark" then
  vim.g.onedark_terminal_italics = 2
end

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
