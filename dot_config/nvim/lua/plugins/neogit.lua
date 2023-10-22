local neogit = require('neogit')

neogit.setup {}

vim.keymap.set('n', '<Leader>gt', function() neogit.open() end, { desc = 'Neogit: Open Neogit' })
