return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = {
      "rafamadriz/friendly-snippets",
      { "L3MON4D3/LuaSnip", version = "v2.*" }
    },
    opts = {
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 100,
          window = { border = 'single' },
        },
        menu = {
          border = 'single',
          draw = { treesitter = { "lsp" } },
        },
        ghost_text = { enabled = true },
      },
      signature = {
        enabled = true,
        window = { border = 'single' },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      snippets = {
        preset = "luasnip",
        -- expand = function(args)
          -- vim.api.nvim_put({ args.body }, "", true, true)
        -- end,
      },
      appearance = { nerd_font_variant = "mono" },
      keymap = {
        preset = "default",
        ["<CR>"] = { "accept", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-Space>"] = { "show" },
        ["<C-d>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },
      },
    },
  },
}
