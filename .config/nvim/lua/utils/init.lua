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

return M
