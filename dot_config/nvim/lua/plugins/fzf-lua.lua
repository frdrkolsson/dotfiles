local status, fzf = pcall(require, "fzf-lua")
if (not status) then return end

fzf.setup {
  keymap = {
    fzf = {
      ["ctrl-q"] = "select-all+accept",
    }
  };
  previewers = {
    builtin = {
      extensions = {
        -- neovim terminal only supports `viu` block output
        ["png"] = { "viu", "-tb" },
        ["jpg"] = { "viu", "-b" },
      }
    }
  },
}

vim.keymap.set('n', '<Leader>ff', '<CMD>FzfLua files<CR>')     -- Search files by name
vim.keymap.set('n', '<Leader>fg', '<CMD>FzfLua live_grep<CR>') -- Search file by content
vim.keymap.set('n', '<Leader>g', '<CMD>FzfLua grep_cword<CR>') -- Search file by content
vim.keymap.set('n', '<Leader>fb', '<CMD>FzfLua buffers<CR>')   -- Search files by buffers
