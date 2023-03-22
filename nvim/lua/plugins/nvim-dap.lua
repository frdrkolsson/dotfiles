local status, dap = pcall(require, "dap")
if (not status) then return end

vim.keymap.set('n', '<Leader>tb', dap.toggle_breakpoint, { desc = 'DAP: Toggle breakpoint' })
vim.keymap.set('n', '<Leader>tc', dap.continue, { desc = 'DAP: Continue execution' })
vim.keymap.set('n', '<Leader>tsi', dap.step_into, { desc = 'DAP: Step into' })
vim.keymap.set('n', '<Leader>tso', dap.step_over, { desc = 'DAP: Step over' })
