return {
  {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function ()
      require("oil").setup({
        win_options = {
          signcolumn = "yes:1"
        }
      })
    end,
    priority = 100
  }
}

