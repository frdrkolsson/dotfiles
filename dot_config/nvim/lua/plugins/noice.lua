local status, noice = pcall(require, 'noice')
if (not status) then return end

noice.setup({
  routes = {
    {
      filter = {
        event = "msg_show",
        kind = "",
        find = "written",
      },
      opts = { skip = true },
    },
  },
})
