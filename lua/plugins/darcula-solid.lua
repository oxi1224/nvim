return {
  {
    "briones-gabriel/darcula-solid.nvim",
    dependencies = { "rktjmp/lush.nvim" },
    priority = 1000,
    config = function ()
      vim.opt.background = 'dark'
      vim.g.colors_name = 'darcula-solid-tweak'

      local lush = require('lush')
      local darcula_solid = require('lush_theme.darcula-solid')
      local spec = lush.extends({darcula_solid}).with(function()
        return {
          IblIndent { fg = "#606060" },
          IblScope { fg = "#757E87"},
        }
      end)

      lush(spec)
    end
  }
}
