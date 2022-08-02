local status_ok, ayu = pcall(require, 'ayu')
if not status_ok then
  return
end

ayu.setup({
  mirage = false,
  overrides = {
    IncSearch = { fg = '#FFFFFF' }
  }
})
