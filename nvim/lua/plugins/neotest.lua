local status, neotest = pcall(require, 'neotest')
if (not status) then return end

neotest.setup({
  adapters = {
    require('neotest-vitest'),
    require('neotest-vim-test')({ allow_file_types = { 'swift' } }),
  }
})

vim.keymap.set('n', '<Leader>tf', function() neotest.run.run(vim.fn.expand('%')) end,
  { desc = 'neotest: Run test file' })
vim.keymap.set('n', '<Leader>tr', function() neotest.run.run { suite = true } end,
  { desc = 'neotest: Run the nearest test' })
vim.keymap.set('n', '<Leader>tn', neotest.run.run, { desc = 'neotest: Run the nearest test' })
vim.keymap.set('n', '<Leader>tp', neotest.run.stop, { desc = 'neotest: Stop the nearest test' })
vim.keymap.set('n', '<Leader>ta', neotest.run.attach, { desc = 'neotest: Attach to the nearest test' })
vim.keymap.set('n', '<Leader>ts', neotest.summary.toggle, { desc = 'neotest: Toggle test summary from project root' })
vim.keymap.set('n', '<Leader>to', neotest.output_panel.toggle, { desc = 'neotest: Toggle output panel' })
