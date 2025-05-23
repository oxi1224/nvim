return {
  { 'neovim/nvim-lspconfig' },
  { 'mfussenegger/nvim-jdtls' },
  {
    'VonHeikemen/lsp-zero.nvim', branch = 'v3.x',
    priority = 100,
    config = function()
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()
      lsp_zero.on_attach(function(_, bufnr)
        lsp_zero.default_keymaps({buffer = bufnr})
      end)
    end,
  },
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup({})
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = {"tailwindcss", "eslint", "lua_ls", "jdtls", "clangd", "cmake"},
        handlers = {
          ['jdtls'] = function() end,
          ['pyright'] = function()
            require('lspconfig')['pyright'].setup({
              root_dir = function()
                return vim.fn.getcwd()
              end
            })
          end,
          function(server_name)
            require('lspconfig')[server_name].setup({})
          end,
        }
      })
    end,
  },
}
