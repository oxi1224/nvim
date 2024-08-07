local M = {}

function M.init()
  vim.g.mapleader = " "
  vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
  vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
  vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
  vim.keymap.set("n", "<leader>e", function() vim.diagnostic.open_float({ scope="line" }) end)
  vim.keymap.set("n", "<leader>d", vim.lsp.buf.hover)

  vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory "})

  -- Term keybinds
  vim.keymap.set('t', '<esc>', function () require("toggleterm").toggle() end)
  vim.keymap.set('n', '<leader>t', ':ToggleTerm<CR>')

  -- Comment keybinds
  vim.keymap.set("n", "<C-_>", function() require('Comment.api').toggle.linewise.current() end, { noremap = true, silent = true })
  local esc = vim.api.nvim_replace_termcodes(
    '<ESC>', true, false, true
  )
  vim.keymap.set('x', '<C-_>', function()
    vim.api.nvim_feedkeys(esc, 'nx', false)
    require('Comment.api').toggle.linewise(vim.fn.visualmode())
  end)
end

return M
