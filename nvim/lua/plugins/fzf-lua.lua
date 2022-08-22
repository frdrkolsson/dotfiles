require('fzf-lua').setup {
  -- fzf_bin = 'sk', -- use skim instead of standard fzf
  fzf_opts = {
    ['--layout'] = false,
    ['--border'] = 'rounded',
  },
  winopts = {
    -- split         = "belowright new",-- open in a split instead?
                                        -- "belowright new"  : split below
                                        -- "aboveleft new"   : split above
                                        -- "belowright vnew" : split right
                                        -- "aboveleft vnew   : split left
    -- Only valid when using a float window
    -- (i.e. when 'split' is not defined, default)
    height           = 0.85,            -- window height
    width            = 0.90,            -- window width
    row              = 0.35,            -- window row position (0=top, 1=bottom)
    col              = 0.50,            -- window col position (0=left, 1=right)
    -- border argument passthrough to nvim_open_win(), also used
    -- to manually draw the border characters around the preview
    -- window, can be set to 'false' to remove all borders or to
    -- 'none', 'single', 'double' or 'rounded' (default)
    border = 'rounded',
    preview = {
      vertical       = 'down:45%',      -- up|down:size
      horizontal     = 'right:50%',     -- right|left:size
    },
  }
}
