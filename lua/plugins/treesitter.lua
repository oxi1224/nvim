return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        auto_install = true,
        ensure_installed = { "cpp", "java", "lua", "html", "css", "javascript", "typescript", "vimdoc" },
        ignore_install = {},
        sync_install = false,
        highlight = { enable = true, additional_vim_regex_highlighting = true },
        indent = { enable = true },
        modules = {}
      })
    end
  }
}
