local status, neotest = pcall(require, 'neotest')
if (not status) then return end
local kingsLandingPath = 'Glooko/kings%-landing'

neotest.setup({
  adapters = {
    require('neotest-vitest'),
    require("neotest-minitest")({
      test_cmd = function()
        return vim.tbl_flatten({
          "ruby",
          "-Itest",
        })
      end,
    }),
    require("neotest-rspec")({
      rspec_cmd = "./neotest-run-in-docker.sh",
      -- rspec_cmd = function()
      --   return vim.tbl_flatten({
      --     "mutagen-compose",
      --     "exec",
      --     -- "-w", "/app",
      --     "-e", "RAILS_ENV=test",
      --     "-e", "MUTANT=1",
      --     "mutagen-web",
      --     -- "app",
      --     "bundle",
      --     "exec",
      --     "rspec"
      --   })
      -- end,

      -- transform_spec_path = function(path)
      --   local prefix = require('neotest-rspec').root(path)
      --   return string.sub(path, string.len(prefix) + 2, -1)
      -- end,

      -- results_path = "tmp/rspec.output",
      formatter = "json"
    }),
    require('neotest-jest'),
    require('neotest-vim-test')({ allow_file_types = { 'swift' } }),
  },
  discovery = {
    enabled = false,
  },
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
vim.keymap.set('n', '<Leader>tl', neotest.run.run_last, { desc = 'neotest: Run the last test' })
vim.keymap.set('n', '<Leader>tp', neotest.run.stop, { desc = 'neotest: Stop the nearest test' })
vim.keymap.set('n', '<Leader>ta', neotest.run.attach, { desc = 'neotest: Attach to the nearest test' })
vim.keymap.set('n', '<Leader>ts', neotest.summary.toggle, { desc = 'neotest: Toggle test summary from project root' })
vim.keymap.set('n', '<Leader>to', neotest.output_panel.toggle, { desc = 'neotest: Toggle output panel' })
vim.keymap.set('n', '<leader>tw', function() neotest.run.run({ jestCommand = 'jest --watch ' }) end,
  { desc = 'neotest: Run tests in watch mode' })
vim.keymap.set("n", "<leader>tu", function()
    local baseCommand = require('neotest-jest.jest-util').getJestCommand(vim.fn.expand '%:p:h')
    neotest.run.run({ jestCommand = baseCommand .. " --updateSnapshot" })
  end,
  { desc = 'neotest: Run tests with --updateSnapshot' })
