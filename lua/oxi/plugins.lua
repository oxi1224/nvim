return {
  { "mbbill/undotree" },
  {
    "folke/neodev.nvim", opts = {
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
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>a", function() require("harpoon"):list():add() end },
      { "<C-e>", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end },
      { "<C-h>", function() require("harpoon"):list():select(1) end },
      { "<C-t>", function() require("harpoon"):list():select(2) end },
      { "<C-n>", function() require("harpoon"):list():select(3) end },
      { "<C-s>", function() require("harpoon"):list():select(4) end },
    },
  },
  {
    "briones-gabriel/darcula-solid.nvim",
    dependencies = { "rktjmp/lush.nvim" }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "cpp", "lua", "java", "html", "css", "javascript", "typescript" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
        })
    end
  },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      {
        "<leader>pf",
        function() require("telescope.builtin").find_files() end,
        desc = "Project Find"
      },
      {
        "<C-p>",
        function() require("telescope.builtin").git_files() end,
        desc = "Git Find"
      },
      {
        "<leader>ps",
        function() require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") }) end,
        desc = "Grep"
      },
    }
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({
        renderer = {
          group_empty = true,
        }
      })
    end
  },
  {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
  {'williamboman/mason.nvim'},
  {"williamboman/mason-lspconfig.nvim"},
  {'neovim/nvim-lspconfig'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/nvim-cmp'},
  {'hrsh7th/cmp-buffer'},
  {'L3MON4D3/LuaSnip'},
  {
    'numToStr/Comment.nvim',
    lazy = false
  },
  { 'mfussenegger/nvim-jdtls' },
  { 'tpope/vim-fugitive' }
}
