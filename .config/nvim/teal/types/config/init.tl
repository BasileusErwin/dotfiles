local record Settings
end

local record Opts
  noremap: boolean
  silent: boolean
end

local record Map
  key: string
  command: string
  vscode: boolean
end

local record Maps
  insert: {Map}
  normal: {Map}
  visual: {Map}
end

local record Keymap
  opts: Opts
  maps: Maps
end

global record Config
  settings: Settings
  keymaps: Keymap
end
