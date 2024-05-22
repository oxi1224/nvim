local M = {}

function M.init()
  require("config.nvim-config").init()
  require("config.remaps").init()
end

return M