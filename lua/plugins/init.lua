local plugins = {}

for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath('config')..'/lua/plugins', [[v:val =~ '\.lua$']])) do
  local name = ('plugins.'..file:gsub('%.lua$', ''))
  if (name ~= "plugins.init") then
    local success, data = pcall(require, name) 
    for _, v in ipairs(data) do
      table.insert(plugins, #plugins, v)
    end
  end
end

return plugins