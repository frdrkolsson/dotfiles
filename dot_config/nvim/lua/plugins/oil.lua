local status, oil = pcall(require, "oil")
if (not status) then return end

oil.setup({
  view_options = {
    -- Show files and directories that start with "."
    show_hidden = true,
  }
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.keymap.set("n", "_g", function()
  local git_path = vim.fn.finddir(".git", ".;")
  local cd_git = vim.fn.fnamemodify(git_path, ":h")
  vim.api.nvim_command(string.format("edit %s", cd_git))
end, { desc = "edit .git root" })
