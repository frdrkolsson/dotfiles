local status, neotest = pcall(require, 'neotest')
if (not status) then return end
local kingsLandingPath = 'Glooko/kings%-landing'

neotest.setup({
  adapters = {
    require('neotest-vitest'),
    require("neotest-rspec")({
      rspec_cmd = "./neotest-run-in-docker.sh",
    }),
    require('neotest-jest')({
      jestCommand = function()
        -- local absolutePathToTest = vim.fn.expand('%:p')
        -- if string.find(absolutePathToTest, kingsLandingPath) then
        --   return 'cd client/ && npm test --'
        -- end
        return 'npm test --'
      end,
      jestConfigFile = 'custom.jest.config.ts',
      env = { CI = true },
      cwd = function(path)
        if string.find(path, kingsLandingPath) then
          local abosultPathToTest = vim.fn.expand('%:p')
          local relativePathToTest = vim.fn.expand('%')
          local cwd = string.gsub(abosultPathToTest, relativePathToTest, '')
          print(cwd)
          return cwd
        end

        return vim.fn.getcwd()
      end,
    }),
    require('neotest-vim-test')({ allow_file_types = { 'swift' } }),
  }
})

vim.keymap.set('n', '<Leader>tf', function()
  local absolutePathToTestFile = vim.fn.expand('%:p')
  local relativeTestFile = vim.fn.expand('%')
  if string.find(absolutePathToTestFile, kingsLandingPath) then
    print()
    relativeTestFile = string.gsub(relativeTestFile, 'client/', '')
  end
  neotest.run.run(relativeTestFile)
end,
  { desc = 'neotest: Run test file' })
vim.keymap.set('n', '<Leader>tr', function() neotest.run.run { suite = true } end,
  { desc = 'neotest: Run the entire suite' })
vim.keymap.set('n', '<Leader>tn', neotest.run.run, { desc = 'neotest: Run the nearest test' })
vim.keymap.set('n', '<Leader>tp', neotest.run.stop, { desc = 'neotest: Stop the nearest test' })
vim.keymap.set('n', '<Leader>ta', neotest.run.attach, { desc = 'neotest: Attach to the nearest test' })
vim.keymap.set('n', '<Leader>ts', neotest.summary.toggle, { desc = 'neotest: Toggle test summary from project root' })
vim.keymap.set('n', '<Leader>to', neotest.output_panel.toggle, { desc = 'neotest: Toggle output panel' })
vim.keymap.set('n', '<leader>tw', function() neotest.run.run({ jestCommand = 'jest --watch ' }) end,
  { desc = 'neotest: Run tests in watch mode' })
