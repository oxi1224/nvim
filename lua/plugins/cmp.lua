return {
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/cmp-buffer'},
  {'L3MON4D3/LuaSnip'},
  {
    'hrsh7th/nvim-cmp',
    config = function()
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
          ['<C-D>'] = cmp.mapping.open_docs()
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' }, -- For luasnip users.
        }, {
          { name = 'buffer' },
        })
      })
      cmp.mapping();
    end,
  },
}
