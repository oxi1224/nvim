return {
  {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      win_options = {
        signcolumn = "yes:2"
      },
      view_options = {
        show_hidden = true
      }
    },
    priority = 100
  },
  {
    'SirZenith/oil-vcs-status',
    dependencies = { 'stevearc/oil.nvim' },
    config = function ()
      require('oil-vcs-status').setup({
        status_symbol = {
          added                = "+",
          copied               = "󰆏",
          deleted              = "-",
          ignored              = "",
          modified             = "~",
          renamed              = "",
          typechanged          = "󰉺",
          unmodified           = " ",
          unmerged             = "",
          untracked            = "",
          external             = "",

          upstream_added       = "󰈞",
          upstream_copied      = "󰈢",
          upstream_deleted     = "",
          upstream_ignored     = " ",
          upstream_modified    = "󰏫",
          upstream_renamed     = "",
          upstream_typechanged = "󱧶",
          upstream_unmodified  = " ",
          upstream_unmerged    = "",
          upstream_untracked   = " ",
          upstream_external    = "",
        },
        status_priority = {
          upstream_ignored     = 0,
          upstream_untracked   = 1,
          upstream_unmodified  = 2,
          upstream_external    = 2,
          upstream_copied      = 3,
          upstream_renamed     = 3,
          upstream_typechanged = 3,
          upstream_deleted     = 4,
          upstream_modified    = 4,
          upstream_added       = 4,
          upstream_unmerged    = 5,

          ignored              = 10,
          untracked            = 11,
          unmodified           = 12,
          external             = 12,
          copied               = 13,
          renamed              = 13,
          typechanged          = 13,
          deleted              = 14,
          modified             = 14,
          added                = 14,
          unmerged             = 15,
        }
      })

      vim.cmd('highlight! link OilVcsStatusUntracked DiffAdded')
      vim.cmd('highlight! link OilVcsStatusUpstreamUntracked DiffAdded')
    end
  }
}

