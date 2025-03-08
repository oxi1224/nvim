return {
  { "rktjmp/lush.nvim", priority = 1001 },
  {
    "briones-gabriel/darcula-solid.nvim",
    priority = 1000,
    config = function ()
      vim.opt.background = 'dark'
      vim.g.colors_name = 'darcula-solid-custom'

      local lush = require('lush')
      local darcula_solid = require('lush_theme.darcula-solid')
      local spec = lush.extends({darcula_solid}).with(function()
        return {
          IblIndent { fg = "#606060" },
          IblScope { fg = "#757E87"},
          Type { fg = "#d194c7" }
        }
      end)

      lush(spec)
    end
  }
}
