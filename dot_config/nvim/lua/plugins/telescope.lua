require("telescope").setup({
  defaults = {},
  pickers = {
    file_browser = {
      hidden = true
    },
    find_files = {
      hidden = true,
      find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                   -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true,    -- override the file sorter
      case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    }
  }
})

require('telescope').load_extension('fzf')

vim.keymap.set('n', '<Leader>ff', '<CMD>Telescope find_files<CR>')                                                        -- Search files by name
vim.keymap.set('n', '<Leader>fg', '<CMD>Telescope live_grep<CR>')                                                         -- Search file by content
vim.keymap.set('n', '<Leader>fb', '<CMD>Telescope buffers<CR>')                                                           -- Search files by buffers
vim.cmd([[ nnoremap <leader>g :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR> ]]) -- Search for word under cursor with telescope
