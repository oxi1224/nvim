return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
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
    },
    config = function ()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = {
            "build\\.*",
            "gradle\\.*",
            "gradlew",
            "gradlew.bat"
          }
        }
      })
    end
  }
}
