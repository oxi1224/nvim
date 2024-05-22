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

-- autocompletion
local cmp = require('cmp')
cmp.setup({
  experimental = {
    ghost_text = true,
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp.mapping.confirm({select = true}),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
  }, {
    { name = 'buffer' },
  })
})
cmp.mapping();

-- lsp
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(_, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)
require('telescope').setup{ defaults = { file_ignore_patterns = {".gradle", "build"} } }

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {"tailwindcss", "tsserver", "eslint", "lua_ls", "jdtls"},
  handlers = {
    ['jdtls'] = function() end,
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end
  }
})

-- tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.clipboard="unnamedplus"
vim.o.wrap = false;
