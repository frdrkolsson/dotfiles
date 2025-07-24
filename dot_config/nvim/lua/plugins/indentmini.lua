if true then
  return {}
end

return {
  "nvimdev/indentmini.nvim",
  opts = {},
  config = function()
    local indentmini = require('indentmini')
    indentmini.setup()
    vim.cmd.highlight('IndentLine guifg=#494d64')
  end
}
