let s:colors = {
\ "black": { "gui": "#282D40", "cterm": "60", "cterm16": "4" },
\ "red": { "gui": "#FF406F", "cterm": "204", "cterm16": "1" },
\ "light_red": { "gui": "#ff5572", "cterm": "204", "cterm16": "1" },
\ "dark_red": { "gui": "#ff4b67", "cterm": "196", "cterm16": "9" },
\ "green": { "gui": "#B9EB80", "cterm": "114", "cterm16": "2" },
\ "yellow": { "gui": "#FFCA56", "cterm": "180", "cterm16": "3" },
\ "dark_yellow": { "gui": "#FF8664", "cterm": "173", "cterm16": "11" },
\ "blue": { "gui": "#7AA9FF", "cterm": "39", "cterm16": "4" },
\ "purple": { "gui": "#D18CF0", "cterm": "170", "cterm16": "5" },
\ "blue_purple": { "gui": "#939ede", "cterm": "39", "cterm16": "4"},
\ "cyan": { "gui": "#6DDFFF", "cterm": "38", "cterm16": "6" },
\ "white": { "gui": "#d0d0d0", "cterm": "145", "cterm16": "7" },
\ "visual_black": { "gui": "NONE", "cterm": "NONE", "cterm16": "0" },
\ "comment_grey": { "gui": "#697098", "cterm": "59", "cterm16": "15" },
\ "gutter_fg_grey": { "gui": "#4B5263", "cterm": "238", "cterm16": "15" },
\ "cursor_grey": { "gui": "#4E5579", "cterm": "236", "cterm16": "8" },
\ "visual_grey": { "gui": "#4E5579", "cterm": "237", "cterm16": "15" },
\ "menu_grey": { "gui": "#3E4452", "cterm": "237", "cterm16": "8" },
\ "special_grey": { "gui": "#3B4048", "cterm": "238", "cterm16": "15" },
\ "vertsplit": { "gui": "#181A1F", "cterm": "59", "cterm16": "15" },
\ "white_mask_1": { "gui": "#333747", "cterm": "237", "cterm16": "15" },
\ "white_mask_3": { "gui": "#474b59", "cterm": "238", "cterm16": "15" },
\ "white_mask_11": { "gui": "#989aa2", "cterm": "238", "cterm16": "15" }
\}

function! overrides#GetColors()
  let g:palenight_terminal_italics=1

  return s:colors
endfunction
