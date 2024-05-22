return {
  {
    "folke/neodev.nvim",
    priority = 100,
    opts = {
      library = {
        enabled = true, -- when not enabled, neodev will not change any settings to the LSP server
        runtime = true, -- runtime path
        types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
        plugins = true, -- installed opt or start plugins in packpath
      },
      setup_jsonls = true,
      override = function(root_dir, options) end,
      pathStrict = true,
    }
  }
}
