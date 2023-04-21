local M = {}

M.merge_table = function(table1, table2)
  for _, value in ipairs(table2) do
    table1[#table1+1] = value
  end

  return table2
end


M.load_json = function()
  local config_path = vim.fn.stdpath('config')

  local file = io.open(config_path .. "/config.json", 'r')
  local data = file:read('*all')

  file:close()

  return vim.json.decode(data)
end

M.root_pattern_in_root = function(...)
  local patterns = {...}
  local root = vim.loop.cwd()

  for _, pattern in ipairs(patterns) do
    if vim.fn.glob(root .. "/" .. pattern) ~= "" then
      return root
    end
  end

  return nil
end

return M
