local status, neogit = pcall(require, "neogit")
if (not status) then return end

neogit.setup {}

vim.keymap.set('n', '<Leader>gt', function() neogit.open() end, { desc = 'Neogit: Open Neogit' })
vim.keymap.set('n', '<Leader>ga', '<CMD>Git add %<CR>', { desc = 'Fugitive: Stage current file' })
