local status, copilot = pcall(require, "copilot")
if (not status) then return end

copilot.setup({
  suggestion = {
    enabled = true,
    auto_trigger = true,
    keymap = {
      accept = "<Tab>",
      accept_word = false,
      accept_line = false,
      next = "<C-l>",
      prev = "<C-h>",
      dismiss = "<C-k>",
    },
  },
  panel = { enabled = false },
})
