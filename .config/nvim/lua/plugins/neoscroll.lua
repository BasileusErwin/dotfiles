return {
  'karb94/neoscroll.nvim',
  opts = {
    mappings = {},
    hide_cursor = true,          -- Hide cursor while scrolling
    stop_eof = true,             -- Stop at <EOF> when scrolling downwards
    use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
    respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    easing_function = nil,       -- Default easing function
    pre_hook = nil,              -- Function to run before the scrolling animation starts
    post_hook = nil,             -- Function to run after the scrolling animation ends
    performance_mode = false,    -- Disable "Performance Mode" on all buffers.
  },
  config = function(_, opts)
    local neoscroll = require('neoscroll')
    local config = require('neoscroll.config')

    neoscroll.setup(opts)

    local map = {}
    map['<M-j>'] = { 'scroll', { 'vim.wo.scroll', 'true', '10' } }
    map['<M-k>'] = { 'scroll', { '-vim.wo.scroll', 'true', '10' } }

    config.set_mappings(map)
  end
}
