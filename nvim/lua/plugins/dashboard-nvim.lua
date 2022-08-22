local home = os.getenv('HOME')
local dashboard = require('dashboard')
dashboard.preview_command = 'bat -p'
dashboard.preview_file_path = home .. '/.config/nvim/static/neovim.cat'
dashboard.preview_file_height = 12
dashboard.preview_file_width = 80
dashboard.custom_center = {
  {icon = '  ',
  desc = 'Recently laset session                  ',
  shortcut = 'SPC s l',
  action ='SessionLoad'},
  {icon = '  ',
  desc = 'Recently opened files                   ',
  action =  'DashboardFindHistory',
  shortcut = 'SPC f h'},
  {icon = '  ',
  desc = 'Find  File                              ',
  action = 'Telescope find_files find_command=rg,--hidden,--files',
  shortcut = 'SPC f f'},
  {icon = '  ',
  desc ='File Browser                            ',
  action =  'Telescope file_browser',
  shortcut = 'SPC f b'},
  {icon = '  ',
  desc = 'Find  word                              ',
  aciton = 'DashboardFindWord',
  shortcut = 'SPC f w'},
  {icon = '  ',
  desc = 'Open Personal dotfiles                  ',
  action = 'Telescope dotfiles path=' .. home ..'/.dotfiles',
  shortcut = 'SPC f d'},
}
