local M = {}

function M.init()
  vim.opt.tabstop = 2
  vim.opt.shiftwidth = 2
  vim.opt.expandtab = true
  vim.opt.smarttab = true
  vim.wo.number = true
  vim.wo.relativenumber = true
  vim.opt.clipboard="unnamedplus"
  vim.o.wrap = false; 
end

return M