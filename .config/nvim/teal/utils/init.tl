local type Utils = record
  merge_tables: function(table1: table, table2: table): table
  load_json: function<T>(file_name: string): T
  file_exist: function(file_name: string): boolean
end

local M: Utils = {}

M.merge_tables = function (table1: table, table2: table): table
  for k, v in pairs(table1) do
    table2[k] = v
  end

  return table2
end

M.load_json = function<T>(): T
  local config_path = vim.fn.stdpath('config') as string

  local file = io.open(config_path .. "/config.json", 'r')
  local data = file:read('*all')

  file:close()

  return vim.json.decode(data)
end

M.file_exist = function(file_name: string): boolean
  local file = io.open(file_name, "r")

  if file ~= nil then
    io.close(file)
    return true
  end

  return false
end

return M
