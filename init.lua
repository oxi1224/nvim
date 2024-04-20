require("oxi")

-- lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(require("oxi.plugins"))

-- theme
vim.cmd 'colorscheme darcula-solid'
vim.cmd 'set termguicolors'

-- lsp
require('java').setup()

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(_, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)
require('telescope').setup{ defaults = { file_ignore_patterns = {".gradle", "build"} } }

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {"tailwindcss", "tsserver", "eslint", "lua_ls"},
  handlers = {
    ['jdtls'] = function()
      require('lspconfig').jdtls.setup({})
    end,
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end
  }
})

-- Tab as accept in lsp
local cmp = require('cmp')
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    -- confirm completion
    ['<Tab>'] = cmp.mapping.confirm({select = true}),
  })
})

cmp.mapping()

-- tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.wo.relativenumber = true
vim.opt.clipboard="unnamedplus"
