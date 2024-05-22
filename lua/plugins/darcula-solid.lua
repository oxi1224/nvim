return {
  {
    "briones-gabriel/darcula-solid.nvim",
    dependencies = { "rktjmp/lush.nvim" },
    priority = 1000,
    config = function()
      vim.cmd('colorscheme darcula-solid')
      vim.cmd('set termguicolors')
    end,
  }
}